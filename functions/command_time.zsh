# Source: https://github.com/popstas/zsh-command-time

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="%s "

# Message color.
ZSH_COMMAND_TIME_COLOR="38;15;8"

# Exclude some commands
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit nano)


_command_time_preexec() {
  # check excluded
  if [ -n "$ZSH_COMMAND_TIME_EXCLUDE" ]; then
    cmd="$1"
    for exc ($ZSH_COMMAND_TIME_EXCLUDE) do;
      if [ "$(echo $cmd | grep -c "$exc")" -gt 0 ]; then
        return
      fi
    done
  fi

  timer=${timer:-$SECONDS}
  ZSH_COMMAND_TIME_MSG=${ZSH_COMMAND_TIME_MSG-"Time: %s"}
  export ZSH_COMMAND_TIME=""
}

_command_time_precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [ -n "$TTY" ]; then
      export ZSH_COMMAND_TIME="$timer_show"
      if [ ! -z ${ZSH_COMMAND_TIME_MSG} ]; then
        zsh_command_time
      fi
    fi
    unset timer
  fi
}

zsh_command_time() { 
  if [ -n "$ZSH_COMMAND_TIME" ]; then
    hours=$(($ZSH_COMMAND_TIME/3600))
    min=$(($ZSH_COMMAND_TIME/60))
    sec=$(($ZSH_COMMAND_TIME%60))
    timer_show=''
    if [ "$hours" -gt 0 ]; then 
      timer_show=$(printf '%dh:%02dm:%02ds\n' $hours $min $sec)
    elif [ "$min" -gt 0 ]; then
      timer_show=$(printf '%02dm:%02ds\n' $min $sec)
    elif [ "$sec" -gt 1 ]; then
      timer_show=$(printf '%2ds\n' $sec)
    fi
    export ZSH_LAST_COMMAND_TIME="$(printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show")"
  fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

# Set RPROMPT to the command execution time
setopt promptsubst
RPROMPT='%F{$ZSH_COMMAND_TIME_COLOR}$ZSH_LAST_COMMAND_TIME%f'
