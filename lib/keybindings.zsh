#!/usr/bin/env zsh

#-----------------------------------------------------
# Set VIM mode
# e.g. https://dougblack.io/words/zsh-vi-mode.html
# Key code table: https://www.zsh.org/mla/users/2014/msg00266.html
bindkey -v
bindkey '^P' up-history   # ctrl-p
bindkey '^N' down-history # ctrl-n
bindkey -M viins '^p' up-line-or-history
bindkey -M viins '^n' down-line-or-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char # backspace
bindkey '^h' backward-delete-char # ctrl-h
bindkey '^w' backward-kill-word   # ctrl-w
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^u' backward-kill-line

# search history
bindkey -M viins '^r' history-incremental-pattern-search-backward
bindkey -M viins '^s' history-incremental-pattern-search-forward

bindkey "^[[3~" delete-char
bindkey "^K" kill-whole-line   # ctrl-k
bindkey "^A" beginning-of-line # ctrl-a
bindkey "^E" end-of-line       # ctrl-e
bindkey "^D" delete-char       # ctrl-d
bindkey "^F" forward-word      # ctrl-f
bindkey "^B" backward-word     # ctrl-b

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^k' kill-line

bindkey -M viins '^y' yank
bindkey -M viins '^_' undo
bindkey -M viins '^x^r' redisplay

#-----------------------------------------------------
# https://github.com/zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^R" history-incremental-search-backward # ctrl-r
bindkey "[B" history-search-forward              # down arrow
bindkey "[A" history-search-backward             # up arrow
