alias cat = bat
alias head = coreutils head
alias find = fd
alias du = dust
alias ls = exa -la --octal-permissions --no-permissions --git --icons
alias branch = git rev-parse --abbrev-ref HEAD
alias claer = clear
alias drbash = docker run -it --rm --entrypoint=/bin/bash
alias drsh = docker run -it --rm --entrypoint=/bin/sh
alias used-ports = lsof -PiTCP -sTCP:LISTEN
alias hugo-edit = zellij -l hugo-editor
