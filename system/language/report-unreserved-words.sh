#!/bin/sh
# Reports the words a project's rule prose uses that the STE dictionary refuses
# and no vocabulary reserves.
#
# Usage, from the project root:
#   waytide/system/language/report-unreserved-words.sh [dictionary-path]
#
# It reads the rule files under the installed packages and under the project's
# own rules, and compares their prose against the ASD-STE100 dictionary and
# against every vocabulary.md in reach. A word the dictionary refuses is
# reported with the alternative the dictionary gives, and with how often the
# prose uses it. A word already reserved in a vocabulary is not reported.
#
# It reads only. It writes nothing and it fetches nothing.
#
# Exit 0 when nothing is unreserved. Exit 1 when something is. Exit 2 when the
# check could not be made, which it says rather than reporting agreement.

set -e

dict=${1:-}
if [ -z "$dict" ]; then
  for candidate in \
    local/reference/ASD-STE100-issue-9-dictionary.txt \
    waytide/local/reference/ASD-STE100-issue-9-dictionary.txt
  do
    [ -f "$candidate" ] && dict=$candidate && break
  done
fi

if [ -z "$dict" ] || [ ! -f "$dict" ]; then
  echo "The check did not happen. The ASD-STE100 dictionary was not found."
  echo "Give its path as the first argument, or put it at"
  echo "  waytide/local/reference/ASD-STE100-issue-9-dictionary.txt"
  echo "The dictionary is ASD's text and no package carries it."
  exit 2
fi

for tree in waytide/system waytide/local/rules system local/rules; do
  [ -d "$tree" ] && trees="$trees $tree"
done

if [ -z "${trees:-}" ]; then
  echo "The check did not happen. No rule tree was found."
  echo "Expected waytide/system/ and waytide/local/rules/, or system/ and local/rules/."
  exit 2
fi

rules=$(find $trees -name '*.md' ! -name 'vocabulary.md' 2>/dev/null | sort)
vocabularies=$(find $trees -name 'vocabulary.md' 2>/dev/null | sort)

if [ -z "$rules" ]; then
  echo "The check did not happen. No rule files were found under:$trees"
  exit 2
fi

# The dictionary's refused entries: a lower-case headword, its part of speech,
# and the approved alternative that replaces it.
awk '
  match($0, /^[a-z]+ \((n|v|adj|adv|prep|conj|pron|art|int)\)/) {
    head = $1
    rest = substr($0, RLENGTH + 1)
    sub(/^[ \t]+/, "", rest)
    sub(/[ \t][ \t]+.*/, "", rest)
    if (rest == "") rest = "a different sentence construction"
    if (!(head in seen)) { seen[head] = 1; print head "\t" rest }
  }
' "$dict" | sort -u > /tmp/ete-refused.$$

# The dictionary's approved entries, so an approved word is never reported.
awk '
  match($0, /^[A-Z]+[,]? \((n|v|adj|adv|prep|conj|pron|art|int)\)/) {
    head = $1
    sub(/,$/, "", head)
    print tolower(head)
  }
' "$dict" | sort -u > /tmp/ete-approved.$$

# Every term any vocabulary reserves, from a bold-led bullet or a table row.
if [ -n "$vocabularies" ]; then
  cat $vocabularies
else
  :
fi | awk '
  /^[ \t]*-[ \t]+\*\*/ || /^\|[ \t]*\*\*/ {
    line = $0
    while (match(line, /\*\*[^*]+\*\*/)) {
      term = substr(line, RSTART + 2, RLENGTH - 4)
      print tolower(term)
      line = substr(line, RSTART + RLENGTH)
    }
  }
' | tr -d '`' | sort -u > /tmp/ete-reserved.$$

# The prose, with code fences, inline code, headings, tables, block quotes, and
# provenance footers removed, reduced to one lower-case word per line.
cat $rules | awk '
  /^```/ { fence = !fence; next }
  fence { next }
  /^#/ { next }
  /^\|/ { next }
  /^>/ { next }
  /^(Authored|Changed) by / { next }
  { gsub(/`[^`]*`/, " "); print }
' | tr 'A-Z' 'a-z' | tr -cs "a-z'-" '\n' | grep -E '^[a-z][a-z'\''-]+$' | sort | uniq -c \
  | awk '{ print $2 "\t" $1 }' | sort > /tmp/ete-prose.$$

# A refused word the prose uses and no vocabulary reserves.
join -t "$(printf '\t')" /tmp/ete-prose.$$ /tmp/ete-refused.$$ \
  | sort -u > /tmp/ete-used-refused.$$

join -t "$(printf '\t')" -v 1 /tmp/ete-used-refused.$$ /tmp/ete-reserved.$$ \
  | sort -t "$(printf '\t')" -k1,1 > /tmp/ete-unreserved.$$

# A word approved in one part of speech and refused in another is a different
# question, under STE Rule 1.2, so it is reported apart.
join -t "$(printf '\t')" -v 1 /tmp/ete-unreserved.$$ /tmp/ete-approved.$$ \
  | sort -t "$(printf '\t')" -k2,2nr -k1,1 > /tmp/ete-refused-outright.$$
join -t "$(printf '\t')" -o 1.1,1.2,1.3 /tmp/ete-unreserved.$$ /tmp/ete-approved.$$ \
  | sort -t "$(printf '\t')" -k2,2nr -k1,1 > /tmp/ete-part-of-speech.$$

outright=$(wc -l < /tmp/ete-refused-outright.$$ | tr -d ' ')
crossed=$(wc -l < /tmp/ete-part-of-speech.$$ | tr -d ' ')
words=$(wc -l < /tmp/ete-prose.$$ | tr -d ' ')
reserved=$(wc -l < /tmp/ete-reserved.$$ | tr -d ' ')

echo "Unreserved words"
echo
echo "  Dictionary:   $dict"
echo "  Rule files:   $(echo "$rules" | wc -l | tr -d ' ')"
echo "  Vocabularies: $(echo "$vocabularies" | wc -l | tr -d ' '), reserving $reserved terms"
echo "  Distinct words in the prose: $words"
echo

if [ "$outright" -eq 0 ] && [ "$crossed" -eq 0 ]; then
    echo "Every word the dictionary refuses is reserved in a vocabulary."
  rm -f /tmp/ete-*.$$
  exit 0
fi

if [ "$outright" -gt 0 ]; then
    echo "Refused in every part of speech, and reserved by no vocabulary: $outright"
    echo "Each is a word to reserve in a vocabulary, or prose to rewrite."
  echo
  printf '%6s  %-22s%s\n' "uses" "word" "the dictionary gives"
  awk -F'\t' '{ printf "%6s  %-22s%s\n", $2, $1, $3 }' /tmp/ete-refused-outright.$$
  echo
fi

if [ "$crossed" -gt 0 ]; then
  echo "Approved in one part of speech and refused in another: $crossed"
  echo "Read each use. STE Rule 1.2 asks which part of speech the prose is in."
  echo
  printf '%6s  %-22s%s\n' "uses" "word" "the refused sense gives"
  awk -F'\t' '{ printf "%6s  %-22s%s\n", $2, $1, $3 }' /tmp/ete-part-of-speech.$$
fi

rm -f /tmp/ete-*.$$
exit 1
