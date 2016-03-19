# init.sh
# Includes functions employed by shell-agnostic .shell/*.sh scripts

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
SHELL_CHECK = $(env | grep SHELL\=);
if [[ "$SHELL_CHECK" == *zsh ]]; then
    ORIGINAL_SHELL="zsh";
elif [[ "$SHELL_CHECK" == *bash ]]; then
    ORIGINAL_SHELL="bash";
elif [[ "$SHELL_CHECK" == *sh ]]; then
    ORIGINAL_SHELL="sh";
fi;

unset unamestr;
unset SHELL_CHECK;
export PLATFORM;
