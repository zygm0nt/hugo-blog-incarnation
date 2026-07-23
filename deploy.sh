#!/bin/bash

set -euo pipefail

# Run from the project root regardless of where the script is invoked from.
cd "$(dirname "$0")"

HUGO=${HUGO:-hugo}

echo -e "\033[0;32mDeploying updates to GitHub Pages...\033[0m"

# public/ is checked out via its recorded submodule commit, which leaves it in
# detached HEAD state. Get it onto master so the commit we make below is a
# real, pushable branch commit instead of an orphaned one.
git -C public checkout master
git -C public pull --ff-only origin master

# Clear tracked files from public/ so stale/orphaned pages don't linger (keeps .git intact).
git -C public rm -rf --ignore-unmatch --quiet .

# Build the project. buildDrafts/buildFuture are forced off here regardless of
# config.yaml's buildDrafts:true, so drafts/future posts never go live.
${HUGO} --minify --buildDrafts=false --buildFuture=false

# Go To Public folder
cd public

# Add changes to git.
git add -A

if git diff --cached --quiet; then
  echo "Nothing to deploy, public/ already up to date."
  cd ..
  exit 0
fi

# Commit changes.
msg="rebuilding site $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
if [ $# -eq 1 ]; then
  msg="$1"
fi
git commit -m "$msg"

# Push the build to GitHub Pages.
git push origin master

# Come Back up to the Project Root
cd ..

# Record the new public/ commit in the superproject so `git submodule status`
# stays in sync with what was actually deployed. Not pushed automatically.
git add public
git commit -m "update submodule pointer after deploy"
