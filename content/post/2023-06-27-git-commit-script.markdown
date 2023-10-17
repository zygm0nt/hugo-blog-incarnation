---
title: "git-commit script"
date: 2023-06-27T00:00:00Z
url: /2023/06/27/git-commit-script
draft: false
comments: true
categories: 
    - it
    - git 
    - shell
    - fzf

---
The organization I work in, has this practice of annotating commit messages with ticket numbers. From what I know this tends to be quite a common them all around the IT industry. It serves the purpose of accountability for future checks, current information for others on what the commit is actually about, etc. 
There may be many more things to add here - as an adventage of such a 

Some time ago I've started using this small snippet of code as my `pre-commit` hook. It's main purpose is to free me from remembering or checking which JIRA ticket should I prepend to my Git message.



```bash
#!/bin/bash
# To enable this hook, rename this file to "prepare-commit-msg".

GO_JIRA=~/go/bin/jira
FZF=fzf
export JIRA_PROJECT=XYZ

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2
SHA1=$3


if [ ! -e $GO_JIRA ]; then 
    exit
fi

if [ ! command -v $FZF ]; then
    exit
fi

trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}

COMMIT_TYPE=`cat <<EOF
   Add = Create a capability e.g. feature, test, dependency.
   Drop = Delete a capability e.g. feature, test, dependency.
   Fix = Fix an issue e.g. bug, typo, accident, misstatement.
   Bump = Increase the version of something e.g. a dependency.
   Make = Change the build process, or tools, or infrastructure.
   Start = Begin doing something; e.g. enable a toggle, feature flag, etc.
   Stop = End doing something; e.g. disable a toggle, feature flag, etc.
   Optimize = A change that MUST be just about performance, e.g. speed up code.
   Document = A change that MUST be only in the documentation, e.g. help files.
   Refactor = A change that MUST be just refactoring.
   Reformat = A change that MUST be just format, e.g. indent line, trim space, etc.
   Rephrase = A change that MUST be just textual, e.g. edit a comment, doc, etc.
EOF`

current_tasks=`$GO_JIRA list --template list --query "resolution = unresolved and assignee=currentuser() and project = $JIRA_PROJECT ORDER BY priority asc, created"`

TICKET_NUM=`echo "$current_tasks" | $FZF |awk -F: '{print $1 }'`
CHOSEN_COMMIT_TYPE=`echo "$COMMIT_TYPE" | $FZF | awk -F= '{ print $1 }'`

CURRENT_COMMIT_MSG=`cat $COMMIT_MSG_FILE`

$GO_JIRA login

echo "$TICKET_NUM | `trim $CHOSEN_COMMIT_TYPE` | $CURRENT_COMMIT_MSG"  > $COMMIT_MSG_FILE

```

Aside from it's main function, there's also an auxilary thing that I add here. There is this notion of "good commit message". So that it's not something cryptic, dummy or non-informative. This, too, is quite a big obstacle in tech companies. The places I've worked at rarely had any longer commit messages than two lines, and perhaps it's for a reason. Since commits are already connected with tickets in some external system - why bother to duplicate the content here? 
Right, but what about implementation details, important considerations, thought process. Still, not that common to see in the wild. At least for me. 
With the whole block of different types of commits I try to make the commits as atomic as possible, do just one thing. Or at least as few things as possible. If the commit is about docummentation, then let it change just that. If that's a fix for a previously commited buggy commit - so be it, mark it with "Fix".

## Tools I use here:

- [go-jira](https://github.com/go-jira/jira) - because my organization's ticketing system is Jira, but it can be anything else, 
- [fzf](https://github.com/junegunn/fzf) - a brilliant CLI tool to quickly sift through data

## How to use
1. install tools, `go-jira` and `fzf`
2. setup `$JIRA_PROJECT` in the script
3. copy the script to `.git/hooks/prepare-commit-msg` in your repo
4. enjoy

I use it in all my work-related projects and it may become somewhat hard to track changes in the script if I'd copy it all over the place, to all the different `hooks` directories. That's why I keep the main file in my home dir, under `~/prepare-commit-msg` and then in places I want to use it I add just the symbolic link to it:

```sh
$ cd .git/hooks
$ ln -s ~/prepare-commit-msg prepare-commit-msg
```

