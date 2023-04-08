local util = require("tokyonight.util")

local M = {}
-- TODO gutter
-- TODO "colorscheme" not just auto

--- @param colors ColorScheme
function M.generate(colors)
  local ret = [[
" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Maintainer:   https://github.com/folke/tokyonight.nvim
" License:      Apache-2.0
" -----------------------------------------------------------------------------

" Initialization: {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:tmux = executable('tmux') && $TMUX !=# ''

let g:colors_name = '{_style_name}'
" }}}

" Function: {{{
" call s:HL(group, foreground, background)
" call s:HL(group, foreground, background, gui, guisp)
"
" E.g.:
" call s:HL('Normal', s:palette.fg, s:palette.bg)

" Support for non-truecolor has been removed. If reimplementing, see:
" https://github.com/ghifarit53/tokyonight-vim/blob/4e82e0f0452a6ce8f387828ec71013015515035a/colors/tokyonight.vim#L91
function! s:HL(group, fg, bg, ...)
  let hl_string = [
        \ 'highlight', a:group,
        \ 'guifg=' . a:fg,
        \ 'guibg=' . a:bg,
        \ ]
  if a:0 >= 1
    if a:1 ==# 'undercurl'
      if !s:tmux
        call add(hl_string, 'gui=undercurl')
      else
        call add(hl_string, 'gui=underline')
      endif
      call add(hl_string, 'cterm=underline')
    else
      call add(hl_string, 'gui=' . a:1)
      call add(hl_string, 'cterm=' . a:1)
    endif
  else
    call add(hl_string, 'gui=NONE')
    call add(hl_string, 'cterm=NONE')
  endif
  if a:0 >= 2
    call add(hl_string, 'guisp=' . a:2)
  endif
  execute join(hl_string, ' ')
endfunction
" }}}
]]

  colors._style_name = colors._style_name:lower():gsub("tokyo night ", "tokyonight_")

  ret = ret .. [[
" Highlight: {{{
]]

  -- get sorted keys for highlights
  local hl = vim.deepcopy(require("tokyonight.theme").setup().highlights)
  local hlgroups = {}
  for k in pairs(hl) do
    table.insert(hlgroups, k)
  end
  table.sort(hlgroups)

  -- highlight groups
  for _, k in ipairs(hlgroups) do
    if not k:find("^@") then
      local fg = hl[k]["fg"]
      local bg = hl[k]["bg"]
      local sp = hl[k]["sp"]
      local style = nil

      if not fg then
        fg = "NONE"
      end
      if not bg then
        bg = "NONE"
      end

      if hl[k].undercurl then
        style = "undercurl"
      else
        local styles = {}
        if hl[k].bold then
          table.insert(styles, "bold")
        end

        if hl[k].italic or (hl[k].style and hl[k].style.italic) then
          table.insert(styles, "italic")
        end

        if hl[k].underline then
          table.insert(styles, "underline")
        end

        if #styles > 0 then
          style = table.concat(styles, ",")
        end
      end

      local call = "call s:HL('" .. k .. "', '" .. fg .. "', '" .. bg .. "'"
      if style then
        call = call .. ", '" .. style .. "'"
        if sp then
          call = call .. ", '" .. sp .. "'"
        end
      end
      call = call .. ")\n"
      ret = ret .. call
    end
  end

  ret = ret
    .. [[
" }}}

" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['${black}' '${red}' '${green}' '${yellow}'
        \ '${blue}' '${purple}' '${cyan}' '${fg}' '${black}' '${red}'
        \ '${green}' '${yellow}' '${blue}' '${purple}' '${cyan}' '${fg}']
endif
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
]]

  return util.template(ret, colors)
end

return M
