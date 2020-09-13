# alias
alias g a =add --all
alias g ai = add -i
#############
alias g ap = apply
alias g as = apply --stat
alias g ac = apply --check
#############
alias g ama = am --abort
alias g amr = am --resolved
alias g ams = am --skip
#############
alias g b = branch
alias g ba = branch -a
alias g bd = branch -d
alias g bdd = branch -D
alias g br = branch -r
alias g bc = rev-parse --abbrev-ref HEAD
alias g bu = !git rev-parse --abbrev-ref --symbolic-full-name "@{u}"
alias g bs = !git-branch-status
#############
alias g c = commit
alias g ca = commit -a
#ca = !git add -A && git commit -av # Commit all changes
alias g cm = commit -m
alias g cam = commit -am
alias g cem = commit --allow-empty -m
alias g cd = commit --amend
alias g cad = commit -a --amend
alias g ced = commit --allow-empty --amend
alias g amend = commit --amend --reuse-message=HEAD # Amend the currently staged files to the latest commit
#############
alias g cl = clone --recursive
alias g cld = clone --depth 1
alias g clg = !sh -c 'git clone git://github.com/$1 $(basename $1)' -
alias g clgp = !sh -c 'git clone git@github.com:$1 $(basename $1)' -
alias g clgu = !sh -c 'git clone git@github.com:$(git config --get user.username)/$1 $1' -
#############
alias g cp = cherry-pick
alias g cpa = cherry-pick --abort
alias g cpc = cherry-pick --continue
#############
alias g dp = diff --patience
alias g dc = diff --cached
alias g dk = diff --check
alias g dck = diff --cached --check
alias g dt = difftool
alias g dct = difftool --cached
alias g d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"           # Show the diff between the latest commit and the current state
alias g di = !"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d" # `git di $number` shows the diff between the state `$number` revisions ago and the current state
alias g dm = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d"                          # Remove branches that have already been merged with master
#############
alias g f = fetch
alias g fo = fetch origin
alias g fu = fetch upstream
#############
alias g fp = format-patch
#############
alias g fk = fsck
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
alias g m = merge
alias g ma = merge --abort
alias g mc = merge --continue
alias g ms = merge --skip
#############
alias g o = checkout
alias g om = checkout master
alias g ob = checkout -b
alias g opr = !sh -c 'git fo pull/$1/head:pr-$1 && git o pr-$1'
#############
alias g pr = prune -v
#############
alias g ps = push
alias g psf = push -f
alias g psu = push -u
alias g pst = push --tags
#############
alias g pso = push origin
alias g psao = push --all origin
alias g psfo = push -f origin
alias g psuo = push -u origin
#############
alias g psom = push origin master
alias g psaom = push --all origin master
alias g psfom = push -f origin master
alias g psuom = push -u origin master
alias g psoc = !git push origin $(git bc)
alias g psaoc = !git push --all origin $(git bc)
alias g psfoc = !git push -f origin $(git bc)
alias g psuoc = !git push -u origin $(git bc)
alias g psdc = !git push origin :$(git bc)
#############
alias g pl = pull --recurse-submodules
alias g pb = pull --rebase
#############
alias g plo = pull origin
alias g pbo = pull --rebase origin
alias g plom = pull origin master
alias g ploc = !git pull origin $(git bc)
alias g pbom = pull --rebase origin master
alias g pboc = !git pull --rebase origin $(git bc)
#############
alias g plu = pull upstream
alias g plum = pull upstream master
alias g pluc = !git pull upstream $(git bc)
alias g pbum = pull --rebase upstream master
alias g pbuc = !git pull --rebase upstream $(git bc)
#############
alias g rb = rebase
alias g rba = rebase --abort
alias g rbc = rebase --continue
alias g rbi = rebase --interactive
alias g rbs = rebase --skip
alias g reb = "!r() { git rebase -i HEAD~$1; }; r" # Interactive rebase with the given number of latest commits
#############
alias g re = reset
alias g rh = reset HEAD
alias g reh = reset --hard
alias g rem = reset --mixed
alias g res = reset --soft
alias g rehh = reset --hard HEAD
alias g remh = reset --mixed HEAD
alias g resh = reset --soft HEAD
alias g rehom = reset --hard origin/master
#############
alias g r = remote
alias g ra = remote add
alias g rr = remote rm
alias g rv = remote -v
alias g rn = remote rename
alias g rp = remote prune
alias g rs = remote show
alias g rao = remote add origin
alias g rau = remote add upstream
alias g rro = remote remove origin
alias g rru = remote remove upstream
alias g rso = remote show origin
alias g rsu = remote show upstream
alias g rpo = remote prune origin
alias g rpu = remote prune upstream
#############
alias g rmf = rm -f
alias g rmrf = rm -r -f
#############
alias g s = status -s
alias g sb = status -s -b
#############
alias g sa = stash apply
alias g sc = stash clear
alias g sd = stash drop
alias g sl = stash list
alias g sp = stash pop
alias g ss = stash save
alias g ssk = stash save -k
alias g sw = stash show
alias g st = !git stash list | wc -l 2>/dev/null | grep -oEi '[0-9][0-9]*'
#############
alias g t = tag
alias g td = tag -d
alias g retag = "!r() { git tag -d $1 && git push origin :refs/tags/$1 && git tag $1; }; r" # Remove the old tag with this name and tag the latest commit with it.
#############
alias g w = show
alias g wp = show -p
alias g wr = show -p --no-color
#############
alias g svnr = svn rebase
alias g svnd = svn dcommit
alias g svnl = svn log --oneline --show-commit
#############
alias g subadd = !sh -c 'git submodule add git://github.com/$1 $2/$(basename $1)' -
alias g subrm = !sh -c 'git submodule deinit -f -- $1 && rm -rf .git/modules/$1 && git rm -f $1' -
alias g subup = submodule update --init --recursive
alias g subpull = !git submodule foreach git pull --tags origin master
#############
alias g assume = update-index --assume-unchanged
alias g unassume = update-index --no-assume-unchanged
alias g assumed = !git ls -v | grep ^h | cut -c 3-
alias g unassumeall = !git assumed | xargs git unassume
alias g assumeall = !git status -s | awk {'print $2'} | xargs git assume
#############
alias g bump = !sh -c 'git commit -am \"Version bump v$1\" && git psuoc && git release $1' -
alias g release = !sh -c 'git tag v$1 && git pst' -
alias g unrelease = !sh -c 'git tag -d v$1 && git pso :v$1' -
alias g merged = !sh -c 'git o master && git plom && git bd $1 && git rpo' -
#aliases = !git config -l | grep alias | cut -c 7-
alias g aliases = config --get-regexp alias
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
alias g human = name-rev --name-only --refs=refs/heads/*
alias g contributors = shortlog --summary --numbered                            # List contributors with number of commits
alias g credit = "!f() { git commit --amend --author \"$1 <$2>\" -C HEAD; }; f" # Credit an author on the latest commit