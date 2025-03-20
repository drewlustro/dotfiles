# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

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

# Path
fish_add_path /opt/homebrew/opt/libpq/bin

# zoxide
# if status is-interactive
#   zoxide init fish | source
# end

# rbenv
set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
set -gx RBENV_SHELL fish
command rbenv rehash 2>/dev/null

# coreutils
set -Ua fish_user_paths /opt/homebrew/opt/coreutils/libexec/gnubin
set -Ux fish_user_paths $fish_user_paths /Users/drew/.gem/ruby/3.3.0/bin

nvm use 20.17.0 &>/dev/null

# uv python package manager + virtualenv combined
source $HOME/.local/bin/env.fish

# nvm - automatically invoke `nvm use`
# function nvm_auto_use --on-event fish_prompt
#   if test -f .node-version
#     nvm use (cat .node-version) ^/dev/null
#   end
# end

# iterm 2
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

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

    else if test $current_dir = dotfiles
        set title "$current_dir ⁂"

    else if test $parent_dir = dev-local
        set title "$current_dir ⁙"
    else
        # Otherwise, display parent/current
        set title "$short_parent/$current_dir"
    end

    # Set the iTerm2 window title
    echo -ne "\033]0;$title\007"
end

function fish_title
    echo -n ""
end
