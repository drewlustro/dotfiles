function flushcache --wraps='dscacheutil -flushcache' --description 'alias flushcache=dscacheutil -flushcache'
  dscacheutil -flushcache $argv
        
end
