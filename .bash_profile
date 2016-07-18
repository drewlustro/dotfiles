# Add `~/bin` to the `$PATH` first
export PATH="$HOME/bin:$PATH";
export SHELL=$(which bash);

# ----------------------------------------
# STOCK DOTFILES (https://github.com/drewlustro/dotfiles)
# (do not change these. they're managed by git)
# ----------------------------------------
INCLUDES_DEFAULT="$HOME/.shell";
if [ -d "$INCLUDES_DEFAULT" ]; then
    AGNOSTIC_SHELL_FILES=( "$INCLUDES_DEFAULT/init.sh" "$INCLUDES_DEFAULT/path.sh" "$INCLUDES_DEFAULT/exports.sh" "$INCLUDES_DEFAULT/aliases.sh" "$INCLUDES_DEFAULT/functions.sh" "$INCLUDES_DEFAULT/extra.sh" );
    for file in ${AGNOSTIC_SHELL_FILES[@]}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    unset file;
fi;
unset INCLUDES_DEFAULT;

# Bash Prompt
[ -r "$HOME/.bash_prompt" ] && [ -f "$HOME/.bash_prompt" ] && source  "$HOME/.bash_prompt";

# ----------------------------------------
# CUSTOM DOTFILES
# Load the userland custom shell dotfiles (freely customizable, never overwritten)
# Go ahead and change these if you want!
# ----------------------------------------
INCLUDES_CUSTOM="$HOME/.shell-custom";
if [ -d "$INCLUDES_CUSTOM" ]; then
    INCLUDES=( "$INCLUDES_CUSTOM/path.sh" "$INCLUDES_CUSTOM/exports.sh" "$INCLUDES_CUSTOM/aliases.sh" "$INCLUDES_CUSTOM/functions.sh" "$INCLUDES_CUSTOM/extra.sh" );
    for file in ${INCLUDES[@]}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    unset file;
    unset INCLUDES;
fi;
unset INCLUDES_CUSTOM;


# ----------------------------------------
# BASH OPTIONS + CONFIG
# Load the userland custom shell dotfiles (freely customizable, never overwritten)
# Go ahead and change these if you want!
# ----------------------------------------
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;


# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# ----------------------------------------
# OS X-specific
# ----------------------------------------
if [ "$PLATFORM" = "osx" ]; then

    # Add tab completion for many Bash commands
    if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        source "$(brew --prefix)/etc/bash_completion";
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion;
    fi;

    # Enable tab completion for `g` by marking it as an alias for `git`
    if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
        complete -o default -o nospace -F _git g;
    fi;

    # Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
    [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

    # Add tab completion for `defaults read|write NSGlobalDomain`
    # You could just use `-g` instead, but I like being explicit
    complete -W "NSGlobalDomain" defaults;

    # Add `killall` tab completion for common apps
    complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
fi;

# ----------------------------------------
# Everything else below here...
# ----------------------------------------
