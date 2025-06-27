function zombies --description "Be aware of zombies"
    set zombies (ps axo pid=,stat= | awk '$2~/^Z/ { print $1 }')
    for z in $zombies
        echo $z (pid-prog $z)
    end
end
