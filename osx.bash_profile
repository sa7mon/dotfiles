###################     System Settings      ########################

# Prompt
PS1="[\e[0;32m\u@\h\e[m] \e[0;36m\W\e[m \$ "  # Set prompt with color

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
alias gp='git push origin master'
alias gr='git reset'
alias gd='git diff'

# Remotes
alias freenas='ssh root@10.0.1.153'
alias vps='ssh root@159.203.58.173'
alias raspi='ssh pi@10.0.1.89'

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
alias lh='ls -alh'
alias ls10='ls | head -n 10'


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
