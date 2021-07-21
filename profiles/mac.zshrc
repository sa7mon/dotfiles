# prompt
. ~/dotfiles/zsh.prompt

# paths
. ~/dotfiles/macos.path

# aliases
. ~/dotfiles/macos.alias
. ~/dotfiles/utils.alias
. ~/dotfiles/git.alias
. ~/dotfiles/fun.alias
. ~/dotfiles/typos.alias

# nix
. /Users/dsalmon/.nix-profile/etc/profile.d/nix.sh

# functions
. ~/dotfiles/functions/command_time.zsh

# options
. ~/dotfiles/zsh.options

# Mac Laptop specific
# Docker alternate storage location
export MACHINE_STORAGE_PATH="/Volumes/DATA/docker-machine/machine"
export DOCKER_CERT_PATH="/Volumes/DATA/docker-machine/machine"
