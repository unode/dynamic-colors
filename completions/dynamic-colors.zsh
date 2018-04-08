#compdef dynamic-colors

_dynamic_colors() {
  if [ "${#words}" -eq 2 ]; then
    local commands
    commands=('help:print this help message' \
      'edit:edit \<colorscheme\> or launch editor in colorscheme directory' \
      'init:(re)load last colorscheme' \
      'list:list available colorschemes' \
      'switch:change to given colorscheme' \
      'audit:check \<colorscheme\> for undefined colors' \
      'create:create a new colorscheme from scratch')
    _describe -t commands "dynamic-colors commands" commands "$@"
   # arguments : ":action:($actions)"
  else
    word=${words[2]}
    case "$word" in
      switch|edit|audit)
        themes=($(dynamic-colors list))
        _describe -t themes "available themes" themes "$@"
        ;;
    esac
  fi
}

_dynamic_colors
