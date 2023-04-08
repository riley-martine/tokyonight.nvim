# Vim Port

These files are designed to work with plain (non neo-) Vim.

## Installing

Copy the colorscheme files into your vim directory:

```shell
mkdir -p ~/.vim/colors
cp extras/vim/*.vim ~/.vim/colors/
```

If you're using [`vim-plug`][vim-plug], you can use this hack:

```vimscript
Plug 'folke/tokyonight.nvim',
    \ { 'as': 'tokyonight',
    \   'do': 'mkdir -p autoload/airline/themes; '
    \    . 'mv -f extras/vim_airline/*.vim autoload/airline/themes/; '
    \    . 'mv -f extras/vim/*.vim colors/'}
```

Enable the colorscheme:

```vimscript
colorscheme tokyonight_day " or moon, night, or storm
```

## Truecolor

These files do not support non-truecolor terminals. You will need to `set
termguicolors` in your `vimrc`.

## Undercurls

To test if your terminal supports undercurls, run this:

```shell
printf "\e[4:3mhello\e[0m"
```

You should see the word "hello" with a wiggly line underneath. If this isn't
working and you're running tmux, try the solution in [the main
README](/README.md#making-undercurls-work-properly-in-tmux)

In order to get undercurls working in Vim, you may need to set these in your `vimrc`:

```vimscript
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
```

To test, open any code file and `:set spell`. You should see the words that
aren't in the dictionary with a wiggly line underneath them.

## `vim-airline` Support

See [vim_airline/README.md](/extras/vim_airline/README.md).

[vim-plug]: https://github.com/junegunn/vim-plug
