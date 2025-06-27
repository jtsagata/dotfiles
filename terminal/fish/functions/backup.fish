function backup --argument filename --description 'backup a file'
    cp $filename $filename.bak
end
