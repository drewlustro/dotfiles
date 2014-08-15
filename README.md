# Drew's Platform & Shell Agnostic Dotfiles
* Works with both **bash** and **zsh**
* Platform (OS X, Linux, etc) agnostic
* Includes non-destructive userland includes to your home directory

### ZSH Pre-Installation

Do this part only if you're running ZSH or would like to use it as your default shell.

### ZSH Prerequesites: [ZSH](http://zsh.sourceforge.net/) + [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

Install [ZSH](http://zsh.sourceforge.net/) via [Homebrew](http://brew.sh/) (OS X)
```bash
brew install zsh
```

Upon successful install of ZSH, close the current bash shell and open up a new terminal window, which should be a new zsh shell.

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) via **`curl`**
```bash
curl -L http://install.ohmyz.sh | sh
```

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) via **`wget`**

```bash
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
```



# ✪ Easy Install of dotfiles for both Bash & ZSH

You can clone the repository wherever you want. (I like to keep it in `~/dev/dotfiles`. The bootstrapper script will pull in the latest version from the master branch before installing. Remember to run these commands from a *bash shell!*

```bash
git clone https://github.com/drewlustro/dotfiles.git && cd dotfiles && source bootstrap.sh
```


### Manual installation

1. Download **.zip** & extract or `git clone` this repository.
2. Open a terminal window and `cd` into the `dotfiles` directory.
3. Run `source bootstrap.sh` to install.

```zsh
~/dotfiles $ source bootstrap.sh
```

## Charactaristics

### Shell Config File Locations

My opinionated dotfiles are placed in the `$HOME/.shell` directory, so that either shell can be updated without conflict, as that directory is ignored by oh-my-zsh's repository.

* `~/.shell/aliases.sh`
* `~/.shell/exports.sh`
* `~/.shell/extra.sh`
* `~/.shell/functions.sh`
* `~/.shell/init.sh`
* `~/.shell/path.sh`
* `~/.shell/LS_COLORS`

### Notable Features

#### Tons of convenience aliases and shortcut commands
Take a look at all the `.sh` includes in `~/.shell` for details.

#### RVM scripts/bin support
Automatically dectects `~/.rvm/scripts/rvm` and adds `$HOME/.rvm/bin` to `PATH`.

#### Hyper-diverse terminal colors
GNU **ls** and **dircolors**, compiled from [GNU coreutils-8.21](http://www.gnu.org/software/coreutils/), will be installed into `$HOME/bin`, allowing for an elevated terminal color experience on Mac OS X 10.8.x via true `LS_COLORS` support.

#### Local user software first!
The `$PATH` export chain checks for executables in many common local installation paths first, preferring user-installed binaries.

#### LazyProdigy ZSH Theme
[LazyProdigy terminal theme](https://github.com/drewlustro/lazyprodigy-zsh-theme) for local machines and servers. Change the theme in `~/.zshrc`
![lazyprodigy.zsh-theme](http://pool.drewlustro.com/img/github/lazyprodigy-ss.png "lazyprodigy.zsh-theme")
![lazyprodigy-server.zsh-theme](http://pool.drewlustro.com/img/github/lazyprodigy-server-ss.png "lazyprodigy-server.zsh-theme")

---

### Add custom commands without creating a new fork

The following files will be scaffolded if they do not exist and are available for your own customization,
without fear of being overwritten by additional installations/updates from this repository.

* `~/.aliases`
* `~/.exports`
* `~/.extra`
* `~/.functions`
* `~/.path`

For instance, my `~/.extra` file looks like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
export GIT_AUTHOR_NAME="Drew Lustro"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"

export GIT_AUTHOR_EMAIL="drewlustro@gmail.com"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Python virtualenvwraper default environment
DEFAULT_PYTHON_ENV="default";
DEFAULT_WORKON_HOME="/sites/envs";
[ -d "$DEFAULT_WORKON_HOME" ] && export WORKON_HOME="/sites/envs";
[ -x "$(which workon)" ] && [ -d "$DEFAULT_WORKON_HOME/$DEFAULT_PYTHON_ENV" ] && workon $DEFAULT_PYTHON_ENV;
```

### Sensible OS X defaults

Executing `.osx` applies tons of hacker-friendly customization to OS X. Please take a look at this file if you fear for your personal preferences, but it is great to try out on new OS installs and old ;)

```bash
cd dotfiles
./.osx # Does tons of hacker-friendly customization to OS X
```

## Contact & Feedback
| [![twitter/msodrew](http://io.drewlustro.com/img/malibu-400.jpg)](http://twitter.com/msodrew "@msodrew on Twitter") |
|---|
| [Drew Lustro](http://drewlustro.com) |


Suggestions & improvements [welcome](https://github.com/drewlustro/dotfiles/issues)!

### Original Author Credit & Huge Thanks To:

#### &nbsp;&nbsp;&nbsp;&nbsp;[Mathias](http://mathiasbynens.be/) &amp; Jason Hsieh (but not really)

### License

MIT
