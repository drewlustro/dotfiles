# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
# macaOs path
source "/usr/local/opt/fzf/shell/key-bindings.bash"

# TODO-Drew: debian linux path
# source /usr/share/doc/fzf/examples/key-bindings.bash
