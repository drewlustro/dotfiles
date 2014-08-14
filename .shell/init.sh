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
unset unamestr;
export PLATFORM;