function hidedesktop --wraps='defaults write com.apple.finder CreateDesktop -bool false && killall Finder' --description 'alias hidedesktop=defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
  defaults write com.apple.finder CreateDesktop -bool false && killall Finder $argv
        
end
