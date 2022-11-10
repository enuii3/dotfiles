export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export NODE_OPTIONS="--max-old-space-size=1024"
eval "$(rbenv init -)"

autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white

 # PROMPT変数内で変数参照
setopt prompt_subst

# zsh: no matches foundの対策
setopt nonomatch

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%{$fg[green]%}[%{$reset_color%}%{$fg[blue]%}%b%{$reset_color%}%{$fg[green]%}]%{$reset_color%}" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

PROMPT='%{$fg[green]%}%c%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} '

case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
       #Linux用の設定
       alias ls='ls -F --color=auto'
       ;;
esac

fpath=(~/.zsh/completion $fpath)

# 補完機能有効にする
autoload -U compinit
compinit -u

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nxxxi/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nxxxi/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nxxxi/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nxxxi/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
