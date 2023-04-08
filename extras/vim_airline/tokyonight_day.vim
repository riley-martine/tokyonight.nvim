" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Maintainer:   https://github.com/folke/tokyonight.nvim
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------
  
" Palette: {{{
let s:palette = {
  \ 'bg': '#e1e2e7',
  \ 'bg_dark': '#e9e9ec',
  \ 'bg_float': '#e9e9ec',
  \ 'bg_highlight': '#c4c8da',
  \ 'bg_popup': '#e9e9ec',
  \ 'bg_search': '#7890dd',
  \ 'bg_sidebar': '#e9e9ec',
  \ 'bg_statusline': '#e9e9ec',
  \ 'bg_visual': '#b6bfe2',
  \ 'black': '#e9e9ed',
  \ 'blue': '#2e7de9',
  \ 'blue0': '#7890dd',
  \ 'blue1': '#188092',
  \ 'blue2': '#07879d',
  \ 'blue5': '#006a83',
  \ 'blue6': '#2e5857',
  \ 'blue7': '#92a6d5',
  \ 'border': '#e9e9ed',
  \ 'border_highlight': '#2496ac',
  \ 'comment': '#848cb5',
  \ 'cyan': '#007197',
  \ 'dark3': '#8990b3',
  \ 'dark5': '#68709a',
  \ 'diff_add': '#aecde6',
  \ 'diff_change': '#d6d8e3',
  \ 'diff_delete': '#dfccd4',
  \ 'diff_text': '#92a6d5',
  \ 'error': '#c64343',
  \ 'fg': '#3760bf',
  \ 'fg_dark': '#6172b0',
  \ 'fg_float': '#3760bf',
  \ 'fg_gutter': '#a8aecb',
  \ 'fg_sidebar': '#6172b0',
  \ 'gitSigns_add': '#266d6a',
  \ 'gitSigns_change': '#526c9e',
  \ 'gitSigns_delete': '#b2555b',
  \ 'git_add': '#2c6c75',
  \ 'git_change': '#6183b9',
  \ 'git_delete': '#914c54',
  \ 'git_ignore': '#8990b3',
  \ 'green': '#587539',
  \ 'green1': '#387068',
  \ 'green2': '#38919f',
  \ 'hint': '#118c74',
  \ 'info': '#07879d',
  \ 'magenta': '#9854f1',
  \ 'magenta2': '#d20065',
  \ 'none': 'NONE',
  \ 'orange': '#b15c00',
  \ 'purple': '#7847bd',
  \ 'red': '#f52a65',
  \ 'red1': '#c64343',
  \ 'teal': '#118c74',
  \ 'terminal_black': '#a1a6c5',
  \ 'warning': '#8c6c3e',
  \ 'yellow': '#8c6c3e',
\ }
" }}}

" Airline theme: {{{
let g:airline#themes#tokyonight_day#palette = {}

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

let g:airline#themes#tokyonight_day#palette.normal = s:tokyonight_color_map(s:airline_mode_normal)
let g:airline#themes#tokyonight_day#palette.insert = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#tokyonight_day#palette.replace = s:tokyonight_color_map(s:airline_mode_replace)
let g:airline#themes#tokyonight_day#palette.inactive = s:tokyonight_color_map(s:airline_mode_inactive)
let g:airline#themes#tokyonight_day#palette.visual = s:tokyonight_color_map(s:airline_mode_visual)
let g:airline#themes#tokyonight_day#palette.terminal = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#tokyonight_day#palette.normal.airline_term = s:airline_statusline
let g:airline#themes#tokyonight_day#palette.terminal.airline_term = s:airline_statusline
let g:airline#themes#tokyonight_day#palette.visual.airline_term = s:airline_statusline
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
