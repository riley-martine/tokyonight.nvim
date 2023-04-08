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

let g:colors_name = 'tokyo night'
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
  \ 'bg': '#1a1b26',
  \ 'bg_dark': '#16161e',
  \ 'bg_float': '#16161e',
  \ 'bg_highlight': '#292e42',
  \ 'bg_popup': '#16161e',
  \ 'bg_search': '#3d59a1',
  \ 'bg_sidebar': '#16161e',
  \ 'bg_statusline': '#16161e',
  \ 'bg_visual': '#283457',
  \ 'black': '#15161e',
  \ 'blue': '#7aa2f7',
  \ 'blue0': '#3d59a1',
  \ 'blue1': '#2ac3de',
  \ 'blue2': '#0db9d7',
  \ 'blue5': '#89ddff',
  \ 'blue6': '#b4f9f8',
  \ 'blue7': '#394b70',
  \ 'border': '#15161e',
  \ 'border_highlight': '#27a1b9',
  \ 'comment': '#565f89',
  \ 'cyan': '#7dcfff',
  \ 'dark3': '#545c7e',
  \ 'dark5': '#737aa2',
  \ 'diff_add': '#20303b',
  \ 'diff_change': '#1f2231',
  \ 'diff_delete': '#37222c',
  \ 'diff_text': '#394b70',
  \ 'error': '#db4b4b',
  \ 'fg': '#c0caf5',
  \ 'fg_dark': '#a9b1d6',
  \ 'fg_float': '#c0caf5',
  \ 'fg_gutter': '#3b4261',
  \ 'fg_sidebar': '#a9b1d6',
  \ 'gitSigns_add': '#399a96',
  \ 'gitSigns_change': '#6382bd',
  \ 'gitSigns_delete': '#c25d64',
  \ 'git_add': '#4097a3',
  \ 'git_change': '#506d9b',
  \ 'git_delete': '#c47981',
  \ 'git_ignore': '#545c7e',
  \ 'green': '#9ece6a',
  \ 'green1': '#73daca',
  \ 'green2': '#41a6b5',
  \ 'hint': '#1abc9c',
  \ 'info': '#0db9d7',
  \ 'magenta': '#bb9af7',
  \ 'magenta2': '#ff007c',
  \ 'none': 'NONE',
  \ 'orange': '#ff9e64',
  \ 'purple': '#9d7cd8',
  \ 'red': '#f7768e',
  \ 'red1': '#db4b4b',
  \ 'teal': '#1abc9c',
  \ 'terminal_black': '#414868',
  \ 'warning': '#e0af68',
  \ 'yellow': '#e0af68',
\ }
" }}}

