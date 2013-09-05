export LANG=ja_JP.UTF-8

## 色を使う
setopt prompt_subst
## ビープを鳴らさない
setopt nobeep
## 補完候補を詰めて表示
setopt list_packed
## 補完候補を一覧表示
setopt auto_list
## TAB で順に補完候補を切り替える
setopt auto_menu
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## プロンプトの設定
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

# alias
## lsコマンドのショートカット
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
## ファイル操作を確認する。
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
## Emacsのショートカット。
alias e="emacs"
### -nw: ターミナル内でEmacsを起動する。
alias enw="emacs -nw"

# git push でのログイン時にBackSpaceが「^H」になる問題対応
stty erase ^H

