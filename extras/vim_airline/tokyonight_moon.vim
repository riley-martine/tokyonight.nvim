" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Upstream:     https://github.com/folke/tokyonight.nvim/raw/main/extras/vim_airline/tokyonight_moon.vim
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------

let g:airline#themes#tokyonight_moon#palette = {}

function! airline#themes#tokyonight_moon#refresh()
  " no support for non-truecolor
  " guifg, guibg, ctermfg, ctermbg
  let s:airline_mode_normal   = [ '#1e2030', '#82aaff', 0, 0 ]
  let s:airline_mode_insert   = [ '#1e2030', '#c3e88d', 0, 0 ]
  let s:airline_mode_replace  = [ '#1e2030', '#ffc777', 0, 0 ]
  let s:airline_mode_visual   = [ '#1e2030', '#fca7ea', 0, 0 ]
  let s:airline_mode_inactive = [ '#828bb8', '#222436', 0, 0 ]

  "let s:airline_info  = [ '#828bb8', '#222436', 0, 0 ]
  let s:airline_info  = [ '#82aaff', '#3b4261', 0, 0 ]
  let s:airline_statusline = [ '#828bb8', '#2f334d', 0, 0 ]

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
endfunction

call airline#themes#tokyonight_moon#refresh()
