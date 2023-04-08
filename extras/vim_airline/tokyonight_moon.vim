" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Maintainer:   https://github.com/folke/tokyonight.nvim
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------
  
" Palette: {{{
let s:palette = {
  \ 'bg': '#222436',
  \ 'bg_dark': '#1e2030',
  \ 'bg_float': '#1e2030',
  \ 'bg_highlight': '#2f334d',
  \ 'bg_popup': '#1e2030',
  \ 'bg_search': '#3e68d7',
  \ 'bg_sidebar': '#1e2030',
  \ 'bg_statusline': '#1e2030',
  \ 'bg_visual': '#2d3f76',
  \ 'black': '#1b1d2b',
  \ 'blue': '#82aaff',
  \ 'blue0': '#3e68d7',
  \ 'blue1': '#65bcff',
  \ 'blue2': '#0db9d7',
  \ 'blue5': '#89ddff',
  \ 'blue6': '#b4f9f8',
  \ 'blue7': '#394b70',
  \ 'border': '#1b1d2b',
  \ 'border_highlight': '#589ed7',
  \ 'comment': '#636da6',
  \ 'cyan': '#86e1fc',
  \ 'dark3': '#545c7e',
  \ 'dark5': '#737aa2',
  \ 'diff_add': '#273849',
  \ 'diff_change': '#252a3f',
  \ 'diff_delete': '#3a273a',
  \ 'diff_text': '#394b70',
  \ 'error': '#c53b53',
  \ 'fg': '#c8d3f5',
  \ 'fg_dark': '#828bb8',
  \ 'fg_float': '#c8d3f5',
  \ 'fg_gutter': '#3b4261',
  \ 'fg_sidebar': '#828bb8',
  \ 'gitSigns_add': '#627259',
  \ 'gitSigns_change': '#485a86',
  \ 'gitSigns_delete': '#b55a67',
  \ 'git_add': '#b8db87',
  \ 'git_change': '#7ca1f2',
  \ 'git_delete': '#e26a75',
  \ 'git_ignore': '#545c7e',
  \ 'green': '#c3e88d',
  \ 'green1': '#4fd6be',
  \ 'green2': '#41a6b5',
  \ 'hint': '#4fd6be',
  \ 'info': '#0db9d7',
  \ 'magenta': '#c099ff',
  \ 'magenta2': '#ff007c',
  \ 'none': 'NONE',
  \ 'orange': '#ff966c',
  \ 'purple': '#fca7ea',
  \ 'red': '#ff757f',
  \ 'red1': '#c53b53',
  \ 'teal': '#4fd6be',
  \ 'terminal_black': '#444a73',
  \ 'warning': '#ffc777',
  \ 'yellow': '#ffc777',
\ }
" }}}

" Airline theme: {{{
let g:airline#themes#tokyonight_moon#palette = {}

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

let g:airline#themes#tokyonight_moon#palette.normal = s:tokyonight_color_map(s:airline_mode_normal)
let g:airline#themes#tokyonight_moon#palette.insert = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#tokyonight_moon#palette.replace = s:tokyonight_color_map(s:airline_mode_replace)
let g:airline#themes#tokyonight_moon#palette.inactive = s:tokyonight_color_map(s:airline_mode_inactive)
let g:airline#themes#tokyonight_moon#palette.visual = s:tokyonight_color_map(s:airline_mode_visual)
let g:airline#themes#tokyonight_moon#palette.terminal = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#tokyonight_moon#palette.normal.airline_term = s:airline_statusline
let g:airline#themes#tokyonight_moon#palette.terminal.airline_term = s:airline_statusline
let g:airline#themes#tokyonight_moon#palette.visual.airline_term = s:airline_statusline
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
