# Fish Shell Configuration
# ======================

# Set Neovim as the default editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Set PATH additions
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

# Initialize Starship prompt
starship init fish | source

# SSH Agent Configuration
# ======================
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null 2>&1
    ssh-add ~/.ssh/id_rsa > /dev/null 2>&1  # Replace id_rsa with your key file if different
end

# Aliases
# =======
# Directory listing with eza (modern replacement for ls)
alias ls='eza --color=auto --group-directories-first'
alias ll='eza -la --color=auto --group-directories-first --git'
alias la='eza -a --color=auto --group-directories-first'
alias l='eza -1 --color=auto --group-directories-first'
alias lt='eza --tree --level=2 --color=auto --group-directories-first'
alias lx='eza -la --color=auto --group-directories-first --git --extended'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vim='nvim'
alias vi='nvim'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'
alias gd='git diff'

# Development aliases (based on your rules)
alias mk='make'
alias uvr='uv run'
alias uvs='uv sync'

# Color support
set -gx CLICOLOR 1
set -gx LSCOLORS ExFxBxDxCxegedabagacad

# Fish-specific settings
# =====================
set fish_greeting ""  # Disable greeting message
set fish_key_bindings fish_vi_key_bindings  # Vi key bindings

# History settings
set -g fish_history_max 10000

# Completion settings
set -g fish_complete_path $fish_complete_path ~/.config/fish/completions

# Environment variables for development
# ====================================
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx PYTHONUNBUFFERED 1

# XDG Base Directory Specification
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME ~/.local/share
set -gx XDG_CACHE_HOME ~/.cache

# Language and locale
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Load local configuration if it exists
if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

# Eyecandy
fastfetch --config os
