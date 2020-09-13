# alias
alias g a = git add --all
alias g ai = git add -i
#############
alias g ap = git apply
alias g as = git apply --stat
alias g ac = git apply --check
#############
alias g ama = git am --abort
alias g amr = git am --resolved
alias g ams = git am --skip
#############
alias g b = git branch
alias g ba = git branch -a
alias g bd = git branch -d
alias g bdd = git branch -D
alias g br = git branch -r
alias g bc = git rev-parse --abbrev-ref HEAD
alias g bu = !git rev-parse --abbrev-ref --symbolic-full-name "@{u}"
alias g bs = !git-branch-status
#############
alias g c = git commit
alias g ca = git commit -a
#ca = !git add -A && git commit -av # Commit all changes
alias g cm = git commit -m
alias g cam = git commit -am
alias g cem = git commit --allow-empty -m
alias g cd = git commit --amend
alias g cad = git commit -a --amend
alias g ced = git commit --allow-empty --amend
alias g amend = git commit --amend --reuse-message=HEAD # Amend the currently staged files to the latest commit
#############
alias g cl = git clone --recursive
alias g cld = git clone --depth 1
alias g clg = !sh -c 'git clone git://github.com/$1 $(basename $1)' -
alias g clgp = !sh -c 'git clone git@github.com:$1 $(basename $1)' -
alias g clgu = !sh -c 'git clone git@github.com:$(git config --get user.username)/$1 $1' -
#############
alias g cp = git cherry-pick
alias g cpa = git cherry-pick --abort
alias g cpc = git cherry-pick --continue
#############
alias g dp = git diff --patience
alias g dc = git diff --cached
alias g dk = git diff --check
alias g dck = git diff --cached --check
alias g dt = git difftool
alias g dct = git difftool --cached
alias g d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"           # Show the diff between the latest commit and the current state
alias g di = !"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d" # `git di $number` shows the diff between the state `$number` revisions ago and the current state
alias g dm = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d"                          # Remove branches that have already been merged with master
#############
alias g f = git fetch
alias g fo = git fetch origin
alias g fu = git fetch upstream
#############
alias g fp = git format-patch
#############
alias g fk = git fsck
#############
alias g fc = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S$1; }; f"      # Find commits by source code
alias g fm = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --grep=$1; }; f" # Find commits by commit message
alias g fb = "!f() { git branch -a --contains $1; }; f"                                                                                          # Find branches containing commit
alias g ft = "!f() { git describe --always --contains $1; }; f"                                                                                  # Find tags containing commit
#############
alias g g = grep -p
alias g go = "!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f" # Switch to a branch, creating it if necessary
#############
alias g l = log --pretty=oneline -n 20 --graph --abbrev-commit # View abbreviated SHA, description, and history graph of the latest 20 commits
alias g lg = log --oneline --graph --decorate
#############
alias g ls = ls-files
alias g lsf = !git ls-files | grep -i
#############
alias g m = git merge
alias g ma = git merge --abort
alias g mc = git merge --continue
alias g ms = git merge --skip
#############
alias g o = git checkout
alias g om = git checkout master
alias g ob = git checkout -b
alias g opr = !sh -c 'git fo pull/$1/head:pr-$1 && git o pr-$1'
#############
alias g pr = git prune -v
#############
alias g ps = git push
alias g psf = git push -f
alias g psu = git push -u
alias g pst = git push --tags
#############
alias g pso = git push origin
alias g psao = git push --all origin
alias g psfo = git push -f origin
alias g psuo = git push -u origin
#############
alias g psom = git push origin master
alias g psaom = git push --all origin master
alias g psfom = git push -f origin master
alias g psuom = git push -u origin master
alias g psoc = !git push origin $(git bc)
alias g psaoc = !git push --all origin $(git bc)
alias g psfoc = !git push -f origin $(git bc)
alias g psuoc = !git push -u origin $(git bc)
alias g psdc = !git push origin :$(git bc)
#############
alias g pl = git pull --recurse-submodules
alias g pb = git pull --rebase
#############
alias g plo = git pull origin
alias g pbo = git pull --rebase origin
alias g plom = git pull origin master
alias g ploc = !git pull origin $(git bc)
alias g pbom = git pull --rebase origin master
alias g pboc = !git pull --rebase origin $(git bc)
#############
alias g plu = git pull upstream
alias g plum = git pull upstream master
alias g pluc = !git pull upstream $(git bc)
alias g pbum = git pull --rebase upstream master
alias g pbuc = !git pull --rebase upstream $(git bc)
#############
alias g rb = git rebase
alias g rba = git rebase --abort
alias g rbc = git rebase --continue
alias g rbi = git rebase --interactive
alias g rbs = git rebase --skip
alias g reb = "!r() { git rebase -i HEAD~$1; }; r" # Interactive rebase with the given number of latest commits
#############
alias g re = git reset
alias g rh = git reset HEAD
alias g reh = git reset --hard
alias g rem = git reset --mixed
alias g res = git reset --soft
alias g rehh = git reset --hard HEAD
alias g remh = git reset --mixed HEAD
alias g resh = git reset --soft HEAD
alias g rehom = git reset --hard origin/master
#############
alias g r = git remote
alias g ra = git remote add
alias g rr = git remote rm
alias g rv = git remote -v
alias g rn = git remote rename
alias g rp = git remote prune
alias g rs = git remote show
alias g rao = git remote add origin
alias g rau = git remote add upstream
alias g rro = git remote remove origin
alias g rru = git remote remove upstream
alias g rso = git remote show origin
alias g rsu = git remote show upstream
alias g rpo = git remote prune origin
alias g rpu = git remote prune upstream
#############
alias g rmf = rm -f
alias g rmrf = rm -r -f
#############
alias g s = git status -s
alias g sb = git status -s -b
#############
alias g sa = git stash apply
alias g sc = git stash clear
alias g sd = git stash drop
alias g sl = git stash list
alias g sp = git stash pop
alias g ss = git stash save
alias g ssk = git stash save -k
alias g sw = git stash show
alias g st = !git stash list | wc -l 2>/dev/null | grep -oEi '[0-9][0-9]*'
#############
alias g t = git tag
alias g td = git tag -d
alias g retag = "!r() { git tag -d $1 && git push origin :refs/tags/$1 && git tag $1; }; r" # Remove the old tag with this name and tag the latest commit with it.
#############
alias g w = git show
alias g wp = git show -p
alias g wr = git show -p --no-color
#############
alias g svnr = git svn rebase
alias g svnd = git svn dcommit
alias g svnl = git svn log --oneline --show-commit
#############
alias g subadd = !sh -c 'git submodule add git://github.com/$1 $2/$(basename $1)' -
alias g subrm = !sh -c 'git submodule deinit -f -- $1 && rm -rf .git/modules/$1 && git rm -f $1' -
alias g subup = git submodule update --init --recursive
alias g subpull = !git submodule foreach git pull --tags origin master
#############
alias g assume = git update-index --assume-unchanged
alias g unassume = git update-index --no-assume-unchanged
alias g assumed = !git ls -v | grep ^h | cut -c 3-
alias g unassumeall = !git assumed | xargs git unassume
alias g assumeall = !git status -s | awk {'print $2'} | xargs git assume
#############
alias g bump = !sh -c 'git commit -am \"Version bump v$1\" && git psuoc && git release $1' -
alias g release = !sh -c 'git tag v$1 && git pst' -
alias g unrelease = !sh -c 'git tag -d v$1 && git pso :v$1' -
alias g merged = !sh -c 'git o master && git plom && git bd $1 && git rpo' -
#aliases = !git config -l | grep alias | cut -c 7-
alias g aliases = git config --get-regexp alias
alias g snap = !git stash save 'snapshot: $(date)' && git stash apply 'stash@{0}'
alias g bare = !sh -c 'git symbolic-ref HEAD refs/heads/$1 && git rm --cached -r . && git clean -xfd' -
alias g whois = !sh -c 'git log -i -1 --author=\"$1\" --pretty=\"format:%an <%ae>\"' -
alias g serve = daemon --reuseaddr --verbose --base-path=. --export-all ./.git
#############
alias g behind = !git rev-list --left-only --count $(git bu)...HEAD
alias g ahead = !git rev-list --right-only --count $(git bu)...HEAD
#############
alias g ours = "!f() { git checkout --ours $@ && git add $@; }; f"
alias g theirs = "!f() { git checkout --theirs $@ && git add $@; }; f"
alias g subrepo = !sh -c 'git filter-branch --prune-empty --subdirectory-filter $1 master' -
alias g human = git name-rev --name-only --refs=refs/heads/*
alias g contributors = git shortlog --summary --numbered                            # List contributors with number of commits
alias g credit = "!f() { git commit --amend --author \"$1 <$2>\" -C HEAD; }; f" # Credit an author on the latest commit