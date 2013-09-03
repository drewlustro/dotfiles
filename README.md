# Lustro ZSH dotfiles for Mac OS X
#### (an oh-my-zsh variant of Mathias' dotfiles for ZSH)

This dotfiles setup is specially customized for **ZSH** (oh-my-zsh) on Mac OS X. It is a near-complete port of M's original BASH dotfiles but with some bonus goodies that I've customized & added. My goal is to make this ZSH dotfiles distribution widely compatible and robust yet opinionated. 

## Installation

### Prerequesite: Install oh-my-zsh

If you haven't already, install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). It's easy!


### Using Git and the bootstrap.zsh script

You can clone the repository wherever you want. (I like to keep it in `~/dev/dotfiles`. The bootstrapper script will pull in the latest version from the master branch before installing.

```zsh
git clone https://github.com/drewlustro/dotfiles.git && cd dotfiles && source bootstrap.zsh
```

Whenever you'd like to update to the latest version, `cd` into your local `dotfiles` repository and then type:

```zsh
source bootstrap.zsh
```


### Common customizations

The most commonly scaffolded dotfiles are placed in the `$ZSH/custom` directory, so that oh-my-zsh can be updated without conflict, as that directory is ignored by oh-my-zsh's repository.

* `aliases.zsh`
* `completions.zsh`
* `exports.zsh`

To easily view this directory's contents after installation, type:

```zsh
zshdotfiles # will open a Finder window of the $ZSH/custom directory
zshconfig # will launch Sublime Text 3 (or $EDITOR) with all ZSH-related dotfiles opened
```

### Features

#### Tons of convenience aliases and shortcut commands
Take a look at all the `aliases.zsh` and `completions.zsh` files within `$ZSH/custom` to see what goodies lie within. You can simply type `zshdotfiles` after installation to quickly take a look.

#### Hyper-diverse terminal colors
GNU **ls** and **dircolors**, compiled from [GNU coreutils-8.21](http://www.gnu.org/software/coreutils/), will be installed into `$HOME/bin`, allowing for an elevated terminal color experience on Mac OS X 10.8.x via true `LS_COLORS` support.

#### LazyProdigy ZSH Theme
[LazyProdigy terminal theme](https://github.com/drewlustro/lazyprodigy-zsh-theme) for local machines and servers. Theme changes are easy from `~/.zshrc`

`lazyprodigy.zsh-theme`
![lazyprodigy.zsh-theme](http://pool.drewlustro.com/img/github/lazyprodigy-ss.png "lazyprodigy.zsh-theme")

`lazyprodigy-server.zsh-theme`
![lazyprodigy-server.zsh-theme](http://pool.drewlustro.com/img/github/lazyprodigy-server-ss.png "lazyprodigy-server.zsh-theme")


#### npm auto-completion
Auto-completion support has been added for the node package manager, sourced from `npm completion >> ~/.oh-my-zsh/custom/completions.zsh`

#### Local user software first!
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

### Sensible OS X defaults from Mathias

Too good to remove from this fork. When setting up a new Mac, you may want to set some sensible OS X defaults:

```zsh
./.osx
```

## Contact & Feedback

| [![twitter/msodrew](http://drewlustro.com/shared_static/img/commodore_normal.png)](http://twitter.com/msodrew "@msodrew on Twitter") |
|---|
| [Drew Lustro](http://drewlustro.com) |

Suggestions & improvements [welcome](https://github.com/drewlustro/dotfiles/issues)!

### Original Author Credit & Huge Thanks...

##### [Mathias Bynens](http://mathiasbynens.be/)

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
