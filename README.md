# Drew's Platform & Shell Agnostic Dotfiles

`Version 3.2.0 / December 13, 2018`

* Backs up top-level dotfiles before installing
* Works with both **bash** and **zsh**
* Platform (OS X, Linux, etc) agnostic
* Includes non-destructive userland includes to your home directory.
* Employs *[prezto](https://github.com/sorin-ionescu/prezto)*, the fast zsh framework
* Prefer `exa` to `ls`
* Supports standalone update of `.shell` directory for non-destructive updates

<br><br>

![v3.1.0 Screenshot](http://i.imgur.com/rOitcmj.jpg)

<br>


### ZSH Pre-Installation

Do this part only if you're running ZSH or would like to use it as your default shell.


Install [ZSH](http://zsh.sourceforge.net/) via [Homebrew](http://brew.sh/) (OS X)
```bash
brew install zsh
```

Install [ZSH](http://zsh.sourceforge.net/) via `apt` (Debian/Ubuntu)
```bash
sudo apt-get install zsh -y
```

Launch ZSH and install [prezto](https://github.com/sorin-ionescu/prezto)

```bash
zsh
cd
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

# ✪ EZ Dotfiles Install

You can clone the repository wherever you want. (I like to keep it in `~/dev/dotfiles`. The bootstrapper script will pull in the latest version from the master branch before installing. Remember to run these commands from a `bash` shell!

```bash
bash -l # make sure we're running bash
git clone https://github.com/drewlustro/dotfiles.git && cd dotfiles && ./install.sh
```

##
## Alternative Manual installation

1. Download **.zip** & extract or `git clone` this repository.
2. Open a terminal window and `cd` into the `dotfiles` directory.
3. Run `./install.sh` to install.

```bash
~/dotfiles $ ./install.sh
```

### Bonus: Homebrew convenience install scripts

```bash
./fresh-machine/brew-install-cli.sh # installs TONS of useful binaries, libs, and CLI tools via brew
./fresh-machine/brew-install-media-cli.sh # installs heavy media CLI tools (ffmpeg, sox, etc.) via brew
./fresh-machine/brew-cask-fonts.sh  # installs a handful of useful public-domain typefaces, including many coding fonts
./fresh-machine/brew-cask-apps.sh   # installs many useful OS X applications via brew-cask
```


## Charactaristics

#### Shell Config File Locations

My opinionated dotfiles are placed in the `$HOME/.shell` directory, so that either shell can be updated without conflict, as that directory is ignored by oh-my-zsh's repository.

* `~/.shell/aliases.sh`
* `~/.shell/exports.sh`
* `~/.shell/extra.sh`
* `~/.shell/functions.sh`
* `~/.shell/init.sh`
* `~/.shell/path.sh`
* `~/.shell/LS_COLORS`


---

### Add custom commands without creating a new fork

The following files will be scaffolded if they do not exist and are available for your own customization,
without fear of being overwritten by additional installations/updates from this repository.

* `~/.shell-custom/aliases.sh`
* `~/.shell-custom/exports.sh`
* `~/.shell-custom/extra.sh`
* `~/.shell-custom/functions.sh`
* `~/.shell-custom/path.sh`

For instance, my `~/.shell-custom/extra.sh` file looks like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
export GIT_AUTHOR_NAME="John Doe"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"

export GIT_AUTHOR_EMAIL="name@gmail.com"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

--- 

### Notable Features

#### Tons of convenience aliases and shortcut commands
Take a look at all the `.sh` includes in `~/.shell/*.sh` for details.


#### Hyper-diverse terminal colors
GNU **ls** and **dircolors**, compiled from [GNU coreutils-8.21](http://www.gnu.org/software/coreutils/), will be installed into `$HOME/bin`, allowing for an elevated terminal color experience on Mac OS X 10.8.x via true `LS_COLORS` support.

#### Local user software first!
The `$PATH` export chain checks for executables in many common local installation paths first, preferring user-installed binaries.


---


### Sensible OS X defaults

Executing `.macos` applies tons of hacker-friendly customization to OS X. Please take a look at this file if you fear for your personal preferences, but it is great to try out on new OS ins
talls and old ;)

```bash
cd dotfiles
./.macos # Does tons of hacker-friendly customization to OS X
```


## Contact & Feedback

<a href="http://twitter.com/msodrew" target="_blank"><img src="https://i.imgur.com/lTqjI9E.jpg" width="200" /></a>

&nbsp;

Suggestions & improvements [welcome](https://github.com/drewlustro/dotfiles/issues)!

&nbsp;

---

&nbsp;

### Original Author Credit & Huge Thanks To:

#### &nbsp;&nbsp;&nbsp;&nbsp;[Mathias](http://mathiasbynens.be/) &amp; Jason Hsieh (but not really) yep.

### License

MIT

#### Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Chris Gerke](http://www.randomsquared.com/) and his [tutorial on creating an OS X SOE master image](http://chris-gerke.blogspot.com/2012/04/mac-osx-soe-master-image-day-7.html) + [_Insta_ repository](https://github.com/cgerke/Insta)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](http://gf3.ca/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
* [Matijs Brinkhuis](http://hotfusion.nl/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](http://sindresorhus.com/)
* [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
* [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [OSXDefaults project](https://github.com/kevinSuttle/OSXDefaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
* [Haralan Dobrev](http://hkdobrev.com/)
* anyone who [contributed a patch](https://github.com/mathiasbynens/dotfiles/contributors) or [made a helpful suggestion](https://github.com/mathiasbynens/dotfiles/issues)
