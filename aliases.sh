alias cat = bat
alias head = coreutils head
alias find = fd
alias du = dust
alias ls = eza -la --octal-permissions --no-permissions --git --icons
alias branch = git rev-parse --abbrev-ref HEAD
alias claer = clear
alias drbash = docker run -it --rm --entrypoint=/bin/bash
alias drsh = docker run -it --rm --entrypoint=/bin/sh
alias used-ports = lsof -PiTCP -sTCP:LISTEN
alias hugo-edit = zellij -l hugo-editor
alias focus-write = zellij -l pomodoro-writer
alias rust-edit = zellij -l rust-editor
alias gconfa = gcloud config configurations activate
alias gconfl = gcloud config configurations list
alias gconf = gcloud config configurations
alias pull-dependabot = ~/.bash_scripts/pull-in-depependabot.sh
alias whatsmyip = ~/.bash_scripts/get-ip.sh
alias get-ip = ~/.bash_scripts/get-ip.sh
alias compare-dirs = ~/.bash_scripts/compare-dirs.sh
alias watch = hwatch
