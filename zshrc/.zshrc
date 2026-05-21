#    ╔═╗╔═╗╦ ╦╦═╗╔═╗  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗
#    ╔═╝╚═╗╠═╣╠╦╝║    ║  ║ ║║║║╠╣ ║║ ╦
#    ╚═╝╚═╝╩ ╩╩╚═╚═╝  ╚═╝╚═╝╝╚╝╚  ╩╚═╝

# ASCII ART FONT : Calvin S

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# binary pkg path
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=nvim
export BAT_THEME="Dracula"
export PATH=$PATH:/home/ripunn/.spicetify

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

#    ┌─┐┬  ┬┌─┐┌─┐
#    ├─┤│  │├─┤└─┐
#    ┴ ┴┴─┘┴┴ ┴└─┘

# .zshrc config
alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"

# === Package
alias p="pwd"
# alias lf="l -F"
# alias ll="ls -l"
# alias lA="ls -lA"
# alias la="ls -a"
# alias ..="cd .."
alias ls="eza --icons=always --color=always -a"
alias ll="eza --icons=always --color=always -la"
alias bl="btrfs-assistant-launcher"
alias cat="bat"
alias download="aria2c"
alias systui="systemctl-tui"
alias v="nvim"

# === System
alias mem="du -sh"
alias disk="df -h"
alias part="lsblk -f"
alias ct="cat"
alias ...="cd ../.."
alias ...="cd ../../.."
alias h="history"
alias cls="clear"
alias c="clear"
alias pkg="rpm -qa | grep"

#    ┌─┐┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐  ┬  ┬┌─┐┌┬┐┌─┐
#    │  │ │││││││├─┤│││ ││  │  │└─┐ │ └─┐
#    └─┘└─┘┴ ┴┴ ┴┴ ┴┘└┘─┴┘  ┴─┘┴└─┘ ┴ └─┘
# only list commands that don't have aliases

# - dnf copr list
# - yazi (tui file manager)
# - lazygit (tui git)
# - btop (hardware monitoring)
# - nvtop (GPU & Accelerator process monitoring)

#    ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌┬┐
#    ├─┤│ │ │ │ │  └─┐ │ ├─┤├┬┘ │ 
#    ┴ ┴└─┘ ┴ └─┘  └─┘ ┴ ┴ ┴┴└─ ┴ 

fastfetch
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

#    ┬ ┬┌─┐┌─┐┬  ┌─┐┌─┐┌┐┌┌─┐┬┌─┐
#    └┬┘├─┤┌─┘│  │  │ ││││├┤ ││ ┬
#     ┴ ┴ ┴└─┘┴  └─┘└─┘┘└┘└  ┴└─┘
# record your final location in Yazi and uses it to automatically change your terminal's directory (cd) upon exit.

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
