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

let g:colors_name = '{theme_name}'
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
  -- call s:HL('ErrorMsg', s:palette.error, s:palette.none, 'bold,underline')
  -- call s:HL('WarningMsg', s:palette.warning, s:palette.none)
  -- TODO use palette?
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
        styles = {}
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
  " Definition
  let s:terminal = {
        \ 'black':    s:palette.black,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.orange,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    s:palette.fg
        \ }
  " Implementation: {{{
  let g:terminal_ansi_colors = [s:terminal.black, s:terminal.red, s:terminal.green, s:terminal.yellow,
        \ s:terminal.blue, s:terminal.purple, s:terminal.cyan, s:terminal.white, s:terminal.black, s:terminal.red,
        \ s:terminal.green, s:terminal.yellow, s:terminal.blue, s:terminal.purple, s:terminal.cyan, s:terminal.white]
  " }}}
endif
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
]]

  local theme_name = string.gsub(string.lower(style_name), "tokyo night ", "tokyonight_")
  ret = string.gsub(ret, "{theme_name}", theme_name)
  return ret
end

return M
