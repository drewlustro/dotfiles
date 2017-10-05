# init.sh
# Includes functions employed by shell-agnostic .shell/*.sh scripts

echo "========================="
echo "  Detect System"
echo "========================="

PLATFORM="unknown";
unamestr="$(uname)";
if [ "$unamestr" = 'Darwin' ]; then
    PLATFORM='osx';
elif [ "$unamestr" = 'Linux' ]; then
    PLATFORM='linux';
elif [ "$unamestr" = 'FreeBSD' ]; then
    PLATFORM='freebsd';
fi;



ORIGINAL_SHELL=$SHELL;
SHELL_CHECK=$(env | grep SHELL\=);
if [[ "$SHELL_CHECK" == *zsh ]]; then
    ORIGINAL_SHELL="zsh";
elif [[ "$SHELL_CHECK" == *bash ]]; then
    ORIGINAL_SHELL="bash";
elif [[ "$SHELL_CHECK" == *sh ]]; then
    ORIGINAL_SHELL="sh";
fi;

LINUX_DESKTOP="n/a";
if [ "$PLATFORM" = "linux" ]; then
    if [[ "$XDG_CURRENT_DESKTOP" == *XFCE ]]; then
        LINUX_DESKTOP="xfce";
    elif [[ "$XDG_CURRENT_DESKTOP" == *Gnome ]]; then
        LINUX_DESKTOP="gnome";
    elif [[ "$XDG_CURRENT_DESKTOP" == *Unity ]]; then
        LINUX_DESKTOP="unity";
    elif [[ "$XDG_CURRENT_DESKTOP" == *KDE ]]; then
        LINUX_DESKTOP="kde";
    else
        LINUX_DESKTOP="generic";
    fi;
fi;

echo   "PLATFORM:       $PLATFORM ($unamestr)";
echo   "SHELL:          $SHELL";
echo   "ORIGINAL_SHELL: $ORIGINAL_SHELL";
printf "LINUX_DESKTOP:  $LINUX_DESKTOP \n\n";

unset unamestr;
unset SHELL_CHECK;

# save for later
export PLATFORM;
export LINUX_DESKTOP;

