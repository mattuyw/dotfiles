#if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
# tmux attach-session -t $USER || tmux new-session -s $USER
#fi

autoload -Uz compinit; compinit -C

# plugin manager
if [ -f "$HOME/.local/share/zap/zap.zsh" ]; then
  source "$HOME/.local/share/zap/zap.zsh"
  plug "zsh-users/zsh-autosuggestions"
  plug "zsh-users/zsh-syntax-highlighting"
  plug "zsh-users/zsh-completions"
  plug "aloxaf/fzf-tab"
  plug "freed-wu/fzf-tab-source"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
