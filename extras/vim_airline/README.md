# Vim Airline

This provides support for the [`vim-airline`][airline] plugin.

## Installing

Copy the theme files into your airline themes directory:

```shell
mkdir -p ~/.vim/autoload/airline/themes`
cp extras/vim_airline/*.vim ~/.vim/autoload/airline/themes/
```

Set your theme:

```vimscript
let g:airline_theme = 'tokyonight_day'
```

[airline]: https://github.com/vim-airline/vim-airline
