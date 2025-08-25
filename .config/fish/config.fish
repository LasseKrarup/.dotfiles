if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias pandock='podman run --rm -v "$(pwd):/data" docker.io/pandoc/extra'
alias lg='lazygit'

starship init fish | source
zoxide init fish | source
