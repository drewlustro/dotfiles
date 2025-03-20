function showdesktop --wraps='defaults write com.apple.finder CreateDesktop -bool true && killall Finder' --description 'alias showdesktop=defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
  defaults write com.apple.finder CreateDesktop -bool true && killall Finder $argv
        
end
