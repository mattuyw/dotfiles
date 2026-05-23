#
# ~/.bashrc
#
if [ -n "$ZSH_VERSION" ]; then
    shell=zsh
elif [ -n "$BASH_VERSION" ]; then
    shell=bash
else
   echo "Unsupported shell. Exiting."
   return
fi

tty -s && export GPG_TTY="$(tty)"
alias gpg-bye='gpg-connect-agent updatestartuptty /bye'

if command -v gpgconf > /dev/null 2>&1; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  [ -n "$GPG_TTY" ] && gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
fi

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

export PIP_REQUIRE_VIRTUALENV=true

export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

alias ls='ls --color=auto'
alias ll='ls -lh'

# Create alias override commands using 'lsd'
if command -v lsd > /dev/null 2>&1; then
  alias ls='lsd --group-directories-first'
  alias ll='lsd -lh --group-directories-first'
  alias tree='lsd -l --group-directories-first --tree --depth=2'
fi

command -v nvim > /dev/null 2>&1 && alias vim='nvim'
command -v bat > /dev/null 2>&1 && alias cat='bat --paging=never'

export EDITOR='vim'

if [ "$TERM" != "dumb" ] && command -v thefuck > /dev/null 2>&1; then
  eval $(thefuck --alias)
fi

if [ "$TERM" != "dumb" ] && command -v starship > /dev/null 2>&1; then
  source <(starship init $shell --print-full-init)
fi

export TF_BINARY_PATH="$HOME/.local/bin/terraform" # tfswitch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
