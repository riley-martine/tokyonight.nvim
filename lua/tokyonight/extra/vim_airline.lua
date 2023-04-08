local util = require("tokyonight.util")

local M = {}
-- TODO ctrl-p and others
-- see: https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/alduin.vim

--- @param colors ColorScheme
function M.generate(colors)
  colors._style_name = colors._style_name:lower():gsub("tokyo night ", "tokyonight_")

  return util.template(M.template, colors)
end

M.template = [[
" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Upstream:     ${_upstream_url}
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------

let g:airline#themes#${_style_name}#palette = {}

function! airline#themes#${_style_name}#refresh()
  " no support for non-truecolor
  " guifg, guibg, ctermfg, ctermbg
  let s:airline_mode_normal   = [ '${bg_statusline}', '${blue}', 0, 0 ]
  let s:airline_mode_insert   = [ '${bg_statusline}', '${green}', 0, 0 ]
  let s:airline_mode_replace  = [ '${bg_statusline}', '${yellow}', 0, 0 ]
  let s:airline_mode_visual   = [ '${bg_statusline}', '${purple}', 0, 0 ]
  let s:airline_mode_inactive = [ '${fg_dark}', '${bg}', 0, 0 ]

  let s:airline_info  = [ '${fg_dark}', '${bg}', 0, 0 ]
  let s:airline_statusline = [ '${fg_dark}', '${bg_highlight}', 0, 0 ]

  function! s:tokyonight_color_map(mode)
      return airline#themes#generate_color_map(a:mode, s:airline_info, s:airline_statusline)
  endfunction

  let g:airline#themes#${_style_name}#palette.normal = s:tokyonight_color_map(s:airline_mode_normal)
  let g:airline#themes#${_style_name}#palette.insert = s:tokyonight_color_map(s:airline_mode_insert)
  let g:airline#themes#${_style_name}#palette.replace = s:tokyonight_color_map(s:airline_mode_replace)
  let g:airline#themes#${_style_name}#palette.inactive = s:tokyonight_color_map(s:airline_mode_inactive)
  let g:airline#themes#${_style_name}#palette.visual = s:tokyonight_color_map(s:airline_mode_visual)
  let g:airline#themes#${_style_name}#palette.terminal = s:tokyonight_color_map(s:airline_mode_insert)
  let g:airline#themes#${_style_name}#palette.normal.airline_term = s:airline_statusline
  let g:airline#themes#${_style_name}#palette.terminal.airline_term = s:airline_statusline
  let g:airline#themes#${_style_name}#palette.visual.airline_term = s:airline_statusline
endfunction

call airline#themes#${_style_name}#refresh()
]]

return M
