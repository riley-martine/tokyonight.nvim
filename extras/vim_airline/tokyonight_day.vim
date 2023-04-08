" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Upstream:     https://github.com/folke/tokyonight.nvim/raw/main/extras/vim_airline/tokyonight_day.vim
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------

let g:airline#themes#tokyonight_day#palette = {}

function! airline#themes#tokyonight_day#refresh()
  " no support for non-truecolor
  " guifg, guibg, ctermfg, ctermbg
  let s:airline_mode_normal   = [ '#e9e9ec', '#2e7de9', 0, 0 ]
  let s:airline_mode_insert   = [ '#e9e9ec', '#587539', 0, 0 ]
  let s:airline_mode_replace  = [ '#e9e9ec', '#8c6c3e', 0, 0 ]
  let s:airline_mode_visual   = [ '#e9e9ec', '#7847bd', 0, 0 ]
  let s:airline_mode_inactive = [ '#6172b0', '#e1e2e7', 0, 0 ]

  "let s:airline_info  = [ '#6172b0', '#e1e2e7', 0, 0 ]
  let s:airline_info  = [ '#2e7de9', '#a8aecb', 0, 0 ]
  let s:airline_statusline = [ '#6172b0', '#c4c8da', 0, 0 ]

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
endfunction

call airline#themes#tokyonight_day#refresh()
