function _zellyj-new-session --description "Start a new zellij session"
    clear
    gum style --foreground 50 --border-foreground 30 --border rounded \
        --align center --width 50 --margin "0 1" --padding "0 4" \
        'Name your new session:'

    set slug (random-slug)
    set name (gum input --placeholder "What is the name of the new session?" --value="$slug")
    if test -z "$name"
        zellij
    else
        zellij --session "$name"
    end
end

function _zellyj-kill-all --description "Kill all zellij sessions"
    gum confirm --default=no "Are you sure you want to kill all Zellij sessions?"
    or return 0

    ctrem "[green]Killing all Zellij sessions...[/]"
    zellij kill-all-sessions --yes
    zellij delete-all-sessions --force --yes
end

function _zellyj-select --description "Select a Zellij session"

    set sessions (zellij list-sessions)
    set sessions $sessions "New session" "Kill All Sessions"

    gum style --foreground 50 --border-foreground 30 --border rounded \
        --align center --width 50 --margin "0 1" --padding "0 4" \
        'Choose a Zellij Session to attach to:'

    set selected (printf "%s\n" $sessions | gum choose --header 'Choose session:' | cut -d ' ' -f 1)

    if test "$selected" = New
        _zellyj-new-session
        exit 0
    else if test "$selected" = Kill
        _zellyj-kill-all
        _zellyj-new-session
        exit 0
    end

    zellij attach "$selected"
end

function zellij-start --description "Start a Zellij session"
    set sessions (zellij list-sessions)

    if test -z "$sessions"
        ctrem "[green]No existing Zellij sessions found. Starting a new session. [/]"
        zellij --session zellij-cosmic
        exit 0
    else
        _zellyj-select
    end
end

# TODO: Convert from bash
# if [[ "$TERM_PROGRAM" != "vscode" && "$TERM_PROGRAM" != "JetBrains" ]]; then
#     start_zellij
# else
#     ctrem "[green]Zellij[/] is not supported in [green]VSCode[/] or [green]JetBrains IDEs[/]."
#     exit 1
# fi
