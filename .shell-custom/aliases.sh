# Sample ~/.shell-custom/aliases.sh file
# ----------------------------------------
# Put customized aliases in here.
# See auto-included aliases in ~/.shell/aliases.sh
# ----------------------------------------
#
# Examples:
# alias say-hello="echo hello"
#
# Custom directory shortcuts:

# alias dropbox="cd ~/Dropbox";
# alias torrents="cd ~/Torrents";
# alias dev="cd ~/dev-local";

# alias alist="cd ~/dev-local/alist";
# alias angellist="cd ~/dev-local/AngelList";
# alias core="cd ~/dev-local/AngelList";
# alias talent="cd ~/dev-local/AngelList/frontend/talent";
# alias halo="cd ~/dev-local/halo";
# alias mndpc="cd ~/dev-local/mn-architects";
# alias dotfiles="cd ~/dev-local/dotfiles";

# alias png2gif-fast="convert -dispose Previous -delay 9 *.png -loop 0 -channel A -threshold 5% -alpha on  ~/Desktop/animation.gif";

# alias slack="open -n /Applications/Slack.app"

# alias beet-rm="beet rm -a -d"
# alias beet-ls="beet ls -a | grep -i"

# make readable xev output for monitoring X session keystrokes
# [ -f "/usr/bin/xev" ] && alias xev-readable="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'";
