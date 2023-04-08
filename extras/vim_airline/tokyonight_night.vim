" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Maintainer:   https://github.com/folke/tokyonight.nvim
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------
  
" Palette: {{{
let s:palette = {
  \ 'bg': '#1a1b26',
  \ 'bg_dark': '#16161e',
  \ 'bg_float': '#16161e',
  \ 'bg_highlight': '#292e42',
  \ 'bg_popup': '#16161e',
  \ 'bg_search': '#3d59a1',
  \ 'bg_sidebar': '#16161e',
  \ 'bg_statusline': '#16161e',
  \ 'bg_visual': '#283457',
  \ 'black': '#15161e',
  \ 'blue': '#7aa2f7',
  \ 'blue0': '#3d59a1',
  \ 'blue1': '#2ac3de',
  \ 'blue2': '#0db9d7',
  \ 'blue5': '#89ddff',
  \ 'blue6': '#b4f9f8',
  \ 'blue7': '#394b70',
  \ 'border': '#15161e',
  \ 'border_highlight': '#27a1b9',
  \ 'comment': '#565f89',
  \ 'cyan': '#7dcfff',
  \ 'dark3': '#545c7e',
  \ 'dark5': '#737aa2',
  \ 'diff_add': '#20303b',
  \ 'diff_change': '#1f2231',
  \ 'diff_delete': '#37222c',
  \ 'diff_text': '#394b70',
  \ 'error': '#db4b4b',
  \ 'fg': '#c0caf5',
  \ 'fg_dark': '#a9b1d6',
  \ 'fg_float': '#c0caf5',
  \ 'fg_gutter': '#3b4261',
  \ 'fg_sidebar': '#a9b1d6',
  \ 'gitSigns_add': '#399a96',
  \ 'gitSigns_change': '#6382bd',
  \ 'gitSigns_delete': '#c25d64',
  \ 'git_add': '#4097a3',
  \ 'git_change': '#506d9b',
  \ 'git_delete': '#c47981',
  \ 'git_ignore': '#545c7e',
  \ 'green': '#9ece6a',
  \ 'green1': '#73daca',
  \ 'green2': '#41a6b5',
  \ 'hint': '#1abc9c',
  \ 'info': '#0db9d7',
  \ 'magenta': '#bb9af7',
  \ 'magenta2': '#ff007c',
  \ 'none': 'NONE',
  \ 'orange': '#ff9e64',
  \ 'purple': '#9d7cd8',
  \ 'red': '#f7768e',
  \ 'red1': '#db4b4b',
  \ 'teal': '#1abc9c',
  \ 'terminal_black': '#414868',
  \ 'warning': '#e0af68',
  \ 'yellow': '#e0af68',
\ }
" }}}

" Airline theme: {{{
let g:airline#themes#tokyo night#palette = {}

let s:foreground = [ s:palette.fg_dark, 250 ]
let s:background = [ s:palette.bg_statusline, 235 ]
let s:background_alt = [ s:palette.bg_highlight, 236 ]
let s:background_grey = [ s:palette.bg, 238 ]
let s:yellow = [ s:palette.yellow, 179 ]
let s:green = [ s:palette.green, 107 ]
let s:blue = [ s:palette.blue, 110 ]
let s:purple = [ s:palette.purple, 176 ]

"                               guifg            guibg      ctermfg          ctermbg
let s:airline_mode_normal   = [ s:background[0], s:blue[0], s:background[1], s:blue[1] ]
let s:airline_mode_insert   = [ s:background[0], s:green[0], s:background[1], s:green[1] ]
let s:airline_mode_replace  = [ s:background[0], s:yellow[0], s:background[1], s:yellow[1] ]
let s:airline_mode_visual   = [ s:background[0], s:purple[0], s:background[1], s:purple[1] ]
let s:airline_mode_inactive = [ s:foreground[0], s:background_grey[0], s:foreground[1], s:background_grey[1] ]

let s:airline_info  = [ s:foreground[0], s:background_grey[0], s:foreground[1], s:background_grey[1] ]
let s:airline_statusline = [ s:foreground[0], s:background_alt[0], s:foreground[1], s:background_alt[1] ]

function! s:tokyonight_color_map(mode)
    return airline#themes#generate_color_map(a:mode, s:airline_info, s:airline_statusline)
endfunction

let g:airline#themes#tokyo night#palette.normal = s:tokyonight_color_map(s:airline_mode_normal)
let g:airline#themes#tokyo night#palette.insert = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#tokyo night#palette.replace = s:tokyonight_color_map(s:airline_mode_replace)
let g:airline#themes#tokyo night#palette.inactive = s:tokyonight_color_map(s:airline_mode_inactive)
let g:airline#themes#tokyo night#palette.visual = s:tokyonight_color_map(s:airline_mode_visual)
let g:airline#themes#tokyo night#palette.terminal = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#tokyo night#palette.normal.airline_term = s:airline_statusline
let g:airline#themes#tokyo night#palette.terminal.airline_term = s:airline_statusline
let g:airline#themes#tokyo night#palette.visual.airline_term = s:airline_statusline
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
