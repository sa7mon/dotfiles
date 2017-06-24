# TEMP
gzip() {
 pigz "$@"
}
export -f gzip

gunzip() {
 unpigz "$@"
}
export -f gunzip

###################     System Settings      ########################

# Prompt
PS1="[\e[0;32m\u@\h\e[m] \e[0;36m\W\e[m \$ "  # Set prompt with color

# Path
export PATH=/usr/local/lib/python2.7/site-packages/:/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=/usr/bin/:$PATH
export EDITOR='subl -w'
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"
#export PATH=/usr/local/php5/bin/:$PATH
export PATH=/usr/local/Cellar/php56/5.6.29_5/bin:$PATH

alias ruby='/usr/local/Cellar/ruby/2.4.1_1/bin/ruby'
#######################      Aliases     ##########################

# Git
alias gs='git status'
alias gaa='git add --all'
alias gp='git push origin master'
alias gr='git reset'
alias gd='git diff'

# Home
alias freenas='ssh root@10.0.1.153'

# System
alias rsynccopy='rsync --partial --progress --append --rsh=ssh -r -h '
alias rsyncmove='rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files' 
alias projects='cd /Volumes/DATA/Projects'
alias htop='sudo htop' # Otherwise it's useless
alias fixvmware='sudo kextunload -b com.github.osxfuse.filesystems.osxfusefs'
alias bdinfo='mono /usr/local/dantools/BDInfoCLI.exe'
alias seeso='/usr/local/dantools/seeso.sh'
alias youtube-mp3='youtube-dl --extract-audio --audio-format mp3'
eval "$(thefuck --alias)"
alias domaingrep="ggrep -Eo '(([a-zA-Z](-?[a-zA-Z0-9])*)\.)*[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}'"
alias emailgrep="grep -Eiorh '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'"
alias chmox='chmod +x'
alias cls='clear && ls'

# Typos
alias celar='clear'
alias pyhton='python'

# Fun
alias weather='curl http://wttr.in'

##############################################################
