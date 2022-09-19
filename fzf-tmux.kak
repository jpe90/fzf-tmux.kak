hook global ModuleLoaded tmux %{
    define-command -docstring 'Open a file with fzf' -params 0 fzf-tmux-file %{
        evaluate-commands %sh{
            file="$(fd -t f| TMUX="${kak_client_env_TMUX}" fzf-tmux -p '90%' --preview-window '+{2}-/2' --preview 'clp {}'
)"
            if [ -n "$file" ]; then
                printf 'edit "%s"\n' "$file"
            fi
        }
    }
    define-command -docstring 'Open a buffer with fzf' fzf-tmux-buffer %{
        evaluate-commands %sh{
            BUFFER=$(
                (
                    eval "set -- $kak_buflist"
                    while [ $# -gt 0 ]; do
                        printf "%s\0" "$1"
                        shift
                    done
                ) |
                fzf-tmux -p '90%' --preview-window '+{2}-/2' --preview 'clp {}' --read0
            )
            if [ -n "$BUFFER" ]; then
                printf "buffer '%s'" "${BUFFER}"
            fi
        }
    }
}
