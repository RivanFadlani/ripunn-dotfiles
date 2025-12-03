#    ╔═╗╔═╗╦ ╦╦═╗╔═╗  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗
#    ╔═╝╚═╗╠═╣╠╦╝║    ║  ║ ║║║║╠╣ ║║ ╦
#    ╚═╝╚═╝╩ ╩╩╚═╚═╝  ╚═╝╚═╝╝╚╝╚  ╩╚═╝

# ASCII ART FONT : Calvin S

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

#    ┌─┐┬  ┬┌─┐┌─┐
#    ├─┤│  │├─┤└─┐
#    ┴ ┴┴─┘┴┴ ┴└─┘

# .zshrc config
alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"

# General & Navigation
alias p="pwd"
# alias lf="l -F"
# alias ll="ls -l"
# alias lA="ls -lA"
# alias la="ls -a"
# alias ..="cd .."
alias ls="eza --icons=always --color=always -a"
alias ll="eza --icons=always --color=always -la"
alias ...="cd ../.."
alias ...="cd ../../.."
alias h="history"
alias cls="clear"
alias c="clear"
alias v="nvim"

# System & updates
alias mem="du -sh"
alias disk="df -h"
alias part="lsblk -f"
alias ct="cat"

#    ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌┬┐
#    ├─┤│ │ │ │ │  └─┐ │ ├─┤├┬┘ │ 
#    ┴ ┴└─┘ ┴ └─┘  └─┘ ┴ ┴ ┴┴└─ ┴ 

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
