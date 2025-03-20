function spotoff --wraps='sudo mdutil -a -i off' --description 'alias spotoff=sudo mdutil -a -i off'
  sudo mdutil -a -i off $argv
        
end
