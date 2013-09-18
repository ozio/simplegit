Simple Git
==========

Simple aliases for Git. Usage of git starting with `g`. After `g` you can use any known commands of git (`g push`, `g pull`, etc.).

This alias function includes other alias links, like `g a` for `git add`, `g p` for `git pull` and others. If you want to write branch name, `m` is standart alias for `master`, `o` is for `origin` and `f branch_name` is for `feature/branch_name`.

Install
-------
1. Clone repo in `~/` folder
2. Add string `source ~/simplegit/simplegit.sh` to `~/.bashrc`

Examples
--------

    > g a .
    git add .

    > g b a
    git branch -a

    > g c m
    git checkout master

    > g c f m
    git checkout feature/master

    > g c m fix
    git commit -m "fix"

    > g c b new_branch
    git checkout -b new_branch

    > g d
    git diff

    > g f
    git fetch

    > g l
    git log

    > g m m
    git merge master

    > g p
    git pull

    > g p r
    git pull --rebase

    > g p o m
    git push origin master

    > g p u o f new_branch
    git push -u origin feature/new_branch

    > g r
    git reset

    > g r h h
    git reset ^HEAD --hard

    > g s
    git status

    > g st
    git stash

    > g st a
    git stash apply

    > g st p
    git stash pop

    > g v
    git version
