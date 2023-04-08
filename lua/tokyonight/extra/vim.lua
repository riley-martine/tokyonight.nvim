local util = require("tokyonight.util")

local M = {}
-- TODO gutter
-- TODO "colorscheme" not just auto
-- TODO highlight under cursor not selected

--- @param colors ColorScheme
function M.generate(colors)
  colors._style_name = "tokyonight_" .. colors._style_name:lower():match(" (%w+)$")

  colors._light_or_dark = "dark"
  if colors._style_name == "tokyonight_day" then
    colors._light_or_dark = "light"
  end

  local ret = [[
" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Description:  A dark and light Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
" Upstream:     ${_upstream_url}
" License:      Apache-2.0
" -----------------------------------------------------------------------------

" Initialization: {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

let g:colors_name = '${_style_name}'
set background=${_light_or_dark}
" }}}

" Function: {{{
" call s:HL(group, foreground, background)
" call s:HL(group, foreground, background, gui, guisp)
"
" E.g.:
"   call s:HL('Normal', s:palette.fg, s:palette.bg)
"
" Support for non-truecolor has been removed. If reimplementing, see:
" https://github.com/ghifarit53/tokyonight-vim/blob/4e82e0f0452a6ce8f387828ec71013015515035a/colors/tokyonight.vim#L91
function! s:HL(group, fg, bg, ...)
  let hl_string = [
        \ 'highlight', a:group,
        \ 'guifg=' . a:fg,
        \ 'guibg=' . a:bg,
        \ ]
  if a:0 >= 1
    call add(hl_string, 'gui=' . a:1)
    call add(hl_string, 'cterm=' . a:1)
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

" Highlight: {{{
]]

  -- get sorted keys for highlights
  local hl = vim.deepcopy(require("tokyonight.theme").setup().highlights)
  local hlgroups = {}
  for group_name in pairs(hl) do
    table.insert(hlgroups, group_name)
  end
  table.sort(hlgroups)

  -- highlight groups
  for _, group_name in ipairs(hlgroups) do
    local group = hl[group_name]
    if not group_name:find("^@") then
      local styles = {}

      if group.bold then
        table.insert(styles, "bold")
      end

      if group.italic or (group.style and group.style.italic) then
        table.insert(styles, "italic")
      end

      if group.underline then
        table.insert(styles, "underline")
      end

      if group.undercurl then
        table.insert(styles, "undercurl")
      end

      local template = "call s:HL('${group_name}', '${fg}', '${bg}'"
      if #styles > 0 then
        template = template .. ", '${style}'"
        if group["sp"] then
          template = template .. ", '${sp}'"
        end
      end
      template = template .. ")\n"

      ret = ret
        .. util.template(template, {
          group_name = group_name,
          fg = (group["fg"] or "NONE"),
          bg = (group["bg"] or "NONE"),
          style = table.concat(styles, ","),
          sp = group["sp"],
        })
    end
  end

  ret = ret
    .. [[
" }}}

" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['${black}', '${red}', '${green}', '${yellow}',
        \ '${blue}', '${purple}', '${cyan}', '${fg}', '${black}', '${red}',
        \ '${green}', '${yellow}', '${blue}', '${purple}', '${cyan}', '${fg}']
endif
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
]]

  return util.template(ret, colors)
end

return M
