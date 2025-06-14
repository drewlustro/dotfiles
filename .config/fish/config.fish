# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# secrets
if test -f $HOME/.config/fish/secrets.fish
    source $HOME/.config/fish/secrets.fish
else
    echo "Warning: .config/fish/secrets.fish is missing (maybe add it dawg?)"
end

# Environment variables
set -x DISABLE_SPRING true
set -x DOCKER_BUILDKIT 1
set -x HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK true
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY true
set -x PUPPETEER_EXECUTABLE_PATH (which chromium)
set -x PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

set -x LC_ALL "en_US.UTF-8"

# ICU (node) dependencies
set -x PKG_CONFIG_PATH /opt/homebrew/opt/icu4c/lib/pkgconfig
set -x LDFLAGS -L/opt/homebrew/opt/icu4c/lib
set -x CPPFLAGS -I/opt/homebrew/opt/icu4c/include

# VIPS (node module) dependencies
set -x PKG_CONFIG_PATH /opt/homebrew/opt/libxml2/lib/pkgconfig
set -x LDFLAGS -L/opt/homebrew/opt/libxml2/lib
set -x CPPFLAGS -I/opt/homebrew/opt/libxml2/include

# Editor
set -x EDITOR vim
set -x VISUAL vim

# iTerm2
set -x DISABLE_AUTO_TITLE true

# path
fish_add_path /opt/homebrew/opt/libpq/bin

# rbenv
set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
set -gx RBENV_SHELL fish
command rbenv rehash 2>/dev/null

# coreutils
set -Ua fish_user_paths /opt/homebrew/opt/coreutils/libexec/gnubin
set -Ux fish_user_paths $fish_user_paths /Users/drew/.gem/ruby/3.3.0/bin

if test (hostname) = selene
  nvm use 20.19.1 &>/dev/null
else if test (hostname) = arcadia
  nvm use 22.14.0 &>/dev/null
end

# uv python package manager + virtualenv combined
source $HOME/.local/bin/env.fish

# iterm 2
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# nvm - automatically invoke `nvm use`
# function nvm_auto_use --on-event fish_prompt
#   if test -f .node-version
#     nvm use (cat .node-version) ^/dev/null
#   end
# end

# zoxide
# if status is-interactive
#   zoxide init fish | source
# end

# function __pure_prompt_virtualenv --description 'Print python virtualenv name'
#   if set -q VIRTUAL_ENV
#     echo "VIRTUAL_ENV: $VIRTUAL_ENV"
#     if test "$VIRTUAL_ENV" != "$HOME/.python-uv-env-default"
#       set venv (basename "$VIRTUAL_ENV")
#       echo -n "($venv) "
#     end
#   end
# end

# Auto-activate the default Python environment
if test -d ~/.python-uv-env-default
  source ~/.python-uv-env-default/bin/activate.fish
end

# If default venv exists, prepend its bin/ to PATH
if test -d ~/.python-uv-env-default/bin
  set -gx PATH ~/.python-uv-env-default/bin $PATH
end

# Queue to move to functions

function update_iterm2_title --on-event fish_prompt
    set -l cwd (pwd)
    set -l current_dir (basename "$cwd")
    set parent_dir (basename (dirname "$cwd"))
    set -l short_parent (string sub -l 3 "$parent_dir")

    if test $cwd = $HOME
        set title "◩"
    else if test (dirname "$cwd") = $HOME
        # when parent is home, only display current directory
        set title "$current_dir"

    else if test $current_dir = marketing-site
        set title "$current_dir ✦"

    else if test $current_dir = core
        set title "$current_dir ❖"

    else if test $current_dir = frontend
        set title "$current_dir ⦿"

    else if test $current_dir = instapaper
        set title "$current_dir ☰"
    else if test $parent_dir = instapaper
        set title "instapaper/$current_dir ☰"

    else if test $current_dir = dotfiles
        set title "$current_dir ⁂"

    else if test $parent_dir = dev
        set title "$current_dir ⁙"
    else
        # Otherwise, display parent/current
        set title "$short_parent/$current_dir"
    end

    # Create final title with hostname if this is an SSH session
    set -l final_title $title
    if set -q SSH_CONNECTION
        set -l host (hostname)
        set final_title "$title @$host"
    end

    # Set the iTerm2 window title
    echo -ne "\033]0;$final_title\007"
end

# Override the default fish_title to no-op so that update_iterm2_title is used instead
function fish_title
    echo -n ""
end

# Path completion settings
# Remove the previous binding
# bind \t forward-char

# Configure directory-by-directory tab completion
function custom_tab_binding
    # prefer suggestion from history first
    if test -n (commandline -S)
        commandline -f accept-autosuggestion
    else if commandline --paging-mode
        commandline -f history-search-forward
    else
        commandline -f complete
    end
end

function fish_user_key_bindings
    bind \t custom_tab_binding

    # then complete by directory chunks
    bind \e\t 'commandline -f complete; if test -d (commandline -t); commandline -i "/"; commandline -f complete; end'
end

# Path completion settings - complete by directory chunks
set -g fish_complete_path_case_sensitive 1
set -g fish_emoji_width 2
set -g fish_ambiguous_width 1
set -U fish_complete_path_max_cmd_length 15
set -g fish_autosuggestion_enabled 1

# Enable history-based completion
set -g fish_history_enabled 1
set -g fish_history_size 10000
