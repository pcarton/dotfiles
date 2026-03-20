# Zsh Configuration File
# Equivalent to the provided Nushell config files (env.nu and config.nu)

# PATH modifications (equivalent to env.nu PATH setup)
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"

# Environment variables (equivalent to env.nu)
export CLOUDSDK_PYTHON='/opt/homebrew/opt/python@3.10/libexec/bin/python'
export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
export EDITOR="$(which hx)"

# Initialize starship (equivalent to starship init nu in config.nu)
eval "$(starship init zsh)"

# Initialize zoxide (equivalent to zoxide init nushell in env.nu)
eval "$(zoxide init zsh)"

# Source aliases (equivalent to source ~/aliases.sh in config.nu)
source ~/aliases.sh

# Completion settings (equivalent to completions in config.nu)
autoload -Uz compinit
compinit

# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Quick completion (auto-select when only one remains)
setopt menu_complete

# Partial completion
setopt complete_in_word

# External completions enabled
# (Zsh uses compinit for this)

# History settings (equivalent to history in config.nu)
HISTSIZE=10000
SAVEHIST=10000
setopt share_history  # Sync history on enter

# Edit mode: emacs (default in Zsh, equivalent to edit_mode: emacs)
# Zsh is emacs by default

# Keybindings (equivalent to keybindings in config.nu)
# Tab for completion menu (default)
# Shift+Tab for previous completion (default)
bindkey '^R' history-incremental-search-backward  # Ctrl+R for history menu
bindkey '^X' menu-complete  # Ctrl+X for next page (approximate)
bindkey '^Z' undo  # Ctrl+Z for undo
bindkey '^Y' yank  # Ctrl+Y for yank
bindkey '^U' backward-kill-line  # Ctrl+U for unix-line-discard
bindkey '^K' kill-line  # Ctrl+K for kill-line
bindkey '^T' menu-select  # Ctrl+T for commands menu (approximate)
bindkey '\eO' menu-select  # Alt+O for vars menu (approximate, using escape sequence)
bindkey '^S' menu-complete  # Ctrl+S for commands with description (approximate)

# Other Zsh options to match behavior
setopt autocd  # Auto cd
setopt extendedglob  # Extended globbing
setopt nomatch  # No error on no matches
setopt notify  # Report status of background jobs immediately

# LS colors (equivalent to ls.use_ls_colors in config.nu)
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
fi
