if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias pandock='docker run --rm -v "$(pwd):/data" docker.io/pandoc/extra'
alias lg="lazygit"
alias vi="nvim"
alias vim="nvim"

starship init fish | source
zoxide init fish | source
