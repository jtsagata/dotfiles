function pid-prog --description "Given a pid show the command line"
    for pid in $argv
        cat /proc/$pid/cmdline | xargs -0 bash -c 'printf "%q " "$0" "$@"'
        echo
    end
end
