Title: Git CLI Pager Behavior Oddity
Date: 2018-04-14 1:30
Category: Code
Tags: linux, workstation, development
Slug: git-cli-pager-behavior-oddity
Authors: Jose
Summary: Observing and fixing different default behaviors in the git cli tools.

This might be a testament to just how infrequently I update tools on my workstation that are functioning as expected - but I've just noticed for the first time that running commands such as `git branch` will load the results in a pager (less in my case). Granted, now I don't remember the original functionality, but I *think* it would just page to STDOUT. And damnit, that's exactly what I want.

Luckily the internet agrees, and [stack overflow](https://stackoverflow.com/questions/48341920/git-branch-command-behaves-like-less) has the answers (no surprise there). For my own sake, I'm documenting the change here for reference - it amounts to running this:

```
git config --global pager.branch false
```

Simple enough - and I've only noticed this behavior with the `branch` sub-command for now but if it should affect multiple commands I'll surely be looking for the all-encompassing method of turning this off.
