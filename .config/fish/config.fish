if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias pandock='podman run --rm -v "$(pwd):/data" docker.io/pandoc/extra'

starship init fish | source