" Highlight: {{{
call s:HL('ALEErrorSign', '#db4b4b', 'NONE')
call s:HL('ALEWarningSign', '#e0af68', 'NONE')
call s:HL('AlphaButtons', '#7dcfff', 'NONE')
call s:HL('AlphaFooter', '#2ac3de', 'NONE')
call s:HL('AlphaHeader', '#7aa2f7', 'NONE')
call s:HL('AlphaHeaderLabel', '#ff9e64', 'NONE')
call s:HL('AlphaShortcut', '#ff9e64', 'NONE')
call s:HL('Bold', 'NONE', 'NONE', 'bold')
call s:HL('BufferAlternate', '#c0caf5', '#3b4261')
call s:HL('BufferAlternateERROR', '#db4b4b', '#3b4261')
call s:HL('BufferAlternateHINT', '#1abc9c', '#3b4261')
call s:HL('BufferAlternateINFO', '#0db9d7', '#3b4261')
call s:HL('BufferAlternateIndex', '#0db9d7', '#3b4261')
call s:HL('BufferAlternateMod', '#e0af68', '#3b4261')
call s:HL('BufferAlternateSign', '#0db9d7', '#3b4261')
call s:HL('BufferAlternateTarget', '#f7768e', '#3b4261')
call s:HL('BufferAlternateWARN', '#e0af68', '#3b4261')
call s:HL('BufferCurrent', '#c0caf5', '#3b4261')
call s:HL('BufferCurrentERROR', '#db4b4b', '#3b4261')
call s:HL('BufferCurrentHINT', '#1abc9c', '#3b4261')
call s:HL('BufferCurrentINFO', '#0db9d7', '#3b4261')
call s:HL('BufferCurrentIndex', '#0db9d7', '#3b4261')
call s:HL('BufferCurrentMod', '#e0af68', '#3b4261')
call s:HL('BufferCurrentSign', '#0db9d7', '#3b4261')
call s:HL('BufferCurrentTarget', '#f7768e', '#3b4261')
call s:HL('BufferCurrentWARN', '#e0af68', '#3b4261')
call s:HL('BufferInactive', '#737aa2', '#16161e')
call s:HL('BufferInactiveERROR', '#a13d40', '#16161e')
call s:HL('BufferInactiveHINT', '#1a8c79', '#16161e')
call s:HL('BufferInactiveINFO', '#118aa2', '#16161e')
call s:HL('BufferInactiveIndex', '#737aa2', '#16161e')
call s:HL('BufferInactiveMod', '#a58354', '#16161e')
call s:HL('BufferInactiveSign', '#27a1b9', '#16161e')
call s:HL('BufferInactiveTarget', '#f7768e', '#16161e')
call s:HL('BufferInactiveWARN', '#a58354', '#16161e')
call s:HL('BufferLineIndicatorSelected', '#506d9b', 'NONE')
call s:HL('BufferOffset', '#737aa2', '#16161e')
call s:HL('BufferTabpageFill', '#737aa2', '#16161e')
call s:HL('BufferTabpages', 'NONE', '#16161e')
call s:HL('BufferVisible', '#c0caf5', '#16161e')
call s:HL('BufferVisibleERROR', '#db4b4b', '#16161e')
call s:HL('BufferVisibleHINT', '#1abc9c', '#16161e')
call s:HL('BufferVisibleINFO', '#0db9d7', '#16161e')
call s:HL('BufferVisibleIndex', '#0db9d7', '#16161e')
call s:HL('BufferVisibleMod', '#e0af68', '#16161e')
call s:HL('BufferVisibleSign', '#0db9d7', '#16161e')
call s:HL('BufferVisibleTarget', '#f7768e', '#16161e')
call s:HL('BufferVisibleWARN', '#e0af68', '#16161e')
call s:HL('Character', '#9ece6a', 'NONE')
call s:HL('CmpDocumentation', '#c0caf5', '#16161e')
call s:HL('CmpDocumentationBorder', '#27a1b9', '#16161e')
call s:HL('CmpItemAbbr', '#c0caf5', 'NONE')
call s:HL('CmpItemAbbrDeprecated', '#3b4261', 'NONE')
call s:HL('CmpItemAbbrMatch', '#2ac3de', 'NONE')
call s:HL('CmpItemAbbrMatchFuzzy', '#2ac3de', 'NONE')
call s:HL('CmpItemKindClass', '#ff9e64', 'NONE')
call s:HL('CmpItemKindConstant', '#bb9af7', 'NONE')
call s:HL('CmpItemKindConstructor', '#7aa2f7', 'NONE')
call s:HL('CmpItemKindCopilot', '#1abc9c', 'NONE')
call s:HL('CmpItemKindDefault', '#a9b1d6', 'NONE')
call s:HL('CmpItemKindEnum', '#ff9e64', 'NONE')
call s:HL('CmpItemKindEnumMember', '#73daca', 'NONE')
call s:HL('CmpItemKindEvent', '#ff9e64', 'NONE')
call s:HL('CmpItemKindField', '#73daca', 'NONE')
call s:HL('CmpItemKindFunction', '#7aa2f7', 'NONE')
call s:HL('CmpItemKindInterface', '#ff9e64', 'NONE')
call s:HL('CmpItemKindKeyword', '#7dcfff', 'NONE')
call s:HL('CmpItemKindMethod', '#7aa2f7', 'NONE')
call s:HL('CmpItemKindModule', '#e0af68', 'NONE')
call s:HL('CmpItemKindOperator', '#73daca', 'NONE')
call s:HL('CmpItemKindProperty', '#73daca', 'NONE')
call s:HL('CmpItemKindReference', '#bb9af7', 'NONE')
call s:HL('CmpItemKindSnippet', '#737aa2', 'NONE')
call s:HL('CmpItemKindStruct', '#ff9e64', 'NONE')
call s:HL('CmpItemKindTypeParameter', '#73daca', 'NONE')
call s:HL('CmpItemKindUnit', '#ff9e64', 'NONE')
call s:HL('CmpItemKindValue', '#bb9af7', 'NONE')
call s:HL('CmpItemKindVariable', '#bb9af7', 'NONE')
call s:HL('CmpItemMenu', '#565f89', 'NONE')
call s:HL('ColorColumn', 'NONE', '#15161e')
call s:HL('Comment', '#565f89', 'NONE', 'italic')
call s:HL('Conceal', '#737aa2', 'NONE')
call s:HL('Constant', '#ff9e64', 'NONE')
call s:HL('CurSearch', 'NONE', 'NONE')
call s:HL('Cursor', '#1a1b26', '#c0caf5')
call s:HL('CursorColumn', 'NONE', '#292e42')
call s:HL('CursorIM', '#1a1b26', '#c0caf5')
call s:HL('CursorLine', 'NONE', '#292e42')
call s:HL('CursorLineNr', '#737aa2', 'NONE')
call s:HL('DashboardCenter', '#bb9af7', 'NONE')
call s:HL('DashboardFooter', '#e0af68', 'NONE', 'italic')
call s:HL('DashboardHeader', '#7aa2f7', 'NONE')
call s:HL('DashboardShortCut', '#7dcfff', 'NONE')
call s:HL('DefinitionCount', '#9d7cd8', 'NONE')
call s:HL('DefinitionIcon', '#7aa2f7', 'NONE')
call s:HL('DiagnosticError', '#db4b4b', 'NONE')
call s:HL('DiagnosticHint', '#1abc9c', 'NONE')
call s:HL('DiagnosticInfo', '#0db9d7', 'NONE')
call s:HL('DiagnosticInformation', 'NONE', 'NONE')
call s:HL('DiagnosticUnderlineError', 'NONE', 'NONE', 'undercurl', '#db4b4b')
call s:HL('DiagnosticUnderlineHint', 'NONE', 'NONE', 'undercurl', '#1abc9c')
call s:HL('DiagnosticUnderlineInfo', 'NONE', 'NONE', 'undercurl', '#0db9d7')
call s:HL('DiagnosticUnderlineWarn', 'NONE', 'NONE', 'undercurl', '#e0af68')
call s:HL('DiagnosticVirtualTextError', '#db4b4b', '#2d202a')
call s:HL('DiagnosticVirtualTextHint', '#1abc9c', '#1a2b32')
call s:HL('DiagnosticVirtualTextInfo', '#0db9d7', '#192b38')
call s:HL('DiagnosticVirtualTextWarn', '#e0af68', '#2e2a2d')
call s:HL('DiagnosticWarn', '#e0af68', 'NONE')
call s:HL('DiagnosticWarning', 'NONE', 'NONE')
call s:HL('DiffAdd', 'NONE', '#20303b')
call s:HL('DiffChange', 'NONE', '#1f2231')
call s:HL('DiffDelete', 'NONE', '#37222c')
call s:HL('DiffText', 'NONE', '#394b70')
call s:HL('Directory', '#7aa2f7', 'NONE')
call s:HL('EndOfBuffer', '#1a1b26', 'NONE')
call s:HL('Error', '#db4b4b', 'NONE')
call s:HL('ErrorMsg', '#db4b4b', 'NONE')
call s:HL('FernBranchText', '#7aa2f7', 'NONE')
call s:HL('FloatBorder', '#27a1b9', '#16161e')
call s:HL('FoldColumn', '#565f89', '#1a1b26')
call s:HL('Folded', '#7aa2f7', '#3b4261')
call s:HL('Foo', '#ff007c', '#ff007c')
call s:HL('Function', '#7aa2f7', 'NONE')
call s:HL('GitGutterAdd', '#399a96', 'NONE')
call s:HL('GitGutterChange', '#6382bd', 'NONE')
call s:HL('GitGutterDelete', '#c25d64', 'NONE')
call s:HL('GitSignsAdd', '#399a96', 'NONE')
call s:HL('GitSignsChange', '#6382bd', 'NONE')
call s:HL('GitSignsDelete', '#c25d64', 'NONE')
call s:HL('GlyphPalette1', '#db4b4b', 'NONE')
call s:HL('GlyphPalette2', '#9ece6a', 'NONE')
call s:HL('GlyphPalette3', '#e0af68', 'NONE')
call s:HL('GlyphPalette4', '#7aa2f7', 'NONE')
call s:HL('GlyphPalette6', '#73daca', 'NONE')
call s:HL('GlyphPalette7', '#c0caf5', 'NONE')
call s:HL('GlyphPalette9', '#f7768e', 'NONE')
call s:HL('Hlargs', '#e0af68', 'NONE')
call s:HL('HopNextKey', '#ff007c', 'NONE', 'bold')
call s:HL('HopNextKey1', '#0db9d7', 'NONE', 'bold')
call s:HL('HopNextKey2', '#127a90', 'NONE')
call s:HL('HopUnmatched', '#545c7e', 'NONE')
call s:HL('Identifier', '#bb9af7', 'NONE')
call s:HL('IlluminatedWordRead', 'NONE', '#3b4261')
call s:HL('IlluminatedWordText', 'NONE', '#3b4261')
call s:HL('IlluminatedWordWrite', 'NONE', '#3b4261')
call s:HL('IncSearch', '#15161e', '#ff9e64')
call s:HL('IndentBlanklineChar', '#3b4261', 'NONE')
call s:HL('IndentBlanklineContextChar', '#9d7cd8', 'NONE')
call s:HL('Italic', 'NONE', 'NONE', 'italic')
call s:HL('Keyword', '#7dcfff', 'NONE', 'italic')
call s:HL('LazyProgressDone', '#ff007c', 'NONE', 'bold')
call s:HL('LazyProgressTodo', '#3b4261', 'NONE', 'bold')
call s:HL('LeapBackdrop', '#545c7e', 'NONE')
call s:HL('LeapLabelPrimary', '#ff007c', 'NONE', 'bold')
call s:HL('LeapLabelSecondary', '#73daca', 'NONE', 'bold')
call s:HL('LeapMatch', '#c0caf5', '#ff007c', 'bold')
call s:HL('LightspeedGreyWash', '#545c7e', 'NONE')
call s:HL('LightspeedLabel', '#ff007c', 'NONE', 'bold,underline')
call s:HL('LightspeedLabelDistant', '#73daca', 'NONE', 'bold,underline')
call s:HL('LightspeedLabelDistantOverlapped', '#41a6b5', 'NONE', 'underline')
call s:HL('LightspeedLabelOverlapped', '#ff007c', 'NONE', 'underline')
call s:HL('LightspeedMaskedChar', '#ff9e64', 'NONE')
call s:HL('LightspeedOneCharMatch', '#c0caf5', '#ff007c', 'bold')
call s:HL('LightspeedPendingOpArea', '#c0caf5', '#ff007c')
call s:HL('LightspeedShortcut', '#c0caf5', '#ff007c', 'bold,underline')
call s:HL('LightspeedUnlabeledMatch', '#0db9d7', 'NONE', 'bold')
call s:HL('LineNr', '#3b4261', 'NONE')
call s:HL('LspCodeLens', '#565f89', 'NONE')
call s:HL('LspFloatWinBorder', '#27a1b9', 'NONE')
call s:HL('LspFloatWinNormal', 'NONE', '#16161e')
call s:HL('LspInfoBorder', '#27a1b9', '#16161e')
call s:HL('LspReferenceRead', 'NONE', '#3b4261')
call s:HL('LspReferenceText', 'NONE', '#3b4261')
call s:HL('LspReferenceWrite', 'NONE', '#3b4261')
call s:HL('LspSagaBorderTitle', '#7dcfff', 'NONE')
call s:HL('LspSagaCodeActionBorder', '#7aa2f7', 'NONE')
call s:HL('LspSagaCodeActionContent', '#9d7cd8', 'NONE')
call s:HL('LspSagaCodeActionTitle', '#2ac3de', 'NONE')
call s:HL('LspSagaDefPreviewBorder', '#9ece6a', 'NONE')
call s:HL('LspSagaFinderSelection', '#283457', 'NONE')
call s:HL('LspSagaHoverBorder', '#7aa2f7', 'NONE')
call s:HL('LspSagaRenameBorder', '#9ece6a', 'NONE')
call s:HL('LspSagaSignatureHelpBorder', '#f7768e', 'NONE')
call s:HL('LspSignatureActiveParameter', 'NONE', '#20253a', 'bold')
call s:HL('MatchParen', '#ff9e64', 'NONE', 'bold')
call s:HL('MiniCompletionActiveParameter', 'NONE', 'NONE', 'underline')
call s:HL('MiniCursorword', 'NONE', '#3b4261')
call s:HL('MiniCursorwordCurrent', 'NONE', '#3b4261')
call s:HL('MiniIndentscopePrefix', 'NONE', 'NONE')
call s:HL('MiniIndentscopeSymbol', '#2ac3de', 'NONE')
call s:HL('MiniJump', '#ffffff', '#ff007c')
call s:HL('MiniJump2dSpot', '#ff007c', 'NONE', 'bold')
call s:HL('MiniStarterCurrent', 'NONE', 'NONE')
call s:HL('MiniStarterFooter', '#e0af68', 'NONE', 'italic')
call s:HL('MiniStarterHeader', '#7aa2f7', 'NONE')
call s:HL('MiniStarterInactive', '#565f89', 'NONE', 'italic')
call s:HL('MiniStarterItem', '#c0caf5', '#1a1b26')
call s:HL('MiniStarterItemBullet', '#27a1b9', 'NONE')
call s:HL('MiniStarterItemPrefix', '#e0af68', 'NONE')
call s:HL('MiniStarterQuery', '#0db9d7', 'NONE')
call s:HL('MiniStarterSection', '#2ac3de', 'NONE')
call s:HL('MiniStatuslineDevinfo', '#a9b1d6', '#292e42')
call s:HL('MiniStatuslineFileinfo', '#a9b1d6', '#292e42')
call s:HL('MiniStatuslineFilename', '#a9b1d6', '#3b4261')
call s:HL('MiniStatuslineInactive', '#7aa2f7', '#16161e')
call s:HL('MiniStatuslineModeCommand', '#15161e', '#e0af68', 'bold')
call s:HL('MiniStatuslineModeInsert', '#15161e', '#9ece6a', 'bold')
call s:HL('MiniStatuslineModeNormal', '#15161e', '#7aa2f7', 'bold')
call s:HL('MiniStatuslineModeOther', '#15161e', '#1abc9c', 'bold')
call s:HL('MiniStatuslineModeReplace', '#15161e', '#f7768e', 'bold')
call s:HL('MiniStatuslineModeVisual', '#15161e', '#bb9af7', 'bold')
call s:HL('MiniSurround', '#15161e', '#ff9e64')
call s:HL('MiniTablineCurrent', '#c0caf5', '#3b4261')
call s:HL('MiniTablineFill', 'NONE', '#15161e')
call s:HL('MiniTablineHidden', '#737aa2', '#16161e')
call s:HL('MiniTablineModifiedCurrent', '#e0af68', '#3b4261')
call s:HL('MiniTablineModifiedHidden', '#a58354', '#16161e')
call s:HL('MiniTablineModifiedVisible', '#e0af68', '#16161e')
call s:HL('MiniTablineTabpagesection', 'NONE', '#16161e')
call s:HL('MiniTablineVisible', '#c0caf5', '#16161e')
call s:HL('MiniTestEmphasis', 'NONE', 'NONE', 'bold')
call s:HL('MiniTestFail', '#f7768e', 'NONE', 'bold')
call s:HL('MiniTestPass', '#9ece6a', 'NONE', 'bold')
call s:HL('MiniTrailspace', 'NONE', '#f7768e')
call s:HL('ModeMsg', '#a9b1d6', 'NONE', 'bold')
call s:HL('MoreMsg', '#7aa2f7', 'NONE')
call s:HL('MsgArea', '#a9b1d6', 'NONE')
call s:HL('NavicIconsArray', '#ff9e64', 'NONE')
call s:HL('NavicIconsBoolean', '#ff9e64', 'NONE')
call s:HL('NavicIconsClass', '#ff9e64', 'NONE')
call s:HL('NavicIconsConstant', '#bb9af7', 'NONE')
call s:HL('NavicIconsConstructor', '#ff9e64', 'NONE')
call s:HL('NavicIconsEnum', '#ff9e64', 'NONE')
call s:HL('NavicIconsEnumMember', '#73daca', 'NONE')
call s:HL('NavicIconsEvent', '#ff9e64', 'NONE')
call s:HL('NavicIconsField', '#73daca', 'NONE')
call s:HL('NavicIconsFile', '#c0caf5', 'NONE')
call s:HL('NavicIconsFunction', '#7aa2f7', 'NONE')
call s:HL('NavicIconsInterface', '#ff9e64', 'NONE')
call s:HL('NavicIconsKey', '#9d7cd8', 'NONE')
call s:HL('NavicIconsKeyword', '#9d7cd8', 'NONE')
call s:HL('NavicIconsMethod', '#7aa2f7', 'NONE')
call s:HL('NavicIconsModule', '#e0af68', 'NONE')
call s:HL('NavicIconsNamespace', '#c0caf5', 'NONE')
call s:HL('NavicIconsNull', '#ff9e64', 'NONE')
call s:HL('NavicIconsNumber', '#ff9e64', 'NONE')
call s:HL('NavicIconsObject', '#ff9e64', 'NONE')
call s:HL('NavicIconsOperator', '#c0caf5', 'NONE')
call s:HL('NavicIconsPackage', '#c0caf5', 'NONE')
call s:HL('NavicIconsProperty', '#73daca', 'NONE')
call s:HL('NavicIconsString', '#9ece6a', 'NONE')
call s:HL('NavicIconsStruct', '#ff9e64', 'NONE')
call s:HL('NavicIconsTypeParameter', '#73daca', 'NONE')
call s:HL('NavicIconsVariable', '#bb9af7', 'NONE')
call s:HL('NavicSeparator', '#c0caf5', 'NONE')
call s:HL('NavicText', '#c0caf5', 'NONE')
call s:HL('NeoTreeDimText', '#3b4261', 'NONE')
call s:HL('NeoTreeNormal', '#a9b1d6', '#16161e')
call s:HL('NeoTreeNormalNC', '#a9b1d6', '#16161e')
call s:HL('NeogitBranch', '#bb9af7', 'NONE')
call s:HL('NeogitDiffAddHighlight', '#4097a3', '#20303b')
call s:HL('NeogitDiffContextHighlight', '#a9b1d6', '#2b2f44')
call s:HL('NeogitDiffDeleteHighlight', '#c47981', '#37222c')
call s:HL('NeogitHunkHeader', '#c0caf5', '#292e42')
call s:HL('NeogitHunkHeaderHighlight', '#7aa2f7', '#3b4261')
call s:HL('NeogitRemote', '#9d7cd8', 'NONE')
call s:HL('NeotestAdapterName', '#9d7cd8', 'NONE', 'bold')
call s:HL('NeotestBorder', '#7aa2f7', 'NONE')
call s:HL('NeotestDir', '#7aa2f7', 'NONE')
call s:HL('NeotestExpandMarker', '#a9b1d6', 'NONE')
call s:HL('NeotestFailed', '#f7768e', 'NONE')
call s:HL('NeotestFile', '#1abc9c', 'NONE')
call s:HL('NeotestFocused', '#e0af68', 'NONE')
call s:HL('NeotestIndent', '#a9b1d6', 'NONE')
call s:HL('NeotestMarked', '#7aa2f7', 'NONE')
call s:HL('NeotestNamespace', '#41a6b5', 'NONE')
call s:HL('NeotestPassed', '#9ece6a', 'NONE')
call s:HL('NeotestRunning', '#e0af68', 'NONE')
call s:HL('NeotestSkipped', '#7aa2f7', 'NONE')
call s:HL('NeotestTarget', '#7aa2f7', 'NONE')
call s:HL('NeotestTest', '#a9b1d6', 'NONE')
call s:HL('NeotestWinSelect', '#7aa2f7', 'NONE')
call s:HL('NoiceCompletionItemKindClass', '#ff9e64', 'NONE')
call s:HL('NoiceCompletionItemKindConstant', '#bb9af7', 'NONE')
call s:HL('NoiceCompletionItemKindConstructor', '#7aa2f7', 'NONE')
call s:HL('NoiceCompletionItemKindDefault', '#a9b1d6', 'NONE')
call s:HL('NoiceCompletionItemKindEnum', '#ff9e64', 'NONE')
call s:HL('NoiceCompletionItemKindEnumMember', '#73daca', 'NONE')
call s:HL('NoiceCompletionItemKindEvent', '#ff9e64', 'NONE')
call s:HL('NoiceCompletionItemKindField', '#73daca', 'NONE')
call s:HL('NoiceCompletionItemKindFunction', '#7aa2f7', 'NONE')
call s:HL('NoiceCompletionItemKindInterface', '#ff9e64', 'NONE')
call s:HL('NoiceCompletionItemKindKeyword', '#7dcfff', 'NONE')
call s:HL('NoiceCompletionItemKindMethod', '#7aa2f7', 'NONE')
call s:HL('NoiceCompletionItemKindModule', '#e0af68', 'NONE')
call s:HL('NoiceCompletionItemKindOperator', '#73daca', 'NONE')
call s:HL('NoiceCompletionItemKindProperty', '#73daca', 'NONE')
call s:HL('NoiceCompletionItemKindReference', '#bb9af7', 'NONE')
call s:HL('NoiceCompletionItemKindSnippet', '#737aa2', 'NONE')
call s:HL('NoiceCompletionItemKindStruct', '#ff9e64', 'NONE')
call s:HL('NoiceCompletionItemKindTypeParameter', '#73daca', 'NONE')
call s:HL('NoiceCompletionItemKindUnit', '#ff9e64', 'NONE')
call s:HL('NoiceCompletionItemKindValue', '#bb9af7', 'NONE')
call s:HL('NoiceCompletionItemKindVariable', '#bb9af7', 'NONE')
call s:HL('NonText', '#545c7e', 'NONE')
call s:HL('Normal', '#c0caf5', '#1a1b26')
call s:HL('NormalFloat', '#c0caf5', '#16161e')
call s:HL('NormalNC', '#c0caf5', '#1a1b26')
call s:HL('NormalSB', '#a9b1d6', '#16161e')
call s:HL('NotifyDEBUGBody', '#c0caf5', '#1a1b26')
call s:HL('NotifyDEBUGBorder', '#2c2f44', '#1a1b26')
call s:HL('NotifyDEBUGIcon', '#565f89', 'NONE')
call s:HL('NotifyDEBUGTitle', '#565f89', 'NONE')
call s:HL('NotifyERRORBody', '#c0caf5', '#1a1b26')
call s:HL('NotifyERRORBorder', '#542931', '#1a1b26')
call s:HL('NotifyERRORIcon', '#db4b4b', 'NONE')
call s:HL('NotifyERRORTitle', '#db4b4b', 'NONE')
call s:HL('NotifyINFOBody', '#c0caf5', '#1a1b26')
call s:HL('NotifyINFOBorder', '#164a5b', '#1a1b26')
call s:HL('NotifyINFOIcon', '#0db9d7', 'NONE')
call s:HL('NotifyINFOTitle', '#0db9d7', 'NONE')
call s:HL('NotifyTRACEBody', '#c0caf5', '#1a1b26')
call s:HL('NotifyTRACEBorder', '#41385b', '#1a1b26')
call s:HL('NotifyTRACEIcon', '#9d7cd8', 'NONE')
call s:HL('NotifyTRACETitle', '#9d7cd8', 'NONE')
call s:HL('NotifyWARNBody', '#c0caf5', '#1a1b26')
call s:HL('NotifyWARNBorder', '#55473a', '#1a1b26')
call s:HL('NotifyWARNIcon', '#e0af68', 'NONE')
call s:HL('NotifyWARNTitle', '#e0af68', 'NONE')
call s:HL('NvimTreeFolderIcon', '#7aa2f7', 'NONE')
call s:HL('NvimTreeGitDeleted', '#c47981', 'NONE')
call s:HL('NvimTreeGitDirty', '#506d9b', 'NONE')
call s:HL('NvimTreeGitNew', '#4097a3', 'NONE')
call s:HL('NvimTreeImageFile', '#a9b1d6', 'NONE')
call s:HL('NvimTreeIndentMarker', '#3b4261', 'NONE')
call s:HL('NvimTreeNormal', '#a9b1d6', '#16161e')
call s:HL('NvimTreeNormalNC', '#a9b1d6', '#16161e')
call s:HL('NvimTreeOpenedFile', 'NONE', '#292e42')
call s:HL('NvimTreeRootFolder', '#7aa2f7', 'NONE', 'bold')
call s:HL('NvimTreeSpecialFile', '#9d7cd8', 'NONE', 'underline')
call s:HL('NvimTreeSymlink', '#7aa2f7', 'NONE')
call s:HL('NvimTreeWinSeparator', '#16161e', '#16161e')
call s:HL('Operator', '#89ddff', 'NONE')
call s:HL('Pmenu', '#c0caf5', '#16161e')
call s:HL('PmenuSbar', 'NONE', '#222229')
call s:HL('PmenuSel', 'NONE', '#343a55')
call s:HL('PmenuThumb', 'NONE', '#3b4261')
call s:HL('PreProc', '#7dcfff', 'NONE')
call s:HL('Question', '#7aa2f7', 'NONE')
call s:HL('QuickFixLine', 'NONE', '#283457', 'bold')
call s:HL('ReferencesCount', '#9d7cd8', 'NONE')
call s:HL('ReferencesIcon', '#7aa2f7', 'NONE')
call s:HL('ScrollbarError', '#db4b4b', 'NONE')
call s:HL('ScrollbarErrorHandle', '#db4b4b', '#292e42')
call s:HL('ScrollbarHandle', 'NONE', '#292e42')
call s:HL('ScrollbarHint', '#1abc9c', 'NONE')
call s:HL('ScrollbarHintHandle', '#1abc9c', '#292e42')
call s:HL('ScrollbarInfo', '#0db9d7', 'NONE')
call s:HL('ScrollbarInfoHandle', '#0db9d7', '#292e42')
call s:HL('ScrollbarMisc', '#9d7cd8', 'NONE')
call s:HL('ScrollbarMiscHandle', '#9d7cd8', '#292e42')
call s:HL('ScrollbarSearch', '#ff9e64', 'NONE')
call s:HL('ScrollbarSearchHandle', '#ff9e64', '#292e42')
call s:HL('ScrollbarWarn', '#e0af68', 'NONE')
call s:HL('ScrollbarWarnHandle', '#e0af68', '#292e42')
call s:HL('Search', '#c0caf5', '#3d59a1')
call s:HL('SignColumn', '#3b4261', '#1a1b26')
call s:HL('SignColumnSB', '#3b4261', '#16161e')
call s:HL('Sneak', '#292e42', '#bb9af7')
call s:HL('SneakScope', 'NONE', '#283457')
call s:HL('Special', '#2ac3de', 'NONE')
call s:HL('SpecialKey', '#545c7e', 'NONE')
call s:HL('SpellBad', 'NONE', 'NONE', 'undercurl', '#db4b4b')
call s:HL('SpellCap', 'NONE', 'NONE', 'undercurl', '#e0af68')
call s:HL('SpellLocal', 'NONE', 'NONE', 'undercurl', '#0db9d7')
call s:HL('SpellRare', 'NONE', 'NONE', 'undercurl', '#1abc9c')
call s:HL('Statement', '#bb9af7', 'NONE')
call s:HL('StatusLine', '#a9b1d6', '#16161e')
call s:HL('StatusLineNC', '#3b4261', '#16161e')
call s:HL('String', '#9ece6a', 'NONE')
call s:HL('Substitute', '#15161e', '#f7768e')
call s:HL('TSNodeKey', '#ff007c', 'NONE', 'bold')
call s:HL('TSNodeUnmatched', '#545c7e', 'NONE')
call s:HL('TSRainbowBlue', '#7aa2f7', 'NONE')
call s:HL('TSRainbowCyan', '#7dcfff', 'NONE')
call s:HL('TSRainbowGreen', '#9ece6a', 'NONE')
call s:HL('TSRainbowOrange', '#ff9e64', 'NONE')
call s:HL('TSRainbowRed', '#f7768e', 'NONE')
call s:HL('TSRainbowViolet', '#9d7cd8', 'NONE')
call s:HL('TSRainbowYellow', '#e0af68', 'NONE')
call s:HL('TabLine', '#3b4261', '#16161e')
call s:HL('TabLineFill', 'NONE', '#15161e')
call s:HL('TabLineSel', '#15161e', '#7aa2f7')
call s:HL('TargetWord', '#7dcfff', 'NONE')
call s:HL('TelescopeBorder', '#27a1b9', '#16161e')
call s:HL('TelescopeNormal', '#c0caf5', '#16161e')
call s:HL('Title', '#7aa2f7', 'NONE', 'bold')
call s:HL('Todo', '#1a1b26', '#e0af68')
call s:HL('TreesitterContext', 'NONE', '#343a55')
call s:HL('TroubleCount', '#bb9af7', '#3b4261')
call s:HL('TroubleNormal', '#a9b1d6', '#16161e')
call s:HL('TroubleText', '#a9b1d6', 'NONE')
call s:HL('Type', '#2ac3de', 'NONE')
call s:HL('Underlined', 'NONE', 'NONE', 'underline')
call s:HL('VertSplit', '#15161e', 'NONE')
call s:HL('Visual', 'NONE', '#283457')
call s:HL('VisualNOS', 'NONE', '#283457')
call s:HL('WarningMsg', '#e0af68', 'NONE')
call s:HL('WhichKey', '#7dcfff', 'NONE')
call s:HL('WhichKeyDesc', '#bb9af7', 'NONE')
call s:HL('WhichKeyFloat', 'NONE', '#16161e')
call s:HL('WhichKeyGroup', '#7aa2f7', 'NONE')
call s:HL('WhichKeySeparator', '#565f89', 'NONE')
call s:HL('WhichKeySeperator', '#565f89', 'NONE')
call s:HL('WhichKeyValue', '#737aa2', 'NONE')
call s:HL('Whitespace', '#3b4261', 'NONE')
call s:HL('WildMenu', 'NONE', '#283457')
call s:HL('WinSeparator', '#15161e', 'NONE', 'bold')
call s:HL('YankyPut', 'NONE', 'NONE')
call s:HL('YankyYanked', 'NONE', 'NONE')
call s:HL('debugBreakpoint', '#0db9d7', '#192b38')
call s:HL('debugPC', 'NONE', '#16161e')
call s:HL('diffAdded', '#4097a3', 'NONE')
call s:HL('diffChanged', '#506d9b', 'NONE')
call s:HL('diffFile', '#7aa2f7', 'NONE')
call s:HL('diffIndexLine', '#bb9af7', 'NONE')
call s:HL('diffLine', '#565f89', 'NONE')
call s:HL('diffNewFile', '#ff9e64', 'NONE')
call s:HL('diffOldFile', '#e0af68', 'NONE')
call s:HL('diffRemoved', '#c47981', 'NONE')
call s:HL('healthError', '#db4b4b', 'NONE')
call s:HL('healthSuccess', '#73daca', 'NONE')
call s:HL('healthWarning', '#e0af68', 'NONE')
call s:HL('helpCommand', '#7aa2f7', '#414868')
call s:HL('htmlH1', '#bb9af7', 'NONE', 'bold')
call s:HL('htmlH2', '#7aa2f7', 'NONE', 'bold')
call s:HL('illuminatedCurWord', 'NONE', '#3b4261')
call s:HL('illuminatedWord', 'NONE', '#3b4261')
call s:HL('lCursor', '#1a1b26', '#c0caf5')
call s:HL('markdownCode', '#1abc9c', 'NONE')
call s:HL('markdownCodeBlock', '#1abc9c', 'NONE')
call s:HL('markdownH1', '#bb9af7', 'NONE', 'bold')
call s:HL('markdownH2', '#7aa2f7', 'NONE', 'bold')
call s:HL('markdownHeadingDelimiter', '#ff9e64', 'NONE', 'bold')
call s:HL('markdownLinkText', '#7aa2f7', 'NONE', 'underline')
call s:HL('mkdCodeDelimiter', '#c0caf5', '#414868')
call s:HL('mkdCodeEnd', '#1abc9c', 'NONE', 'bold')
call s:HL('mkdCodeStart', '#1abc9c', 'NONE', 'bold')
call s:HL('qfFileName', '#7aa2f7', 'NONE')
call s:HL('qfLineNr', '#737aa2', 'NONE')
call s:HL('rainbowcol1', '#f7768e', 'NONE')
call s:HL('rainbowcol2', '#e0af68', 'NONE')
call s:HL('rainbowcol3', '#9ece6a', 'NONE')
call s:HL('rainbowcol4', '#1abc9c', 'NONE')
call s:HL('rainbowcol5', '#7aa2f7', 'NONE')
call s:HL('rainbowcol6', '#bb9af7', 'NONE')
call s:HL('rainbowcol7', '#9d7cd8', 'NONE')
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
