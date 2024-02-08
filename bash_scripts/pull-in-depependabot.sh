#! /bin/bash

function find-active-dependabot-branches() {
  gh pr list --author "app/dependabot" --state open --json="headRefName" --template='{{range .}}{{.headRefName}}{{" "}}{{end}}'
}

function merge-all-branches() {
  BRANCHES=$@

  for BRANCH in ${BRANCHES[@]}; do
    echo $BRANCH
    git merge "origin/$BRANCH"
  done
}

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
REMOTE_NAME="$(git remote)"
DEFAULT_BRANCH="$(git remote show $REMOTE_NAME | grep 'HEAD branch' | cut -d' ' -f5)"

if [ "$CURRENT_BRANCH" = "$DEFAULT_BRANCH" ]; then
  echo "Expected to be on a non-default branch"
  exit 1
else
  DEPENDABOT_BRANCHES=($(find-active-dependabot-branches))

  if [ -z "${DEPENDABOT_BRANCHES}" ]; then
    echo "No active Dependabot branches"
    exit 1
  else
    merge-all-branches $(echo ${DEPENDABOT_BRANCHES[@]})
  fi
fi
