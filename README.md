# Drew's dotfiles
#### (an oh-my-zsh variant inspired by Mathias’ dotfiles)

This fork of Mathias' dotfiles is specially customized for *ZSH* (oh-my-zsh) on Mac OS X. It is a near-complete port of M's original BASH dotfiles but with some bonus goodies that I've customized & added. My goal is to make this ZSH dotfiles distribution widely compatible and robust yet opinionated. 

## Installation

### Using Git and the bootstrap.zsh script

You can clone the repository wherever you want. (I like to keep it in `~/dev/dotfiles`. The bootstrapper script will pull in the latest version from the master branch before installing.

```zsh
git clone https://github.com/drewlustro/dotfiles.git && cd dotfiles && source bootstrap.zsh
```

Whenever you'd like to update to the latest version, `cd` into your local `dotfiles` repository and then:

```zsh
source bootstrap.zsh
```


### Common customizations

The most commonly scaffolded dotfiles are placed in the `$ZSH/custom` directory, so that oh-my-zsh can be updated without conflict, as that directory is ignored by oh-my-zsh's repository.

* aliases
* completions
* exports

To easily view this directory's contents after installation, type:

```zsh
zshdotfiles # will open a Finder window of the $ZSH/custom directory
zshconfig # will launch Sublime Text 3 (or $EDITOR) with all ZSH-related dotfiles opened
```

### Bonus Features

#### Hyper-diverse Terminal Colors
GNU **ls** and **dircolors**, compiled from [GNU coreutils-8.21](http://www.gnu.org/software/coreutils/), will be installed into `$HOME/bin`, allowing for an elevated terminal color experience on OS X via true `LS_COLORS` support.

#### npm Auto-Completion
Auto-completion support has been added for the node package manager.

#### Local-Software First
The `$PATH` export chain checks for executables in many common local installation paths first, preferring user-installed binaries.


### Add custom commands without creating a new fork

If `$ZSH/custom/extra.zsh` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `extra.zsh` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Drew Lustro"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="drewlustro@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Extra export paths
export PATH=$PATH:/usr/local/MacGPG2/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin
export PATH=$PATH:/opt/gtk/bin

# z command
Z_APP=~/dev/third-party/z/z.sh
if [[ -x $Z_APP ]]; then
    . $Z_APP
fi 
```

You could also use `$ZSH/custom/extra.zsh` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/drewlustro/dotfiles/fork_select) instead, though.

### BASH customization remains available
The original bash dotfiles and `bootstrap.sh` file still exist in the source tree (for now) and can be used if you prefer. Simply execute:

```zsh
git clone https://github.com/drewlustro/dotfiles.git && cd dotfiles && source bootstrap.sh
```

### Sensible OS X defaults from Mathias

When setting up a new Mac, you may want to set some sensible OS X defaults:

```zsh
./.osx
```

## Contact Me & Feedback

| [![twitter/msodrew](http://drewlustro.com/shared_static/img/commodore_normal.png)](http://twitter.com/msodrew "Follow @msodrew on Twitter") |
|---|
| [Drew Lustro](http://drewlustro.com) |

Suggestions/improvements
[welcome](https://github.com/drewlustro/dotfiles/issues)!

### Original Author Credit & Huge Thanks...

*[Mathias Bynens](http://mathiasbynens.be/)*

#### Mathias' Thanks to…

* @ptb and [his _OS X Lion Setup_ repository](https://github.com/ptb/Mac-OS-X-Lion-Setup)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Chris Gerke](http://www.randomsquared.com/) and his [tutorial on creating an OS X SOE master image](http://chris-gerke.blogspot.com/2012/04/mac-osx-soe-master-image-day-7.html) + [_Insta_ repository](https://github.com/cgerke/Insta)
* [Cãtãlin Mariş](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](http://gf3.ca/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://lri.me/osx.html#hidden-preferences)
* [Matijs Brinkhuis](http://hotfusion.nl/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](http://sindresorhus.com/)
* [Tom Ryder](http://blog.sanctum.geek.nz/) and his [dotfiles repository](https://github.com/tejr/dotfiles)

* anyone who [contributed a patch](https://github.com/mathiasbynens/dotfiles/contributors) or [made a helpful suggestion](https://github.com/mathiasbynens/dotfiles/issues)
