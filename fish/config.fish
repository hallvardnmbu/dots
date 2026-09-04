if status --is-login
    if test -z "$DISPLAY" && test (tty) = "/dev/tty1"
        exec start-hyprland
    end
end

set fish_greeting ""
function fish_prompt
    set branch (git branch --show-current 2>/dev/null)
    if test -n "$branch"
        echo (prompt_pwd) "($branch)" '> '
    else
        echo (prompt_pwd) '> '
    end
end

set -gx VISUAL "/usr/bin/vim"
set -gx EDITOR $VISUAL

if test -f $HOME/.config/fish/secrets.fish
    source $HOME/.config/fish/secrets.fish
end

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias screenshot='slurp | grim -g - - | wl-copy'
alias s='git status'
alias aa='git add --all'
alias au='git add --update'
alias c='git commit -m'
alias am='git commit --amend --no-edit'
alias p='git push'
alias pl='git pull'

function a
    git add $argv
end

function b
    git checkout $argv
end

alias node='bun'
alias cursor='agent'

alias server="ssh -i $LOCAL_SSH"
alias snuble="ssh -i $REMOTE_SSH"

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x BUN_INSTALL "$HOME/.bun"

fish_add_path $BUN_INSTALL/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/code/docker/target/release/

# ESP32 Rust development
set -gx LIBCLANG_PATH "$HOME/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-20.1.1_20250829/esp-clang/lib"
fish_add_path $HOME/.rustup/toolchains/esp/xtensa-esp-elf/esp-15.2.0_20250920/xtensa-esp-elf/bin
