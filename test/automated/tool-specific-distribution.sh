#!/bin/sh
# The default distribution installs seven packages, and the Ruby distribution installs those
# seven and the Ruby package.
#
# Usage:
#
#   test/automated/tool-specific-distribution.sh
#
# Run from the repository root.
#
# The two halves are read differently, and deliberately.
#
# The composite's installer is read offline, against package repositories split out of this
# repository. A failure there is this repository's.
#
# The Ruby installer is read end to end, over the network, from the address a person
# actually types. It fetches the composite's installer from raw master, so it reads what is
# published rather than what is here. **It fails until this work is on master and
# published**, and that is not a defect in the test.
set -e

repository=$(pwd)

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Controls -------------------------------------------------------------------

# One bare repository per package, split out of this repository, so the installer fetches
# the content it would fetch in use without reaching the network.
control_origin="$tmp/origin"
mkdir -p "$control_origin"

# The split is pushed into an empty bare repository as its master, rather than cloned.
# A bare clone copies every branch, so the control's master would be this repository's
# master and the installer would fetch the whole composite under a package's name.
for package in foundation language testing design-by-efferent git versioning journal; do
  git subtree split --prefix="system/$package" -b split-tmp >/dev/null 2>&1
  git init --quiet --bare "$control_origin/$package.git"
  git push --quiet "$control_origin/$package.git" split-tmp:master
  git branch -D split-tmp >/dev/null 2>&1
done

control_base_project="$tmp/base"
git init --quiet "$control_base_project"
git -C "$control_base_project" commit --quiet --allow-empty -m "Repository is initialized"

control_ruby_project="$tmp/ruby"
git init --quiet "$control_ruby_project"
git -C "$control_ruby_project" commit --quiet --allow-empty -m "Repository is initialized"

# The default distribution installs seven packages ------------------------------

cp "$repository/install-all.sh" "$control_base_project/install-all.sh"

(
  cd "$control_base_project"
  WAYTIDE_ORIGIN="$control_origin" sh install-all.sh >/dev/null 2>&1
)

base_packages=$(cd "$control_base_project/waytide/system" && ls)

base_expected="design-by-efferent
foundation
git
journal
language
testing
versioning"

if [ "$base_packages" != "$base_expected" ]; then
  echo "The default distribution installed:"
  echo "$base_packages" | sed 's|^|  |'
  echo "Expected:"
  echo "$base_expected" | sed 's|^|  |'
  echo "1 failed, 0 aborted"
  exit 1
fi

# The Ruby distribution installs those seven and the Ruby package ---------------

(
  cd "$control_ruby_project"
  curl -sSfL -O https://raw.githubusercontent.com/waytide/tools-ruby-lang/master/install.sh
  WAYTIDE_ORIGIN=https://github.com/waytide sh install.sh >/dev/null 2>&1
)

ruby_packages=$(cd "$control_ruby_project/waytide/system" && ls)

ruby_expected="design-by-efferent
foundation
git
journal
language
testing
tools
versioning"

if [ "$ruby_packages" != "$ruby_expected" ]; then
  echo "The Ruby distribution installed:"
  echo "$ruby_packages" | sed 's|^|  |'
  echo "Expected:"
  echo "$ruby_expected" | sed 's|^|  |'
  echo "1 failed, 0 aborted"
  exit 1
fi

ruby_package=$(cd "$control_ruby_project/waytide/system/tools" && ls)

if [ "$ruby_package" != "ruby-lang" ]; then
  echo "waytide/system/tools/ holds: $ruby_package"
  echo "Expected: ruby-lang"
  echo "1 failed, 0 aborted"
  exit 1
fi

echo "0 failed, 0 aborted"
