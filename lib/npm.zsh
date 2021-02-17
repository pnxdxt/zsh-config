NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# FNM
export PATH="/var/folders/m2/r9_k9tb904x21r8zmdgs98br0000gn/T/fnm_multishell_38232_1613545934215/bin":$PATH
export FNM_MULTISHELL_PATH="/var/folders/m2/r9_k9tb904x21r8zmdgs98br0000gn/T/fnm_multishell_38232_1613545934215"
export FNM_DIR="/Users/pnodet/.fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"