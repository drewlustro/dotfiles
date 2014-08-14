# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export SHELL=$(which bash);

# Load the shell-agnostic dotfiles, if they exist:
HOME_AG="$HOME/.shell";
if [ -d "$HOME_AG" ]; then
    AGNOSTIC_SHELL_FILES=( "$HOME_AG/init.sh" "$HOME_AG/path.sh" "$HOME_AG/exports.sh" "$HOME_AG/aliases.sh" "$HOME_AG/functions.sh" "$HOME_AG/extra.sh" );
    for file in ${AGNOSTIC_SHELL_FILES[@]}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    unset file;
fi;
unset HOME_AG;

# Load the userland custom shell dotfiles (freely customizable, never overwritten)
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

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

# OS X-specific
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

