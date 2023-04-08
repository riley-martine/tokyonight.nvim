local M = {}
-- TODO ctrl-p and others
-- see: https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/alduin.vim
-- TODO dedup with vim.lua

--- @param colors ColorScheme
function M.generate(colors)
  local ret = [[
" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Maintainer:   https://github.com/folke/tokyonight.nvim
" Derived from: https://github.com/ghifarit53/tokyonight-vim/
" License:      Apache-2.0
" -----------------------------------------------------------------------------
  ]]

  local vimcolors = vim.deepcopy(colors)
  local style_name = vimcolors._style_name
  vimcolors._upstream_url = nil
  vimcolors._style_name = nil

  -- flatten sub-tables (git.add -> git_add)
  for group, v in pairs(vimcolors) do
    if type(v) == "table" then
      vimcolors[group] = nil
      for subgroup, hex in pairs(v) do
        vimcolors[group .. "_" .. subgroup] = hex
      end
    end
  end

  -- get sorted keys for colors
  local colornames = {}
  for k in pairs(vimcolors) do
    table.insert(colornames, k)
  end
  table.sort(colornames)

  ret = ret .. [[

" Palette: {{{
let s:palette = {
]]

  for _, k in ipairs(colornames) do
    ret = ret .. "  \\ '" .. k .. "': '" .. vimcolors[k] .. "',\n"
  end

  ret = ret .. [[
\ }
" }}}
]]

  -- TODO better cterm support
  -- right now it has hardcoded and non-theme-specific values, just there
  -- to unbreak the create palette function.
  ret = ret
    .. [[

" Airline theme: {{{
let g:airline#themes#{theme_name}#palette = {}

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

let g:airline#themes#{theme_name}#palette.normal = s:tokyonight_color_map(s:airline_mode_normal)
let g:airline#themes#{theme_name}#palette.insert = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#{theme_name}#palette.replace = s:tokyonight_color_map(s:airline_mode_replace)
let g:airline#themes#{theme_name}#palette.inactive = s:tokyonight_color_map(s:airline_mode_inactive)
let g:airline#themes#{theme_name}#palette.visual = s:tokyonight_color_map(s:airline_mode_visual)
let g:airline#themes#{theme_name}#palette.terminal = s:tokyonight_color_map(s:airline_mode_insert)
let g:airline#themes#{theme_name}#palette.normal.airline_term = s:airline_statusline
let g:airline#themes#{theme_name}#palette.terminal.airline_term = s:airline_statusline
let g:airline#themes#{theme_name}#palette.visual.airline_term = s:airline_statusline
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
]]

  local theme_name = string.gsub(string.lower(style_name), "tokyo night ", "tokyonight_")
  ret = string.gsub(ret, "{theme_name}", theme_name)
  return ret
end

return M
