# セットアップ
自分用のセットアップ・メモです.

## git clone
```bash
$ git clone https://github.com/hogehoge/dotfiles.git
```

## homebrew のインストール
最新のインストール手順は[こちら](https://brew.sh/index_ja)を見たほうが確実.
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
$ eval "$(/opt/homebrew/bin/brew shellenv)"
```

## fzf のインストール
```bash
$ brew install fzf
$ (brew --prefix)/opt/fzf/install
```

## Prezto のインストール

手順は[こちら](https://github.com/sorin-ionescu/prezto)を見たほうが確実.
```bash
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

$ setopt EXTENDED_GLOB
> for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
>   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
> done

# - $HOME/.zshrc $HOME/.zshenv が存在する場合は退避 
$ mv $HOME/.zshrc $HOME/.zshrc.orig
$ mv $HOME/.zshenv $HOME/.zshenv.orig

$ cd $HOME && unlink .zshrc .zshenv
$ ln -sf dotfiles/.zshrc ~
$ ln -sf dotfiles/.zshenv ~
# - 上記の Prezto の読み込み部分を追記する
$ vi ~/.zshrc
```

## dein.vim のインストール
```bash
$ ln -sf dotfiles/.vimrc ~
$ cd ~ && curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ mkdir -p .vim/dein
$ sh ./installer.sh ~/dein/
```

## 参考にさせてもらったサイト
- [【詳解】モテたいVimmer必見　快適にコーディングするためのvimrc解説](https://qiita.com/ahiruman5/items/4f3c845500c172a02935)
- [dein.vimでプラグイン管理のはじめ方](https://qiita.com/sugamondo/items/fcaf210ca86d65bcaca8)
