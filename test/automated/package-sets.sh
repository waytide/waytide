#!/bin/sh
# install takes a list of names, and a name is a package set or a package.
#
# Usage:
#
#   test/automated/package-sets.sh
#
# Run from the repository root.
#
# Three outcomes. Named with no arguments the installer places the default set, which is the
# behaviour that existed before package sets and must not break. Named a package set it places
# that set and nothing else. Named packages it places those and nothing else.
#
# It runs offline. Each package is split out of this repository into a bare repository and the
# installer is pointed at them with WAYTIDE_ORIGIN, so nothing reaches the network and the
# content installed is the content this repository holds.
set -e

repository=$(pwd)

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Controls -------------------------------------------------------------------

# The split is pushed into an empty bare repository as its master rather than cloned. A bare
# clone copies every branch, so the control's master would be this repository's master and the
# installer would fetch the whole composite under a package's name.
control_origin="$tmp/origin"
mkdir -p "$control_origin"

for package in foundation language testing design-by-efferent git versioning journal; do
  git subtree split --prefix="system/$package" -b split-tmp >/dev/null 2>&1
  git init --quiet --bare "$control_origin/$package.git"
  git push --quiet "$control_origin/$package.git" split-tmp:master
  git branch -D split-tmp >/dev/null 2>&1
done

# A scratch project per outcome, so one run cannot leave state for the next.
project() {
  path="$tmp/$1"
  git init --quiet "$path"
  git -C "$path" commit --quiet --allow-empty -m "Repository is initialized"
  cp "$repository/install" "$path/install"
  printf '%s' "$path"
}

installed() {
  ( cd "$1/waytide/system" && ls ) | tr '\n' ' ' | sed 's/ $//'
}

fail() {
  echo "$1"
  echo "  installed: $2"
  echo "  expected:  $3"
  echo "1 failed, 0 aborted"
  exit 1
}

# No arguments installs the default set ---------------------------------------

control_default=$(project default)

( cd "$control_default" && WAYTIDE_ORIGIN="$control_origin" sh install >/dev/null 2>&1 )

default_installed=$(installed "$control_default")
default_expected="design-by-efferent foundation git journal language testing versioning"

[ "$default_installed" = "$default_expected" ] ||
  fail "No arguments did not install the default set." "$default_installed" "$default_expected"

# A package set installs that set --------------------------------------------

control_content=$(project content)

( cd "$control_content" && WAYTIDE_ORIGIN="$control_origin" sh install content >/dev/null 2>&1 )

content_installed=$(installed "$control_content")
content_expected="foundation git journal language versioning"

[ "$content_installed" = "$content_expected" ] ||
  fail "The content set did not install its packages." "$content_installed" "$content_expected"

# Packages named install those packages ---------------------------------------

control_named=$(project named)

( cd "$control_named" && WAYTIDE_ORIGIN="$control_origin" sh install foundation git >/dev/null 2>&1 )

named_installed=$(installed "$control_named")
named_expected="foundation git"

[ "$named_installed" = "$named_expected" ] ||
  fail "Named packages did not install those packages." "$named_installed" "$named_expected"

echo "0 failed, 0 aborted"
