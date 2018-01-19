###################     System Settings      ########################

# Prompt - https://stackoverflow.com/a/2774197
green=$(tput setaf 2)
blue=$(tput setaf 6)
reset=$(tput sgr0)
PS1='\[$green\]\h\[$reset\]:\[$blue\]\w\[$reset\] \$ '

# Path (Lower lines take precedence)
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=/usr/local/Cellar/php56/5.6.29_5/bin:$PATH
export PATH="/usr/local/bin:$PATH"

# Use Python 2.7.12
export PATH=/usr/local/Cellar/python/2.7.12/bin:$PATH

# Use Sublime as the default text editor
export EDITOR='subl -w'

#######################      Aliases     ##########################

# Git
alias gs='git status'
alias gaa='git add --all'
alias gc='git commit -m'
alias gp='git push'
alias gr='git reset'
alias gd='git diff'
alias gl='git log'

# Remotes
alias freenas='ssh root@10.0.1.153'
alias vps='ssh root@159.203.58.173'
alias raspi='ssh pi@10.0.1.89'
alias backubuntu='ssh backubuntu@10.0.1.166'

# System
alias rsynccopy='rsync --partial --progress --append --rsh=ssh -r -h '
alias rsyncmove='rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files' 
alias projects='cd /Volumes/DATA/Projects'
alias htop='sudo htop' # Otherwise it's useless
alias fixvmware='sudo kextunload -b com.github.osxfuse.filesystems.osxfusefs'
alias bdinfo='mono /usr/local/dantools/BDInfoCLI.exe'
alias seeso='/usr/local/dantools/seeso.sh'
alias youtube-mp3='youtube-dl --extract-audio --audio-format mp3'
alias domaingrep="ggrep -Eo '(([a-zA-Z](-?[a-zA-Z0-9])*)\.)*[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}'"
alias emailgrep="grep -Eiorh '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'"
alias chmox='chmod +x'
alias cls='clear && ls'
alias c='clear'
alias lh='ls -alh'
alias ls10='ls | head -n 10'

alias ls='gls --color=auto' # Use GNU ls with auto coloring
alias ll='gls --color=auto -alh' # Use GNU ls with auto coloring, show hidden items, long listing, size in "human readable" format


# Override gzip with pigz for multi-core zipping
gzip() {
 pigz "$@"
}
export -f gzip
gunzip() {
 unpigz "$@"
}
export -f gunzip

# Typos
alias celar='clear'
alias pyhton='python'

# Fun
alias weather='curl http://wttr.in'

##############################################################

# direnv settings

eval "$(direnv hook bash)"

show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

PS1='$(show_virtual_env)'$PS1

layout_anaconda() {
  local env_name="$1"
  local ANACONDA_HOME="/Volumes/DATA/programs/anaconda3/"
  PATH_add "$ANACONDA_HOME"/bin
  source activate ${env_name}
}



########################################

#Docker
eval "$(docker-machine env default)"

