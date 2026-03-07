export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias screenshot='slurp | grim -g - - | wl-copy'

alias s='git status'
alias aa='git add --all'
alias au='git add --update'
alias c='git commit -m'
alias p='git push'
alias pl='git pull'

function a {
    git add "$@"
}
function b {
    git checkout "$@"
}

# Assumes these variables are set.
# E.g., in ~/.bashrc, which sources this (~/.config/.bashrc).
alias wakeup="wakeonlan $LOCAL_MAC"
alias server="ssh -i $LOCAL_SSH"
alias snuble="ssh -i $REMOTE_SSH"

export XDG_CONFIG_HOME="$HOME/.config"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/code/docker/target/release/:$PATH"

PS1='[\u@\h \W]\$ '
