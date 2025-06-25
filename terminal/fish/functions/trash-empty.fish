function trash-empty --description 'Empty trash'
    
    for f in (trash-list --trash-dirs)
        du -hs $f | grep -v ^0
    end
    
    if gum confirm --default=no 'Empty trash?'
        command trash-empty -f
        wait
    end

end