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

alias dropbox="cd ~/Dropbox";
alias torrents="cd ~/Torrents";
alias dev="cd ~/dev-local";

alias png2gif-fast="convert -dispose Previous -delay 9 *.png -loop 0 -channel A -threshold 5% -alpha on  ~/Desktop/animation.gif";

alias slack="open -n /Applications/Slack.app"

alias beet-rm="beet rm -a -d"
alias beet-ls="beet ls -a | grep -i"
