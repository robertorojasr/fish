
# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  if set -q VIRTUAL_ENV
    echo -n " "
  end

  # Time
  set_color $fish_color_operator
  echo -n (date "+%H:%M:%S ")

  # User
  #set_color $fish_color_user
  set_color 0000ff
  echo -n (whoami)

  #set_color normal
  #echo -n '@'

  # Host
  #set_color $fish_color_host
  set_color ff5f00
  echo -n (hostname -s)

  #set_color normal
  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  echo -n (pwd)
  set_color normal

  # GIT
  set_color normal
  echo -n (__fish_git_prompt)
  set_color normal

  # Cursor
  echo
  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n '➤ '
  set_color normal
end


