# Source: https://github.com/popstas/zsh-command-time

# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=0

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="%s "

# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"

# Exclude some commands
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit nano)


_command_time_preexec() {
  # check excluded
  if [ -n "$ZSH_COMMAND_TIME_EXCLUDE" ]; then
    cmd="$1"
    for exc ($ZSH_COMMAND_TIME_EXCLUDE) do;
      if [ "$(echo $cmd | grep -c "$exc")" -gt 0 ]; then
        # echo "command excluded: $exc"
        return
      fi
    done
  fi

  timer=${timer:-$SECONDS}
  ZSH_COMMAND_TIME_MSG=${ZSH_COMMAND_TIME_MSG-"Time: %s"}
  ZSH_COMMAND_TIME_COLOR=${ZSH_COMMAND_TIME_COLOR-"white"}
  export ZSH_COMMAND_TIME=""
}

_command_time_precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [ -n "$TTY" ] && [ $timer_show -ge ${ZSH_COMMAND_TIME_MIN_SECONDS:-3} ]; then
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
    timer_show=$(printf '%dh:%02dm:%02ds\n' $(($ZSH_COMMAND_TIME/3600)) $(($ZSH_COMMAND_TIME%3600/60)) $(($ZSH_COMMAND_TIME%60)))
    #print -P "%F{$ZSH_COMMAND_TIME_COLOR}$(printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show")%f"
    export ZSH_LAST_COMMAND_TIME="$(printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show")"
  fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

# Set RPROMPT to the command execution time
setopt promptsubst
RPROMPT='%F{$ZSH_COMMAND_TIME_COLOR}$ZSH_LAST_COMMAND_TIME%f'
