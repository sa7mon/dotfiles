# Load version control information
autoload -Uz vcs_info

# Format the git info string
zstyle ':vcs_info:git*' formats "(%b)"

# Add function to pre commands
precmd() {
    vcs_info
}
