---
tags:  facebook photo vim
title: Visual Studio Code + Neovim
---
*[ɸ](https://en.wikipedia.org/wiki/Golden_ratio "1.618") minute read.*

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fzeljko.filipin%2Fposts%2F10158798342837290&show_text=true&width=552&height=325&appId" width="552" height="325" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

I've started using Vim in [2014](https://github.com/zeljkofilipin/dotfiles/commit/a21f4bb5834695dafba64e7c59a05694eaf52fdc). I've read a few books, wrote a few articles and gave a few talks on [Vim](/tags/vim). I really like editing text with Vim, but I was never happy with it's file management, extensions, things like that.

I've noticed that Visual Studio Code (VSCode) is used by slightly more than 50% of developers that participated in [2019 Stack Overflow survey](https://insights.stackoverflow.com/survey/2019#development-environments-and-tools). (I didn't find editors section in [2020 survey](https://insights.stackoverflow.com/survey/2020#development-environments-and-tools).)

I've learned about Neovim in [Modern Vim](https://pragprog.com/titles/modvim/modern-vim/) book. (I never wrote the book review.) I've started using Neovim in [2018](https://github.com/zeljkofilipin/dotfiles/commit/c4320cae324b5c06169be6267bb839becb1960cb) after I've started reading the book.

I've noticed more and more people using VSCode so I gave it a try earlier this year.  The only record I have is a commit in my [dotfiles](https://github.com/zeljkofilipin/dotfiles/commit/87e71cc4e3487a1d88249f4205fbba4785fddd5e) from a few days ago, but I know I've been using it for a few months. I liked VSCode in general. It has all the features I need and a lot of extensions. But, after using Vim, editing text using anything else feels like walking backwards. (Editing text using Vim feels like running. Forwards.)

vscode-neovim VSCode extension was all I needed to connect the two. A real Vim implementation (not an emulator!) inside VSCode.

You need three things. VSCode, Neovim and vscode-neovim.

Installing VSCode is simple, download the installer from the site.

Installing Neovim should also be simple. I've installed it on a Mac using [Homebrew](https://brew.sh/) and all I needed to do was:

```shell
brew install --HEAD neovim
```

`--HEAD` part is important. It will install version 0.5. If you don't use `--HEAD` you will get version 0.4. vscode-neovim needs version 0.5.

vscode-neovim is installed from VSCode Extensions. Search for *Neo Vim* by Alexey Svetliakov.

## Links

- [Visual Studio Code](https://code.visualstudio.com/) at visualstudio.com
- [Neovim](https://neovim.io/) at neovim.io
- [vscode-neovim](https://github.com/asvetliakov/vscode-neovim) at github.com