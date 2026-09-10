function fish_prompt --description 'prompt'

  if test -z $WINDOW

    set last_status $status
    set git_status ( __fish_git_prompt )
    set git_status ( string trim -l $git_status )

    if test "$git_status" != ' '

      set_color normal
      printf '%s' $git_status
    end

    set_color f6f
    printf '%s ' '_'

  else
    printf '%s%s@%s%s(%s)%s $ '           \
      (set_color purple) (whoami)         \
      (prompt_hostname) (set_color white) \
      (echo $WINDOW) (set_color normal)
  end
end

