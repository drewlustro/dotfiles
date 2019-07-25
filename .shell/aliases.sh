# aliases.sh

# ----------------------------------------
# Platform-Agnostic
# ----------------------------------------

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Simple shortcuts
alias h="history 0"
alias hh="history 0 | grep -i" # usage: hh sometext
alias space="du -h -d 1"
alias downloads="cd ~/Downloads"
alias desktop="cd ~/Desktop"
alias k="clear"
alias reload="exec $SHELL -l" # Reload the shell (i.e. invoke as a login shell)

# Server Management
[ -f "/etc/init.d/nginx" ] && alias nginx="sudo /etc/init.d/nginx";
[ -f "$(which supervisorctl)" ] && alias supervisor="sudo supervisorctl";

# Git
alias gs="git status";
alias gf="git fetch";
alias gmaster="git checkout master";
alias gmaster-pull="git pull origin master";
alias gmaster-rebase="git pull origin master --rebase";

# tree
alias treee="tree -hL 2 --filelimit 20 --dirsfirst"

# ls Helpers

# Detect which `ls` flavor is in use
if [ -x "$(which exa)" ] || ls --color > /dev/null 2>&1; then # rust `exa` or GNU coreutils `ls`
    colorflag="--color=auto -hF";
    if [ -f "$HOME/.shell/LS_COLORS" ]; then
        eval $( dircolors -b $HOME/.shell/LS_COLORS );
    fi;
elif [ "$PLATFORM" = "osx" ]; then # OS X `ls`
    colorflag="-G"
    export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"
fi;

# exa = `ls` replacement written in rust
if [ -x "$(which exa)" ]; then
  alias ls="exa --group-directories-first";
  alias l="exa -lr";
  alias ll="exa -lF --group-directories-first";
  alias la="exa -la --group-directories-first";
  alias lss="exa -la --group-directories-first -s size";

  # Always use color output for `ls`
  alias ls-stock="command ls ${colorflag}"

else
  # List all files colorized in long format
  alias l="ls -lrthF ${colorflag}";
  alias ll="ls -lF ${colorflag}";

  # List all files colorized in long format, including dot files
  alias la="ls -laF ${colorflag}";

  # List only directories
  alias lsd="ls -lF ${colorflag} | grep --color=never '^d'";

  # Always use color output for `ls`
  alias ls="command ls ${colorflag}";
fi;

if [ -x "$(which bat)" ]; then
  export BAT_THEME="TwoDark"
  alias cat='bat'
  alias ccat='cat'
fi;

if [ -x "$(which fzf)" ]; then
  alias preview="fzf --preview 'bat --color \"always\" {}'";
  # add support for ctrl+o to open selected file in VS Code
  export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'";
  # Setting fd as the default source for fzf
  [ -x "$(which fd)" ] && export FZF_DEFAULT_COMMAND='fd --type f';
fi;

if [ -x "$(which ncdu)" ]; then
  alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
fi;

# ----------------------------------------
# Utilities
# ----------------------------------------

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Get week number
alias week="date +%V"

# Stopwatch
alias timer="echo 'Timer started. Stop with Ctrl-D.' && date && time cat && date"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips='ifconfig -a | grep -o "inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)" | awk "{ sub(/inet6? (addr:)? ?/, \"\"); print }"'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Converts 24bit / 96kHz FLAC to 16bit / 44.1kHz FLAC using SoX
# (install SoX with homebrew: brew install sox)
if [ -x "$(which sox)" ]; then
    alias flac2496-to-flac1644='mkdir 16-44; for i in *.flac; do sox "$i" -S -r 44100 -b 16 "16-44/$i"; done';
fi;

# ----------------------------------------
# OS X Shortcuts
# ----------------------------------------
if [ "$PLATFORM" = "osx" ]; then
    alias o="open"
    alias oo="open ."

    # OS X has no `md5sum`, so use `md5` as a fallback
    command -v md5sum > /dev/null || alias md5sum="md5"

    # OS X has no `sha1sum`, so use `shasum` as a fallback
    command -v sha1sum > /dev/null || alias sha1sum="shasum"

    # Recursively delete `.DS_Store` files
    alias cleanup-dsstore="find . -type f -name '*.DS_Store' -ls -delete"

    # Empty the Trash on all mounted volumes and the main HDD
    # Also, clear Apple’s System Logs to improve shell startup speed
    alias empty-trash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

    # Hide/show all desktop icons (useful when presenting)
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

    # Disable Spotlight
    alias spotoff="sudo mdutil -a -i off"
    # Enable Spotlight
    alias spoton="sudo mdutil -a -i on"

    # PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
    alias plistbuddy="/usr/libexec/PlistBuddy"

    # Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
    # (useful when executing time-consuming commands)
    alias badge="tput bel"

    # Intuitive map function
    # For example, to list all directories that contain a certain file:
    # find . -name .gitattributes | map dirname
    alias map="xargs -n1"

    # Kill all the tabs in Chrome to free up memory
    # [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
    alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

    # Lock the screen (when going AFK)
    alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

    # Flush Directory Service cache
    alias flushcache="dscacheutil -flushcache && killall -HUP mDNSResponder"

    # Clean up LaunchServices to remove duplicates in the “Open With” menu
    alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

    alias canary-no-security="open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir";

    alias toolbelt-shell-debug-on="setopt verbose; set -xv"
    alias toolbelt-shell-debug-off="set +xv; unsetopt verbose;"
    alias toolbelt-postres-find-process="sudo lsof -iTCP -sTCP:LISTEN -n -P | grep 5432";

fi;

# ----------------------------------------
# Linux Shortcuts
# ----------------------------------------
if [ "$PLATFORM" = "linux" ]; then
    alias ainstall="sudo apt install -y ";
    alias aupdate="sudo apt update -y ";
    alias aupgrade="sudo apt upgrade -y";
    alias aautoremove="sudo apt autoremove -y";
    alias dirsize="du -h -d 1 | sort -hr";
    alias xmm="xmodmap $HOME/.Xmodmaprc";
    alias dmesg="dmesg -wH";

    alias canary-no-security="chromium-browser --disable-web-security --user-data-dir";
    alias chromium-no-security="chromium-browser --disable-web-security --user-data-dir";

    # load macOS style modifier key order (Super, Alt, Command, Spacebar ...)
    [ -e "$HOME/.Xmodmaprc" ] && xmodmap "$HOME/.Xmodmaprc";

    if [ "$LINUX_DESKTOP" = "kde" ]; then
        alias reboot-gracefully-kde="qdbus org.kde.ksmserver /KSMServer logout 0 1 0";
    fi;
fi;


