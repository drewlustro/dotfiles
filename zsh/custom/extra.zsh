# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Drew Lustro"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="drewlustro@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Amazon EC2
export EC2_HOME=~/.fcc_ec2
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
alias sshec2="ssh -i $EC2_HOME/id_rsa-main"
alias scpec2="scp -i $EC2_HOME/id_rsa-main"
alias livereload_tunnel="ssh -g -L 35729:127.0.0.1:35729 drew@nvm"

# Extra export paths
export PATH=$PATH:/usr/local/MacGPG2/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin
export PATH=$PATH:/opt/gtk/bin
export PATH=$PATH:$EC2_HOME/bin

# z command
Z_APP=~/dev/third-party/z/z.sh
if [[ -x $Z_APP ]]; then
    . $Z_APP
fi 

# MARK plugin
export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}


