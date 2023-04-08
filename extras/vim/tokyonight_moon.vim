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

let g:colors_name = 'tokyonight_moon'
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

" Highlight: {{{
call s:HL('ALEErrorSign', '#c53b53', 'NONE')
call s:HL('ALEWarningSign', '#ffc777', 'NONE')
call s:HL('AlphaButtons', '#86e1fc', 'NONE')
call s:HL('AlphaFooter', '#65bcff', 'NONE')
call s:HL('AlphaHeader', '#82aaff', 'NONE')
call s:HL('AlphaHeaderLabel', '#ff966c', 'NONE')
call s:HL('AlphaShortcut', '#ff966c', 'NONE')
call s:HL('Bold', 'NONE', 'NONE', 'bold')
call s:HL('BufferAlternate', '#c8d3f5', '#3b4261')
call s:HL('BufferAlternateERROR', '#c53b53', '#3b4261')
call s:HL('BufferAlternateHINT', '#4fd6be', '#3b4261')
call s:HL('BufferAlternateINFO', '#0db9d7', '#3b4261')
call s:HL('BufferAlternateIndex', '#0db9d7', '#3b4261')
call s:HL('BufferAlternateMod', '#ffc777', '#3b4261')
call s:HL('BufferAlternateSign', '#0db9d7', '#3b4261')
call s:HL('BufferAlternateTarget', '#ff757f', '#3b4261')
call s:HL('BufferAlternateWARN', '#ffc777', '#3b4261')
call s:HL('BufferCurrent', '#c8d3f5', '#3b4261')
call s:HL('BufferCurrentERROR', '#c53b53', '#3b4261')
call s:HL('BufferCurrentHINT', '#4fd6be', '#3b4261')
call s:HL('BufferCurrentINFO', '#0db9d7', '#3b4261')
call s:HL('BufferCurrentIndex', '#0db9d7', '#3b4261')
call s:HL('BufferCurrentMod', '#ffc777', '#3b4261')
call s:HL('BufferCurrentSign', '#0db9d7', '#3b4261')
call s:HL('BufferCurrentTarget', '#ff757f', '#3b4261')
call s:HL('BufferCurrentWARN', '#ffc777', '#3b4261')
call s:HL('BufferInactive', '#737aa2', '#1e2030')
call s:HL('BufferInactiveERROR', '#94344a', '#1e2030')
call s:HL('BufferInactiveHINT', '#42a195', '#1e2030')
call s:HL('BufferInactiveINFO', '#138ca7', '#1e2030')
call s:HL('BufferInactiveIndex', '#737aa2', '#1e2030')
call s:HL('BufferInactiveMod', '#bd9664', '#1e2030')
call s:HL('BufferInactiveSign', '#589ed7', '#1e2030')
call s:HL('BufferInactiveTarget', '#ff757f', '#1e2030')
call s:HL('BufferInactiveWARN', '#bd9664', '#1e2030')
call s:HL('BufferLineIndicatorSelected', '#7ca1f2', 'NONE')
call s:HL('BufferOffset', '#737aa2', '#1e2030')
call s:HL('BufferTabpageFill', '#737aa2', '#1e2030')
call s:HL('BufferTabpages', 'NONE', '#1e2030')
call s:HL('BufferVisible', '#c8d3f5', '#1e2030')
call s:HL('BufferVisibleERROR', '#c53b53', '#1e2030')
call s:HL('BufferVisibleHINT', '#4fd6be', '#1e2030')
call s:HL('BufferVisibleINFO', '#0db9d7', '#1e2030')
call s:HL('BufferVisibleIndex', '#0db9d7', '#1e2030')
call s:HL('BufferVisibleMod', '#ffc777', '#1e2030')
call s:HL('BufferVisibleSign', '#0db9d7', '#1e2030')
call s:HL('BufferVisibleTarget', '#ff757f', '#1e2030')
call s:HL('BufferVisibleWARN', '#ffc777', '#1e2030')
call s:HL('Character', '#c3e88d', 'NONE')
call s:HL('CmpDocumentation', '#c8d3f5', '#1e2030')
call s:HL('CmpDocumentationBorder', '#589ed7', '#1e2030')
call s:HL('CmpItemAbbr', '#c8d3f5', 'NONE')
call s:HL('CmpItemAbbrDeprecated', '#3b4261', 'NONE')
call s:HL('CmpItemAbbrMatch', '#65bcff', 'NONE')
call s:HL('CmpItemAbbrMatchFuzzy', '#65bcff', 'NONE')
call s:HL('CmpItemKindClass', '#ff966c', 'NONE')
call s:HL('CmpItemKindConstant', '#c099ff', 'NONE')
call s:HL('CmpItemKindConstructor', '#82aaff', 'NONE')
call s:HL('CmpItemKindCopilot', '#4fd6be', 'NONE')
call s:HL('CmpItemKindDefault', '#828bb8', 'NONE')
call s:HL('CmpItemKindEnum', '#ff966c', 'NONE')
call s:HL('CmpItemKindEnumMember', '#4fd6be', 'NONE')
call s:HL('CmpItemKindEvent', '#ff966c', 'NONE')
call s:HL('CmpItemKindField', '#4fd6be', 'NONE')
call s:HL('CmpItemKindFunction', '#82aaff', 'NONE')
call s:HL('CmpItemKindInterface', '#ff966c', 'NONE')
call s:HL('CmpItemKindKeyword', '#86e1fc', 'NONE')
call s:HL('CmpItemKindMethod', '#82aaff', 'NONE')
call s:HL('CmpItemKindModule', '#ffc777', 'NONE')
call s:HL('CmpItemKindOperator', '#4fd6be', 'NONE')
call s:HL('CmpItemKindProperty', '#4fd6be', 'NONE')
call s:HL('CmpItemKindReference', '#c099ff', 'NONE')
call s:HL('CmpItemKindSnippet', '#737aa2', 'NONE')
call s:HL('CmpItemKindStruct', '#ff966c', 'NONE')
call s:HL('CmpItemKindTypeParameter', '#4fd6be', 'NONE')
call s:HL('CmpItemKindUnit', '#ff966c', 'NONE')
call s:HL('CmpItemKindValue', '#c099ff', 'NONE')
call s:HL('CmpItemKindVariable', '#c099ff', 'NONE')
call s:HL('CmpItemMenu', '#636da6', 'NONE')
call s:HL('ColorColumn', 'NONE', '#1b1d2b')
call s:HL('Comment', '#636da6', 'NONE', 'italic')
call s:HL('Conceal', '#737aa2', 'NONE')
call s:HL('Constant', '#ff966c', 'NONE')
call s:HL('CurSearch', 'NONE', 'NONE')
call s:HL('Cursor', '#222436', '#c8d3f5')
call s:HL('CursorColumn', 'NONE', '#2f334d')
call s:HL('CursorIM', '#222436', '#c8d3f5')
call s:HL('CursorLine', 'NONE', '#2f334d')
call s:HL('CursorLineNr', '#737aa2', 'NONE')
call s:HL('DashboardCenter', '#c099ff', 'NONE')
call s:HL('DashboardFooter', '#ffc777', 'NONE', 'italic')
call s:HL('DashboardHeader', '#82aaff', 'NONE')
call s:HL('DashboardShortCut', '#86e1fc', 'NONE')
call s:HL('DefinitionCount', '#fca7ea', 'NONE')
call s:HL('DefinitionIcon', '#82aaff', 'NONE')
call s:HL('DiagnosticError', '#c53b53', 'NONE')
call s:HL('DiagnosticHint', '#4fd6be', 'NONE')
call s:HL('DiagnosticInfo', '#0db9d7', 'NONE')
call s:HL('DiagnosticInformation', 'NONE', 'NONE')
call s:HL('DiagnosticUnderlineError', 'NONE', 'NONE', 'undercurl', '#c53b53')
call s:HL('DiagnosticUnderlineHint', 'NONE', 'NONE', 'undercurl', '#4fd6be')
call s:HL('DiagnosticUnderlineInfo', 'NONE', 'NONE', 'undercurl', '#0db9d7')
call s:HL('DiagnosticUnderlineWarn', 'NONE', 'NONE', 'undercurl', '#ffc777')
call s:HL('DiagnosticVirtualTextError', '#c53b53', '#322639')
call s:HL('DiagnosticVirtualTextHint', '#4fd6be', '#273644')
call s:HL('DiagnosticVirtualTextInfo', '#0db9d7', '#203346')
call s:HL('DiagnosticVirtualTextWarn', '#ffc777', '#38343d')
call s:HL('DiagnosticWarn', '#ffc777', 'NONE')
call s:HL('DiagnosticWarning', 'NONE', 'NONE')
call s:HL('DiffAdd', 'NONE', '#273849')
call s:HL('DiffChange', 'NONE', '#252a3f')
call s:HL('DiffDelete', 'NONE', '#3a273a')
call s:HL('DiffText', 'NONE', '#394b70')
call s:HL('Directory', '#82aaff', 'NONE')
call s:HL('EndOfBuffer', '#222436', 'NONE')
call s:HL('Error', '#c53b53', 'NONE')
call s:HL('ErrorMsg', '#c53b53', 'NONE')
call s:HL('FernBranchText', '#82aaff', 'NONE')
call s:HL('FloatBorder', '#589ed7', '#1e2030')
call s:HL('FoldColumn', '#636da6', '#222436')
call s:HL('Folded', '#82aaff', '#3b4261')
call s:HL('Foo', '#ff007c', '#ff007c')
call s:HL('Function', '#82aaff', 'NONE')
call s:HL('GitGutterAdd', '#627259', 'NONE')
call s:HL('GitGutterChange', '#485a86', 'NONE')
call s:HL('GitGutterDelete', '#b55a67', 'NONE')
call s:HL('GitSignsAdd', '#627259', 'NONE')
call s:HL('GitSignsChange', '#485a86', 'NONE')
call s:HL('GitSignsDelete', '#b55a67', 'NONE')
call s:HL('GlyphPalette1', '#c53b53', 'NONE')
call s:HL('GlyphPalette2', '#c3e88d', 'NONE')
call s:HL('GlyphPalette3', '#ffc777', 'NONE')
call s:HL('GlyphPalette4', '#82aaff', 'NONE')
call s:HL('GlyphPalette6', '#4fd6be', 'NONE')
call s:HL('GlyphPalette7', '#c8d3f5', 'NONE')
call s:HL('GlyphPalette9', '#ff757f', 'NONE')
call s:HL('Hlargs', '#ffc777', 'NONE')
call s:HL('HopNextKey', '#ff007c', 'NONE', 'bold')
call s:HL('HopNextKey1', '#0db9d7', 'NONE', 'bold')
call s:HL('HopNextKey2', '#157d97', 'NONE')
call s:HL('HopUnmatched', '#545c7e', 'NONE')
call s:HL('Identifier', '#c099ff', 'NONE')
call s:HL('IlluminatedWordRead', 'NONE', '#3b4261')
call s:HL('IlluminatedWordText', 'NONE', '#3b4261')
call s:HL('IlluminatedWordWrite', 'NONE', '#3b4261')
call s:HL('IncSearch', '#1b1d2b', '#ff966c')
call s:HL('IndentBlanklineChar', '#3b4261', 'NONE')
call s:HL('IndentBlanklineContextChar', '#fca7ea', 'NONE')
call s:HL('Italic', 'NONE', 'NONE', 'italic')
call s:HL('Keyword', '#86e1fc', 'NONE', 'italic')
call s:HL('LazyProgressDone', '#ff007c', 'NONE', 'bold')
call s:HL('LazyProgressTodo', '#3b4261', 'NONE', 'bold')
call s:HL('LeapBackdrop', '#545c7e', 'NONE')
call s:HL('LeapLabelPrimary', '#ff007c', 'NONE', 'bold')
call s:HL('LeapLabelSecondary', '#4fd6be', 'NONE', 'bold')
call s:HL('LeapMatch', '#c8d3f5', '#ff007c', 'bold')
call s:HL('LightspeedGreyWash', '#545c7e', 'NONE')
call s:HL('LightspeedLabel', '#ff007c', 'NONE', 'bold,underline')
call s:HL('LightspeedLabelDistant', '#4fd6be', 'NONE', 'bold,underline')
call s:HL('LightspeedLabelDistantOverlapped', '#41a6b5', 'NONE', 'underline')
call s:HL('LightspeedLabelOverlapped', '#ff007c', 'NONE', 'underline')
call s:HL('LightspeedMaskedChar', '#ff966c', 'NONE')
call s:HL('LightspeedOneCharMatch', '#c8d3f5', '#ff007c', 'bold')
call s:HL('LightspeedPendingOpArea', '#c8d3f5', '#ff007c')
call s:HL('LightspeedShortcut', '#c8d3f5', '#ff007c', 'bold,underline')
call s:HL('LightspeedUnlabeledMatch', '#0db9d7', 'NONE', 'bold')
call s:HL('LineNr', '#3b4261', 'NONE')
call s:HL('LspCodeLens', '#636da6', 'NONE')
call s:HL('LspFloatWinBorder', '#589ed7', 'NONE')
call s:HL('LspFloatWinNormal', 'NONE', '#1e2030')
call s:HL('LspInfoBorder', '#589ed7', '#1e2030')
call s:HL('LspReferenceRead', 'NONE', '#3b4261')
call s:HL('LspReferenceText', 'NONE', '#3b4261')
call s:HL('LspReferenceWrite', 'NONE', '#3b4261')
call s:HL('LspSagaBorderTitle', '#86e1fc', 'NONE')
call s:HL('LspSagaCodeActionBorder', '#82aaff', 'NONE')
call s:HL('LspSagaCodeActionContent', '#fca7ea', 'NONE')
call s:HL('LspSagaCodeActionTitle', '#65bcff', 'NONE')
call s:HL('LspSagaDefPreviewBorder', '#c3e88d', 'NONE')
call s:HL('LspSagaFinderSelection', '#2d3f76', 'NONE')
call s:HL('LspSagaHoverBorder', '#82aaff', 'NONE')
call s:HL('LspSagaRenameBorder', '#c3e88d', 'NONE')
call s:HL('LspSagaSignatureHelpBorder', '#ff757f', 'NONE')
call s:HL('LspSignatureActiveParameter', 'NONE', '#262f50', 'bold')
call s:HL('MatchParen', '#ff966c', 'NONE', 'bold')
call s:HL('MiniCompletionActiveParameter', 'NONE', 'NONE', 'underline')
call s:HL('MiniCursorword', 'NONE', '#3b4261')
call s:HL('MiniCursorwordCurrent', 'NONE', '#3b4261')
call s:HL('MiniIndentscopePrefix', 'NONE', 'NONE')
call s:HL('MiniIndentscopeSymbol', '#65bcff', 'NONE')
call s:HL('MiniJump', '#ffffff', '#ff007c')
call s:HL('MiniJump2dSpot', '#ff007c', 'NONE', 'bold')
call s:HL('MiniStarterCurrent', 'NONE', 'NONE')
call s:HL('MiniStarterFooter', '#ffc777', 'NONE', 'italic')
call s:HL('MiniStarterHeader', '#82aaff', 'NONE')
call s:HL('MiniStarterInactive', '#636da6', 'NONE', 'italic')
call s:HL('MiniStarterItem', '#c8d3f5', '#222436')
call s:HL('MiniStarterItemBullet', '#589ed7', 'NONE')
call s:HL('MiniStarterItemPrefix', '#ffc777', 'NONE')
call s:HL('MiniStarterQuery', '#0db9d7', 'NONE')
call s:HL('MiniStarterSection', '#65bcff', 'NONE')
call s:HL('MiniStatuslineDevinfo', '#828bb8', '#2f334d')
call s:HL('MiniStatuslineFileinfo', '#828bb8', '#2f334d')
call s:HL('MiniStatuslineFilename', '#828bb8', '#3b4261')
call s:HL('MiniStatuslineInactive', '#82aaff', '#1e2030')
call s:HL('MiniStatuslineModeCommand', '#1b1d2b', '#ffc777', 'bold')
call s:HL('MiniStatuslineModeInsert', '#1b1d2b', '#c3e88d', 'bold')
call s:HL('MiniStatuslineModeNormal', '#1b1d2b', '#82aaff', 'bold')
call s:HL('MiniStatuslineModeOther', '#1b1d2b', '#4fd6be', 'bold')
call s:HL('MiniStatuslineModeReplace', '#1b1d2b', '#ff757f', 'bold')
call s:HL('MiniStatuslineModeVisual', '#1b1d2b', '#c099ff', 'bold')
call s:HL('MiniSurround', '#1b1d2b', '#ff966c')
call s:HL('MiniTablineCurrent', '#c8d3f5', '#3b4261')
call s:HL('MiniTablineFill', 'NONE', '#1b1d2b')
call s:HL('MiniTablineHidden', '#737aa2', '#1e2030')
call s:HL('MiniTablineModifiedCurrent', '#ffc777', '#3b4261')
call s:HL('MiniTablineModifiedHidden', '#bd9664', '#1e2030')
call s:HL('MiniTablineModifiedVisible', '#ffc777', '#1e2030')
call s:HL('MiniTablineTabpagesection', 'NONE', '#1e2030')
call s:HL('MiniTablineVisible', '#c8d3f5', '#1e2030')
call s:HL('MiniTestEmphasis', 'NONE', 'NONE', 'bold')
call s:HL('MiniTestFail', '#ff757f', 'NONE', 'bold')
call s:HL('MiniTestPass', '#c3e88d', 'NONE', 'bold')
call s:HL('MiniTrailspace', 'NONE', '#ff757f')
call s:HL('ModeMsg', '#828bb8', 'NONE', 'bold')
call s:HL('MoreMsg', '#82aaff', 'NONE')
call s:HL('MsgArea', '#828bb8', 'NONE')
call s:HL('NavicIconsArray', '#ff966c', 'NONE')
call s:HL('NavicIconsBoolean', '#ff966c', 'NONE')
call s:HL('NavicIconsClass', '#ff966c', 'NONE')
call s:HL('NavicIconsConstant', '#c099ff', 'NONE')
call s:HL('NavicIconsConstructor', '#ff966c', 'NONE')
call s:HL('NavicIconsEnum', '#ff966c', 'NONE')
call s:HL('NavicIconsEnumMember', '#4fd6be', 'NONE')
call s:HL('NavicIconsEvent', '#ff966c', 'NONE')
call s:HL('NavicIconsField', '#4fd6be', 'NONE')
call s:HL('NavicIconsFile', '#c8d3f5', 'NONE')
call s:HL('NavicIconsFunction', '#82aaff', 'NONE')
call s:HL('NavicIconsInterface', '#ff966c', 'NONE')
call s:HL('NavicIconsKey', '#fca7ea', 'NONE')
call s:HL('NavicIconsKeyword', '#fca7ea', 'NONE')
call s:HL('NavicIconsMethod', '#82aaff', 'NONE')
call s:HL('NavicIconsModule', '#ffc777', 'NONE')
call s:HL('NavicIconsNamespace', '#c8d3f5', 'NONE')
call s:HL('NavicIconsNull', '#ff966c', 'NONE')
call s:HL('NavicIconsNumber', '#ff966c', 'NONE')
call s:HL('NavicIconsObject', '#ff966c', 'NONE')
call s:HL('NavicIconsOperator', '#c8d3f5', 'NONE')
call s:HL('NavicIconsPackage', '#c8d3f5', 'NONE')
call s:HL('NavicIconsProperty', '#4fd6be', 'NONE')
call s:HL('NavicIconsString', '#c3e88d', 'NONE')
call s:HL('NavicIconsStruct', '#ff966c', 'NONE')
call s:HL('NavicIconsTypeParameter', '#4fd6be', 'NONE')
call s:HL('NavicIconsVariable', '#c099ff', 'NONE')
call s:HL('NavicSeparator', '#c8d3f5', 'NONE')
call s:HL('NavicText', '#c8d3f5', 'NONE')
call s:HL('NeoTreeDimText', '#3b4261', 'NONE')
call s:HL('NeoTreeNormal', '#828bb8', '#1e2030')
call s:HL('NeoTreeNormalNC', '#828bb8', '#1e2030')
call s:HL('NeogitBranch', '#c099ff', 'NONE')
call s:HL('NeogitDiffAddHighlight', '#b8db87', '#273849')
call s:HL('NeogitDiffContextHighlight', '#828bb8', '#2f334c')
call s:HL('NeogitDiffDeleteHighlight', '#e26a75', '#3a273a')
call s:HL('NeogitHunkHeader', '#c8d3f5', '#2f334d')
call s:HL('NeogitHunkHeaderHighlight', '#82aaff', '#3b4261')
call s:HL('NeogitRemote', '#fca7ea', 'NONE')
call s:HL('NeotestAdapterName', '#fca7ea', 'NONE', 'bold')
call s:HL('NeotestBorder', '#82aaff', 'NONE')
call s:HL('NeotestDir', '#82aaff', 'NONE')
call s:HL('NeotestExpandMarker', '#828bb8', 'NONE')
call s:HL('NeotestFailed', '#ff757f', 'NONE')
call s:HL('NeotestFile', '#4fd6be', 'NONE')
call s:HL('NeotestFocused', '#ffc777', 'NONE')
call s:HL('NeotestIndent', '#828bb8', 'NONE')
call s:HL('NeotestMarked', '#82aaff', 'NONE')
call s:HL('NeotestNamespace', '#41a6b5', 'NONE')
call s:HL('NeotestPassed', '#c3e88d', 'NONE')
call s:HL('NeotestRunning', '#ffc777', 'NONE')
call s:HL('NeotestSkipped', '#82aaff', 'NONE')
call s:HL('NeotestTarget', '#82aaff', 'NONE')
call s:HL('NeotestTest', '#828bb8', 'NONE')
call s:HL('NeotestWinSelect', '#82aaff', 'NONE')
call s:HL('NoiceCompletionItemKindClass', '#ff966c', 'NONE')
call s:HL('NoiceCompletionItemKindConstant', '#c099ff', 'NONE')
call s:HL('NoiceCompletionItemKindConstructor', '#82aaff', 'NONE')
call s:HL('NoiceCompletionItemKindDefault', '#828bb8', 'NONE')
call s:HL('NoiceCompletionItemKindEnum', '#ff966c', 'NONE')
call s:HL('NoiceCompletionItemKindEnumMember', '#4fd6be', 'NONE')
call s:HL('NoiceCompletionItemKindEvent', '#ff966c', 'NONE')
call s:HL('NoiceCompletionItemKindField', '#4fd6be', 'NONE')
call s:HL('NoiceCompletionItemKindFunction', '#82aaff', 'NONE')
call s:HL('NoiceCompletionItemKindInterface', '#ff966c', 'NONE')
call s:HL('NoiceCompletionItemKindKeyword', '#86e1fc', 'NONE')
call s:HL('NoiceCompletionItemKindMethod', '#82aaff', 'NONE')
call s:HL('NoiceCompletionItemKindModule', '#ffc777', 'NONE')
call s:HL('NoiceCompletionItemKindOperator', '#4fd6be', 'NONE')
call s:HL('NoiceCompletionItemKindProperty', '#4fd6be', 'NONE')
call s:HL('NoiceCompletionItemKindReference', '#c099ff', 'NONE')
call s:HL('NoiceCompletionItemKindSnippet', '#737aa2', 'NONE')
call s:HL('NoiceCompletionItemKindStruct', '#ff966c', 'NONE')
call s:HL('NoiceCompletionItemKindTypeParameter', '#4fd6be', 'NONE')
call s:HL('NoiceCompletionItemKindUnit', '#ff966c', 'NONE')
call s:HL('NoiceCompletionItemKindValue', '#c099ff', 'NONE')
call s:HL('NoiceCompletionItemKindVariable', '#c099ff', 'NONE')
call s:HL('NonText', '#545c7e', 'NONE')
call s:HL('Normal', '#c8d3f5', '#222436')
call s:HL('NormalFloat', '#c8d3f5', '#1e2030')
call s:HL('NormalNC', '#c8d3f5', '#222436')
call s:HL('NormalSB', '#828bb8', '#1e2030')
call s:HL('NotifyDEBUGBody', '#c8d3f5', '#222436')
call s:HL('NotifyDEBUGBorder', '#363a58', '#222436')
call s:HL('NotifyDEBUGIcon', '#636da6', 'NONE')
call s:HL('NotifyDEBUGTitle', '#636da6', 'NONE')
call s:HL('NotifyERRORBody', '#c8d3f5', '#222436')
call s:HL('NotifyERRORBorder', '#532b3f', '#222436')
call s:HL('NotifyERRORIcon', '#c53b53', 'NONE')
call s:HL('NotifyERRORTitle', '#c53b53', 'NONE')
call s:HL('NotifyINFOBody', '#c8d3f5', '#222436')
call s:HL('NotifyINFOBorder', '#1c5166', '#222436')
call s:HL('NotifyINFOIcon', '#0db9d7', 'NONE')
call s:HL('NotifyINFOTitle', '#0db9d7', 'NONE')
call s:HL('NotifyTRACEBody', '#c8d3f5', '#222436')
call s:HL('NotifyTRACEBorder', '#634b6c', '#222436')
call s:HL('NotifyTRACEIcon', '#fca7ea', 'NONE')
call s:HL('NotifyTRACETitle', '#fca7ea', 'NONE')
call s:HL('NotifyWARNBody', '#c8d3f5', '#222436')
call s:HL('NotifyWARNBorder', '#64554a', '#222436')
call s:HL('NotifyWARNIcon', '#ffc777', 'NONE')
call s:HL('NotifyWARNTitle', '#ffc777', 'NONE')
call s:HL('NvimTreeFolderIcon', '#82aaff', 'NONE')
call s:HL('NvimTreeGitDeleted', '#e26a75', 'NONE')
call s:HL('NvimTreeGitDirty', '#7ca1f2', 'NONE')
call s:HL('NvimTreeGitNew', '#b8db87', 'NONE')
call s:HL('NvimTreeImageFile', '#828bb8', 'NONE')
call s:HL('NvimTreeIndentMarker', '#3b4261', 'NONE')
call s:HL('NvimTreeNormal', '#828bb8', '#1e2030')
call s:HL('NvimTreeNormalNC', '#828bb8', '#1e2030')
call s:HL('NvimTreeOpenedFile', 'NONE', '#2f334d')
call s:HL('NvimTreeRootFolder', '#82aaff', 'NONE', 'bold')
call s:HL('NvimTreeSpecialFile', '#fca7ea', 'NONE', 'underline')
call s:HL('NvimTreeSymlink', '#82aaff', 'NONE')
call s:HL('NvimTreeWinSeparator', '#1e2030', '#1e2030')
call s:HL('Operator', '#89ddff', 'NONE')
call s:HL('Pmenu', '#c8d3f5', '#1e2030')
call s:HL('PmenuSbar', 'NONE', '#292b3a')
call s:HL('PmenuSel', 'NONE', '#363c58')
call s:HL('PmenuThumb', 'NONE', '#3b4261')
call s:HL('PreProc', '#86e1fc', 'NONE')
call s:HL('Question', '#82aaff', 'NONE')
call s:HL('QuickFixLine', 'NONE', '#2d3f76', 'bold')
call s:HL('ReferencesCount', '#fca7ea', 'NONE')
call s:HL('ReferencesIcon', '#82aaff', 'NONE')
call s:HL('ScrollbarError', '#c53b53', 'NONE')
call s:HL('ScrollbarErrorHandle', '#c53b53', '#2f334d')
call s:HL('ScrollbarHandle', 'NONE', '#2f334d')
call s:HL('ScrollbarHint', '#4fd6be', 'NONE')
call s:HL('ScrollbarHintHandle', '#4fd6be', '#2f334d')
call s:HL('ScrollbarInfo', '#0db9d7', 'NONE')
call s:HL('ScrollbarInfoHandle', '#0db9d7', '#2f334d')
call s:HL('ScrollbarMisc', '#fca7ea', 'NONE')
call s:HL('ScrollbarMiscHandle', '#fca7ea', '#2f334d')
call s:HL('ScrollbarSearch', '#ff966c', 'NONE')
call s:HL('ScrollbarSearchHandle', '#ff966c', '#2f334d')
call s:HL('ScrollbarWarn', '#ffc777', 'NONE')
call s:HL('ScrollbarWarnHandle', '#ffc777', '#2f334d')
call s:HL('Search', '#c8d3f5', '#3e68d7')
call s:HL('SignColumn', '#3b4261', '#222436')
call s:HL('SignColumnSB', '#3b4261', '#1e2030')
call s:HL('Sneak', '#2f334d', '#c099ff')
call s:HL('SneakScope', 'NONE', '#2d3f76')
call s:HL('Special', '#65bcff', 'NONE')
call s:HL('SpecialKey', '#545c7e', 'NONE')
call s:HL('SpellBad', 'NONE', 'NONE', 'undercurl', '#c53b53')
call s:HL('SpellCap', 'NONE', 'NONE', 'undercurl', '#ffc777')
call s:HL('SpellLocal', 'NONE', 'NONE', 'undercurl', '#0db9d7')
call s:HL('SpellRare', 'NONE', 'NONE', 'undercurl', '#4fd6be')
call s:HL('Statement', '#c099ff', 'NONE')
call s:HL('StatusLine', '#828bb8', '#1e2030')
call s:HL('StatusLineNC', '#3b4261', '#1e2030')
call s:HL('String', '#c3e88d', 'NONE')
call s:HL('Substitute', '#1b1d2b', '#ff757f')
call s:HL('TSNodeKey', '#ff007c', 'NONE', 'bold')
call s:HL('TSNodeUnmatched', '#545c7e', 'NONE')
call s:HL('TSRainbowBlue', '#82aaff', 'NONE')
call s:HL('TSRainbowCyan', '#86e1fc', 'NONE')
call s:HL('TSRainbowGreen', '#c3e88d', 'NONE')
call s:HL('TSRainbowOrange', '#ff966c', 'NONE')
call s:HL('TSRainbowRed', '#ff757f', 'NONE')
call s:HL('TSRainbowViolet', '#fca7ea', 'NONE')
call s:HL('TSRainbowYellow', '#ffc777', 'NONE')
call s:HL('TabLine', '#3b4261', '#1e2030')
call s:HL('TabLineFill', 'NONE', '#1b1d2b')
call s:HL('TabLineSel', '#1b1d2b', '#82aaff')
call s:HL('TargetWord', '#86e1fc', 'NONE')
call s:HL('TelescopeBorder', '#589ed7', '#1e2030')
call s:HL('TelescopeNormal', '#c8d3f5', '#1e2030')
call s:HL('Title', '#82aaff', 'NONE', 'bold')
call s:HL('Todo', '#222436', '#ffc777')
call s:HL('TreesitterContext', 'NONE', '#363c58')
call s:HL('TroubleCount', '#c099ff', '#3b4261')
call s:HL('TroubleNormal', '#828bb8', '#1e2030')
call s:HL('TroubleText', '#828bb8', 'NONE')
call s:HL('Type', '#65bcff', 'NONE')
call s:HL('Underlined', 'NONE', 'NONE', 'underline')
call s:HL('VertSplit', '#1b1d2b', 'NONE')
call s:HL('Visual', 'NONE', '#2d3f76')
call s:HL('VisualNOS', 'NONE', '#2d3f76')
call s:HL('WarningMsg', '#ffc777', 'NONE')
call s:HL('WhichKey', '#86e1fc', 'NONE')
call s:HL('WhichKeyDesc', '#c099ff', 'NONE')
call s:HL('WhichKeyFloat', 'NONE', '#1e2030')
call s:HL('WhichKeyGroup', '#82aaff', 'NONE')
call s:HL('WhichKeySeparator', '#636da6', 'NONE')
call s:HL('WhichKeySeperator', '#636da6', 'NONE')
call s:HL('WhichKeyValue', '#737aa2', 'NONE')
call s:HL('Whitespace', '#3b4261', 'NONE')
call s:HL('WildMenu', 'NONE', '#2d3f76')
call s:HL('WinSeparator', '#1b1d2b', 'NONE', 'bold')
call s:HL('YankyPut', 'NONE', 'NONE')
call s:HL('YankyYanked', 'NONE', 'NONE')
call s:HL('debugBreakpoint', '#0db9d7', '#203346')
call s:HL('debugPC', 'NONE', '#1e2030')
call s:HL('diffAdded', '#b8db87', 'NONE')
call s:HL('diffChanged', '#7ca1f2', 'NONE')
call s:HL('diffFile', '#82aaff', 'NONE')
call s:HL('diffIndexLine', '#c099ff', 'NONE')
call s:HL('diffLine', '#636da6', 'NONE')
call s:HL('diffNewFile', '#ff966c', 'NONE')
call s:HL('diffOldFile', '#ffc777', 'NONE')
call s:HL('diffRemoved', '#e26a75', 'NONE')
call s:HL('healthError', '#c53b53', 'NONE')
call s:HL('healthSuccess', '#4fd6be', 'NONE')
call s:HL('healthWarning', '#ffc777', 'NONE')
call s:HL('helpCommand', '#82aaff', '#444a73')
call s:HL('htmlH1', '#c099ff', 'NONE', 'bold')
call s:HL('htmlH2', '#82aaff', 'NONE', 'bold')
call s:HL('illuminatedCurWord', 'NONE', '#3b4261')
call s:HL('illuminatedWord', 'NONE', '#3b4261')
call s:HL('lCursor', '#222436', '#c8d3f5')
call s:HL('markdownCode', '#4fd6be', 'NONE')
call s:HL('markdownCodeBlock', '#4fd6be', 'NONE')
call s:HL('markdownH1', '#c099ff', 'NONE', 'bold')
call s:HL('markdownH2', '#82aaff', 'NONE', 'bold')
call s:HL('markdownHeadingDelimiter', '#ff966c', 'NONE', 'bold')
call s:HL('markdownLinkText', '#82aaff', 'NONE', 'underline')
call s:HL('mkdCodeDelimiter', '#c8d3f5', '#444a73')
call s:HL('mkdCodeEnd', '#4fd6be', 'NONE', 'bold')
call s:HL('mkdCodeStart', '#4fd6be', 'NONE', 'bold')
call s:HL('qfFileName', '#82aaff', 'NONE')
call s:HL('qfLineNr', '#737aa2', 'NONE')
call s:HL('rainbowcol1', '#ff757f', 'NONE')
call s:HL('rainbowcol2', '#ffc777', 'NONE')
call s:HL('rainbowcol3', '#c3e88d', 'NONE')
call s:HL('rainbowcol4', '#4fd6be', 'NONE')
call s:HL('rainbowcol5', '#82aaff', 'NONE')
call s:HL('rainbowcol6', '#c099ff', 'NONE')
call s:HL('rainbowcol7', '#fca7ea', 'NONE')
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
