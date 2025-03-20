function reload --wraps='source ~/.config/fish/config.fish' --description 'alias reload source ~/.config/fish/config.fish'
    source ~/.config/fish/config.fish $argv
    echo "✔︎ reloaded"
end
