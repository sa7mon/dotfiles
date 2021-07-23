# paths
. ~/dotfiles/macos/macos.path

# aliases
. ~/dotfiles/macos/macos.alias
. ~/dotfiles/utils/utils.alias
. ~/dotfiles/git/git.alias
. ~/dotfiles/fun/fun.alias
. ~/dotfiles/utils/typos.alias
. ~/dotfiles/docker/docker.alias

# nix
. /Users/dsalmon/.nix-profile/etc/profile.d/nix.sh

# functions
. ~/dotfiles/functions/command_time.zsh
. ~/dotfiles/git/git.zsh

# options
. ~/dotfiles/zsh/zsh.options

# Prompt
. ~/dotfiles/zsh/zsh.prompt


# Mac Laptop specific
# Docker alternate storage location
export MACHINE_STORAGE_PATH="/Volumes/DATA/docker-machine/machine"
export DOCKER_CERT_PATH="/Volumes/DATA/docker-machine/machine"
