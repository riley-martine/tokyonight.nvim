" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Upstream:     https://github.com/folke/tokyonight.nvim/raw/main/extras/vim_airline/tokyonight_night.vim
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------

let g:airline#themes#tokyonight_night#palette = {}

function! airline#themes#tokyonight_night#refresh()
  " no support for non-truecolor
  " guifg, guibg, ctermfg, ctermbg
  let s:airline_mode_normal   = [ '#16161e', '#7aa2f7', 0, 0 ]
  let s:airline_mode_insert   = [ '#16161e', '#9ece6a', 0, 0 ]
  let s:airline_mode_replace  = [ '#16161e', '#e0af68', 0, 0 ]
  let s:airline_mode_visual   = [ '#16161e', '#9d7cd8', 0, 0 ]
  let s:airline_mode_inactive = [ '#a9b1d6', '#1a1b26', 0, 0 ]

  "let s:airline_info  = [ '#a9b1d6', '#1a1b26', 0, 0 ]
  let s:airline_info  = [ '#7aa2f7', '#3b4261', 0, 0 ]
  let s:airline_statusline = [ '#a9b1d6', '#292e42', 0, 0 ]

  function! s:tokyonight_color_map(mode)
      return airline#themes#generate_color_map(a:mode, s:airline_info, s:airline_statusline)
  endfunction

  let g:airline#themes#tokyonight_night#palette.normal = s:tokyonight_color_map(s:airline_mode_normal)
  let g:airline#themes#tokyonight_night#palette.insert = s:tokyonight_color_map(s:airline_mode_insert)
  let g:airline#themes#tokyonight_night#palette.replace = s:tokyonight_color_map(s:airline_mode_replace)
  let g:airline#themes#tokyonight_night#palette.inactive = s:tokyonight_color_map(s:airline_mode_inactive)
  let g:airline#themes#tokyonight_night#palette.visual = s:tokyonight_color_map(s:airline_mode_visual)
  let g:airline#themes#tokyonight_night#palette.terminal = s:tokyonight_color_map(s:airline_mode_insert)
  let g:airline#themes#tokyonight_night#palette.normal.airline_term = s:airline_statusline
  let g:airline#themes#tokyonight_night#palette.terminal.airline_term = s:airline_statusline
  let g:airline#themes#tokyonight_night#palette.visual.airline_term = s:airline_statusline
endfunction

call airline#themes#tokyonight_night#refresh()
