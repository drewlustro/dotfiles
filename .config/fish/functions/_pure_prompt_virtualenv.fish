function _pure_prompt_virtualenv --description "Display virtualenv directory (patched)"

  if set --query pure_enable_virtualenv;
      and test "$pure_enable_virtualenv" = true

      set --local virtualenv ''
      set --local virtualenv_color (_pure_set_color $pure_color_virtualenv)

      if test -n "$VIRTUAL_ENV"
          # Skip showing default venv
          if test "$VIRTUAL_ENV" != "$HOME/.python-uv-env-default"
              set virtualenv (basename "$VIRTUAL_ENV")
          end
      else if test -n "$CONDA_DEFAULT_ENV"
          set virtualenv (basename "$CONDA_DEFAULT_ENV")
      end

      if test -n "$virtualenv"
          echo "$pure_symbol_virtualenv_prefix$virtualenv_color$virtualenv"
      end
  end
end

# Original
# function _pure_prompt_virtualenv --description "Display virtualenv directory"

#     if set --query pure_enable_virtualenv;
#         and test "$pure_enable_virtualenv" = true

#         set --local virtualenv ''
#         set --local virtualenv_color (_pure_set_color $pure_color_virtualenv)
#         if test -n "$VIRTUAL_ENV"
#             set virtualenv (basename "$VIRTUAL_ENV")
#         else if test -n "$CONDA_DEFAULT_ENV"
#             set virtualenv (basename "$CONDA_DEFAULT_ENV")
#         end

#         if test -n $virtualenv
#             echo "$pure_symbol_virtualenv_prefix$virtualenv_color$virtualenv"
#         end
#     end
# end
