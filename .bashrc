alias update='sudo -E nvim /etc/nixos/configuration.nix'
alias nrs='sudo nixos-rebuild switch --flake /etc/nixos#nix-btw'
alias flake='sudo -E nvim /etc/nixos/flake.nix'
alias cat='bat'
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -a --icons'
alias lt='eza --tree --icons'
alias btw='echo "I use NixOS, btw."'
nix-tv() {
    nix-search-tv print | fzf --preview 'nix-search-tv preview {}'
}

# function parse_git_dirty {
#   [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
# }
# function parse_git_branch {
#   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
# }

# export PS1="\n\t \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# opencode
export PATH=/home/voidwalker/.opencode/bin:$PATH
