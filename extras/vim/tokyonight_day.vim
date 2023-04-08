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

let g:colors_name = 'tokyonight_day'
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
  \ 'bg': '#e1e2e7',
  \ 'bg_dark': '#e9e9ec',
  \ 'bg_float': '#e9e9ec',
  \ 'bg_highlight': '#c4c8da',
  \ 'bg_popup': '#e9e9ec',
  \ 'bg_search': '#7890dd',
  \ 'bg_sidebar': '#e9e9ec',
  \ 'bg_statusline': '#e9e9ec',
  \ 'bg_visual': '#b6bfe2',
  \ 'black': '#e9e9ed',
  \ 'blue': '#2e7de9',
  \ 'blue0': '#7890dd',
  \ 'blue1': '#188092',
  \ 'blue2': '#07879d',
  \ 'blue5': '#006a83',
  \ 'blue6': '#2e5857',
  \ 'blue7': '#92a6d5',
  \ 'border': '#e9e9ed',
  \ 'border_highlight': '#2496ac',
  \ 'comment': '#848cb5',
  \ 'cyan': '#007197',
  \ 'dark3': '#8990b3',
  \ 'dark5': '#68709a',
  \ 'diff_add': '#aecde6',
  \ 'diff_change': '#d6d8e3',
  \ 'diff_delete': '#dfccd4',
  \ 'diff_text': '#92a6d5',
  \ 'error': '#c64343',
  \ 'fg': '#3760bf',
  \ 'fg_dark': '#6172b0',
  \ 'fg_float': '#3760bf',
  \ 'fg_gutter': '#a8aecb',
  \ 'fg_sidebar': '#6172b0',
  \ 'gitSigns_add': '#399a96',
  \ 'gitSigns_change': '#6382bd',
  \ 'gitSigns_delete': '#c25d64',
  \ 'git_add': '#4097a3',
  \ 'git_change': '#506d9b',
  \ 'git_delete': '#c47981',
  \ 'git_ignore': '#8990b3',
  \ 'green': '#587539',
  \ 'green1': '#387068',
  \ 'green2': '#38919f',
  \ 'hint': '#118c74',
  \ 'info': '#07879d',
  \ 'magenta': '#9854f1',
  \ 'magenta2': '#d20065',
  \ 'none': 'NONE',
  \ 'orange': '#b15c00',
  \ 'purple': '#7847bd',
  \ 'red': '#f52a65',
  \ 'red1': '#c64343',
  \ 'teal': '#118c74',
  \ 'terminal_black': '#a1a6c5',
  \ 'warning': '#8c6c3e',
  \ 'yellow': '#8c6c3e',
\ }
" }}}

" Highlight: {{{
call s:HL('ALEErrorSign', '#c64343', 'NONE')
call s:HL('ALEWarningSign', '#8c6c3e', 'NONE')
call s:HL('AlphaButtons', '#007197', 'NONE')
call s:HL('AlphaFooter', '#188092', 'NONE')
call s:HL('AlphaHeader', '#2e7de9', 'NONE')
call s:HL('AlphaHeaderLabel', '#b15c00', 'NONE')
call s:HL('AlphaShortcut', '#b15c00', 'NONE')
call s:HL('Bold', 'NONE', 'NONE', 'bold')
call s:HL('BufferAlternate', '#3760bf', '#a8aecb')
call s:HL('BufferAlternateERROR', '#c64343', '#a8aecb')
call s:HL('BufferAlternateHINT', '#118c74', '#a8aecb')
call s:HL('BufferAlternateINFO', '#07879d', '#a8aecb')
call s:HL('BufferAlternateIndex', '#07879d', '#a8aecb')
call s:HL('BufferAlternateMod', '#8c6c3e', '#a8aecb')
call s:HL('BufferAlternateSign', '#07879d', '#a8aecb')
call s:HL('BufferAlternateTarget', '#f52a65', '#a8aecb')
call s:HL('BufferAlternateWARN', '#8c6c3e', '#a8aecb')
call s:HL('BufferCurrent', '#3760bf', '#a8aecb')
call s:HL('BufferCurrentERROR', '#c64343', '#a8aecb')
call s:HL('BufferCurrentHINT', '#118c74', '#a8aecb')
call s:HL('BufferCurrentINFO', '#07879d', '#a8aecb')
call s:HL('BufferCurrentIndex', '#07879d', '#a8aecb')
call s:HL('BufferCurrentMod', '#8c6c3e', '#a8aecb')
call s:HL('BufferCurrentSign', '#07879d', '#a8aecb')
call s:HL('BufferCurrentTarget', '#f52a65', '#a8aecb')
call s:HL('BufferCurrentWARN', '#8c6c3e', '#a8aecb')
call s:HL('BufferInactive', '#68709a', '#e9e9ec')
call s:HL('BufferInactiveERROR', '#d97274', '#e9e9ec')
call s:HL('BufferInactiveHINT', '#177f6e', '#e9e9ec')
call s:HL('BufferInactiveINFO', '#0e7a90', '#e9e9ec')
call s:HL('BufferInactiveIndex', '#68709a', '#e9e9ec')
call s:HL('BufferInactiveMod', '#7b613d', '#e9e9ec')
call s:HL('BufferInactiveSign', '#2496ac', '#e9e9ec')
call s:HL('BufferInactiveTarget', '#f52a65', '#e9e9ec')
call s:HL('BufferInactiveWARN', '#7b613d', '#e9e9ec')
call s:HL('BufferLineIndicatorSelected', '#6183b9', 'NONE')
call s:HL('BufferOffset', '#68709a', '#e9e9ec')
call s:HL('BufferTabpageFill', '#68709a', '#e9e9ec')
call s:HL('BufferTabpages', 'NONE', '#e9e9ec')
call s:HL('BufferVisible', '#3760bf', '#e9e9ec')
call s:HL('BufferVisibleERROR', '#c64343', '#e9e9ec')
call s:HL('BufferVisibleHINT', '#118c74', '#e9e9ec')
call s:HL('BufferVisibleINFO', '#07879d', '#e9e9ec')
call s:HL('BufferVisibleIndex', '#07879d', '#e9e9ec')
call s:HL('BufferVisibleMod', '#8c6c3e', '#e9e9ec')
call s:HL('BufferVisibleSign', '#07879d', '#e9e9ec')
call s:HL('BufferVisibleTarget', '#f52a65', '#e9e9ec')
call s:HL('BufferVisibleWARN', '#8c6c3e', '#e9e9ec')
call s:HL('Character', '#587539', 'NONE')
call s:HL('CmpDocumentation', '#3760bf', '#e9e9ec')
call s:HL('CmpDocumentationBorder', '#2496ac', '#e9e9ec')
call s:HL('CmpItemAbbr', '#3760bf', 'NONE')
call s:HL('CmpItemAbbrDeprecated', '#a8aecb', 'NONE')
call s:HL('CmpItemAbbrMatch', '#188092', 'NONE')
call s:HL('CmpItemAbbrMatchFuzzy', '#188092', 'NONE')
call s:HL('CmpItemKindClass', '#b15c00', 'NONE')
call s:HL('CmpItemKindConstant', '#9854f1', 'NONE')
call s:HL('CmpItemKindConstructor', '#2e7de9', 'NONE')
call s:HL('CmpItemKindCopilot', '#118c74', 'NONE')
call s:HL('CmpItemKindDefault', '#6172b0', 'NONE')
call s:HL('CmpItemKindEnum', '#b15c00', 'NONE')
call s:HL('CmpItemKindEnumMember', '#387068', 'NONE')
call s:HL('CmpItemKindEvent', '#b15c00', 'NONE')
call s:HL('CmpItemKindField', '#387068', 'NONE')
call s:HL('CmpItemKindFunction', '#2e7de9', 'NONE')
call s:HL('CmpItemKindInterface', '#b15c00', 'NONE')
call s:HL('CmpItemKindKeyword', '#007197', 'NONE')
call s:HL('CmpItemKindMethod', '#2e7de9', 'NONE')
call s:HL('CmpItemKindModule', '#8c6c3e', 'NONE')
call s:HL('CmpItemKindOperator', '#387068', 'NONE')
call s:HL('CmpItemKindProperty', '#387068', 'NONE')
call s:HL('CmpItemKindReference', '#9854f1', 'NONE')
call s:HL('CmpItemKindSnippet', '#68709a', 'NONE')
call s:HL('CmpItemKindStruct', '#b15c00', 'NONE')
call s:HL('CmpItemKindTypeParameter', '#387068', 'NONE')
call s:HL('CmpItemKindUnit', '#b15c00', 'NONE')
call s:HL('CmpItemKindValue', '#9854f1', 'NONE')
call s:HL('CmpItemKindVariable', '#9854f1', 'NONE')
call s:HL('CmpItemMenu', '#848cb5', 'NONE')
call s:HL('ColorColumn', 'NONE', '#e9e9ed')
call s:HL('Comment', '#848cb5', 'NONE', 'italic')
call s:HL('Conceal', '#68709a', 'NONE')
call s:HL('Constant', '#b15c00', 'NONE')
call s:HL('CurSearch', 'NONE', 'NONE')
call s:HL('Cursor', '#e1e2e7', '#3760bf')
call s:HL('CursorColumn', 'NONE', '#c4c8da')
call s:HL('CursorIM', '#e1e2e7', '#3760bf')
call s:HL('CursorLine', 'NONE', '#c4c8da')
call s:HL('CursorLineNr', '#68709a', 'NONE')
call s:HL('DashboardCenter', '#9854f1', 'NONE')
call s:HL('DashboardFooter', '#8c6c3e', 'NONE', 'italic')
call s:HL('DashboardHeader', '#2e7de9', 'NONE')
call s:HL('DashboardShortCut', '#007197', 'NONE')
call s:HL('DefinitionCount', '#7847bd', 'NONE')
call s:HL('DefinitionIcon', '#2e7de9', 'NONE')
call s:HL('DiagnosticError', '#c64343', 'NONE')
call s:HL('DiagnosticHint', '#118c74', 'NONE')
call s:HL('DiagnosticInfo', '#07879d', 'NONE')
call s:HL('DiagnosticInformation', 'NONE', 'NONE')
call s:HL('DiagnosticUnderlineError', 'NONE', 'NONE', 'undercurl', '#c64343')
call s:HL('DiagnosticUnderlineHint', 'NONE', 'NONE', 'undercurl', '#118c74')
call s:HL('DiagnosticUnderlineInfo', 'NONE', 'NONE', 'undercurl', '#07879d')
call s:HL('DiagnosticUnderlineWarn', 'NONE', 'NONE', 'undercurl', '#8c6c3e')
call s:HL('DiagnosticVirtualTextError', '#c64343', '#e0d3dd')
call s:HL('DiagnosticVirtualTextHint', '#118c74', '#acd7eb')
call s:HL('DiagnosticVirtualTextInfo', '#07879d', '#b7d3ed')
call s:HL('DiagnosticVirtualTextWarn', '#8c6c3e', '#d0cccf')
call s:HL('DiagnosticWarn', '#8c6c3e', 'NONE')
call s:HL('DiagnosticWarning', 'NONE', 'NONE')
call s:HL('DiffAdd', 'NONE', '#aecde6')
call s:HL('DiffChange', 'NONE', '#d6d8e3')
call s:HL('DiffDelete', 'NONE', '#dfccd4')
call s:HL('DiffText', 'NONE', '#92a6d5')
call s:HL('Directory', '#2e7de9', 'NONE')
call s:HL('EndOfBuffer', '#e1e2e7', 'NONE')
call s:HL('Error', '#c64343', 'NONE')
call s:HL('ErrorMsg', '#c64343', 'NONE')
call s:HL('FernBranchText', '#2e7de9', 'NONE')
call s:HL('FloatBorder', '#2496ac', '#e9e9ec')
call s:HL('FoldColumn', '#848cb5', '#e1e2e7')
call s:HL('Folded', '#2e7de9', '#a8aecb')
call s:HL('Foo', '#d20065', '#d20065')
call s:HL('Function', '#2e7de9', 'NONE')
call s:HL('GitGutterAdd', '#266d6a', 'NONE')
call s:HL('GitGutterChange', '#526c9e', 'NONE')
call s:HL('GitGutterDelete', '#b2555b', 'NONE')
call s:HL('GitSignsAdd', '#266d6a', 'NONE')
call s:HL('GitSignsChange', '#526c9e', 'NONE')
call s:HL('GitSignsDelete', '#b2555b', 'NONE')
call s:HL('GlyphPalette1', '#c64343', 'NONE')
call s:HL('GlyphPalette2', '#587539', 'NONE')
call s:HL('GlyphPalette3', '#8c6c3e', 'NONE')
call s:HL('GlyphPalette4', '#2e7de9', 'NONE')
call s:HL('GlyphPalette6', '#387068', 'NONE')
call s:HL('GlyphPalette7', '#3760bf', 'NONE')
call s:HL('GlyphPalette9', '#f52a65', 'NONE')
call s:HL('Hlargs', '#8c6c3e', 'NONE')
call s:HL('HopNextKey', '#d20065', 'NONE', 'bold')
call s:HL('HopNextKey1', '#07879d', 'NONE', 'bold')
call s:HL('HopNextKey2', '#168aa3', 'NONE')
call s:HL('HopUnmatched', '#8990b3', 'NONE')
call s:HL('Identifier', '#9854f1', 'NONE')
call s:HL('IlluminatedWordRead', 'NONE', '#a8aecb')
call s:HL('IlluminatedWordText', 'NONE', '#a8aecb')
call s:HL('IlluminatedWordWrite', 'NONE', '#a8aecb')
call s:HL('IncSearch', '#e9e9ed', '#b15c00')
call s:HL('IndentBlanklineChar', '#a8aecb', 'NONE')
call s:HL('IndentBlanklineContextChar', '#7847bd', 'NONE')
call s:HL('Italic', 'NONE', 'NONE', 'italic')
call s:HL('Keyword', '#007197', 'NONE', 'italic')
call s:HL('LazyProgressDone', '#d20065', 'NONE', 'bold')
call s:HL('LazyProgressTodo', '#a8aecb', 'NONE', 'bold')
call s:HL('LeapBackdrop', '#8990b3', 'NONE')
call s:HL('LeapLabelPrimary', '#d20065', 'NONE', 'bold')
call s:HL('LeapLabelSecondary', '#387068', 'NONE', 'bold')
call s:HL('LeapMatch', '#3760bf', '#d20065', 'bold')
call s:HL('LightspeedGreyWash', '#8990b3', 'NONE')
call s:HL('LightspeedLabel', '#d20065', 'NONE', 'bold,underline')
call s:HL('LightspeedLabelDistant', '#387068', 'NONE', 'bold,underline')
call s:HL('LightspeedLabelDistantOverlapped', '#38919f', 'NONE', 'underline')
call s:HL('LightspeedLabelOverlapped', '#d20065', 'NONE', 'underline')
call s:HL('LightspeedMaskedChar', '#b15c00', 'NONE')
call s:HL('LightspeedOneCharMatch', '#3760bf', '#d20065', 'bold')
call s:HL('LightspeedPendingOpArea', '#3760bf', '#d20065')
call s:HL('LightspeedShortcut', '#3760bf', '#d20065', 'bold,underline')
call s:HL('LightspeedUnlabeledMatch', '#07879d', 'NONE', 'bold')
call s:HL('LineNr', '#a8aecb', 'NONE')
call s:HL('LspCodeLens', '#848cb5', 'NONE')
call s:HL('LspFloatWinBorder', '#2496ac', 'NONE')
call s:HL('LspFloatWinNormal', 'NONE', '#e9e9ec')
call s:HL('LspInfoBorder', '#2496ac', '#e9e9ec')
call s:HL('LspReferenceRead', 'NONE', '#a8aecb')
call s:HL('LspReferenceText', 'NONE', '#a8aecb')
call s:HL('LspReferenceWrite', 'NONE', '#a8aecb')
call s:HL('LspSagaBorderTitle', '#007197', 'NONE')
call s:HL('LspSagaCodeActionBorder', '#2e7de9', 'NONE')
call s:HL('LspSagaCodeActionContent', '#7847bd', 'NONE')
call s:HL('LspSagaCodeActionTitle', '#188092', 'NONE')
call s:HL('LspSagaDefPreviewBorder', '#587539', 'NONE')
call s:HL('LspSagaFinderSelection', '#b6bfe2', 'NONE')
call s:HL('LspSagaHoverBorder', '#2e7de9', 'NONE')
call s:HL('LspSagaRenameBorder', '#587539', 'NONE')
call s:HL('LspSagaSignatureHelpBorder', '#f52a65', 'NONE')
call s:HL('LspSignatureActiveParameter', 'NONE', '#d0d3e4', 'bold')
call s:HL('MatchParen', '#b15c00', 'NONE', 'bold')
call s:HL('MiniCompletionActiveParameter', 'NONE', 'NONE', 'underline')
call s:HL('MiniCursorword', 'NONE', '#a8aecb')
call s:HL('MiniCursorwordCurrent', 'NONE', '#a8aecb')
call s:HL('MiniIndentscopePrefix', 'NONE', 'NONE')
call s:HL('MiniIndentscopeSymbol', '#188092', 'NONE')
call s:HL('MiniJump', '#474747', '#d20065')
call s:HL('MiniJump2dSpot', '#d20065', 'NONE', 'bold')
call s:HL('MiniStarterCurrent', 'NONE', 'NONE')
call s:HL('MiniStarterFooter', '#8c6c3e', 'NONE', 'italic')
call s:HL('MiniStarterHeader', '#2e7de9', 'NONE')
call s:HL('MiniStarterInactive', '#848cb5', 'NONE', 'italic')
call s:HL('MiniStarterItem', '#3760bf', '#e1e2e7')
call s:HL('MiniStarterItemBullet', '#2496ac', 'NONE')
call s:HL('MiniStarterItemPrefix', '#8c6c3e', 'NONE')
call s:HL('MiniStarterQuery', '#07879d', 'NONE')
call s:HL('MiniStarterSection', '#188092', 'NONE')
call s:HL('MiniStatuslineDevinfo', '#6172b0', '#c4c8da')
call s:HL('MiniStatuslineFileinfo', '#6172b0', '#c4c8da')
call s:HL('MiniStatuslineFilename', '#6172b0', '#a8aecb')
call s:HL('MiniStatuslineInactive', '#2e7de9', '#e9e9ec')
call s:HL('MiniStatuslineModeCommand', '#e9e9ed', '#8c6c3e', 'bold')
call s:HL('MiniStatuslineModeInsert', '#e9e9ed', '#587539', 'bold')
call s:HL('MiniStatuslineModeNormal', '#e9e9ed', '#2e7de9', 'bold')
call s:HL('MiniStatuslineModeOther', '#e9e9ed', '#118c74', 'bold')
call s:HL('MiniStatuslineModeReplace', '#e9e9ed', '#f52a65', 'bold')
call s:HL('MiniStatuslineModeVisual', '#e9e9ed', '#9854f1', 'bold')
call s:HL('MiniSurround', '#e9e9ed', '#b15c00')
call s:HL('MiniTablineCurrent', '#3760bf', '#a8aecb')
call s:HL('MiniTablineFill', 'NONE', '#e9e9ed')
call s:HL('MiniTablineHidden', '#68709a', '#e9e9ec')
call s:HL('MiniTablineModifiedCurrent', '#8c6c3e', '#a8aecb')
call s:HL('MiniTablineModifiedHidden', '#7b613d', '#e9e9ec')
call s:HL('MiniTablineModifiedVisible', '#8c6c3e', '#e9e9ec')
call s:HL('MiniTablineTabpagesection', 'NONE', '#e9e9ec')
call s:HL('MiniTablineVisible', '#3760bf', '#e9e9ec')
call s:HL('MiniTestEmphasis', 'NONE', 'NONE', 'bold')
call s:HL('MiniTestFail', '#f52a65', 'NONE', 'bold')
call s:HL('MiniTestPass', '#587539', 'NONE', 'bold')
call s:HL('MiniTrailspace', 'NONE', '#f52a65')
call s:HL('ModeMsg', '#6172b0', 'NONE', 'bold')
call s:HL('MoreMsg', '#2e7de9', 'NONE')
call s:HL('MsgArea', '#6172b0', 'NONE')
call s:HL('NavicIconsArray', '#b15c00', 'NONE')
call s:HL('NavicIconsBoolean', '#b15c00', 'NONE')
call s:HL('NavicIconsClass', '#b15c00', 'NONE')
call s:HL('NavicIconsConstant', '#9854f1', 'NONE')
call s:HL('NavicIconsConstructor', '#b15c00', 'NONE')
call s:HL('NavicIconsEnum', '#b15c00', 'NONE')
call s:HL('NavicIconsEnumMember', '#387068', 'NONE')
call s:HL('NavicIconsEvent', '#b15c00', 'NONE')
call s:HL('NavicIconsField', '#387068', 'NONE')
call s:HL('NavicIconsFile', '#3760bf', 'NONE')
call s:HL('NavicIconsFunction', '#2e7de9', 'NONE')
call s:HL('NavicIconsInterface', '#b15c00', 'NONE')
call s:HL('NavicIconsKey', '#7847bd', 'NONE')
call s:HL('NavicIconsKeyword', '#7847bd', 'NONE')
call s:HL('NavicIconsMethod', '#2e7de9', 'NONE')
call s:HL('NavicIconsModule', '#8c6c3e', 'NONE')
call s:HL('NavicIconsNamespace', '#3760bf', 'NONE')
call s:HL('NavicIconsNull', '#b15c00', 'NONE')
call s:HL('NavicIconsNumber', '#b15c00', 'NONE')
call s:HL('NavicIconsObject', '#b15c00', 'NONE')
call s:HL('NavicIconsOperator', '#3760bf', 'NONE')
call s:HL('NavicIconsPackage', '#3760bf', 'NONE')
call s:HL('NavicIconsProperty', '#387068', 'NONE')
call s:HL('NavicIconsString', '#587539', 'NONE')
call s:HL('NavicIconsStruct', '#b15c00', 'NONE')
call s:HL('NavicIconsTypeParameter', '#387068', 'NONE')
call s:HL('NavicIconsVariable', '#9854f1', 'NONE')
call s:HL('NavicSeparator', '#3760bf', 'NONE')
call s:HL('NavicText', '#3760bf', 'NONE')
call s:HL('NeoTreeDimText', '#a8aecb', 'NONE')
call s:HL('NeoTreeNormal', '#6172b0', '#e9e9ec')
call s:HL('NeoTreeNormalNC', '#6172b0', '#e9e9ec')
call s:HL('NeogitBranch', '#9854f1', 'NONE')
call s:HL('NeogitDiffAddHighlight', '#2c6c75', '#aecde6')
call s:HL('NeogitDiffContextHighlight', '#6172b0', '#c3c6d8')
call s:HL('NeogitDiffDeleteHighlight', '#914c54', '#dfccd4')
call s:HL('NeogitHunkHeader', '#3760bf', '#c4c8da')
call s:HL('NeogitHunkHeaderHighlight', '#2e7de9', '#a8aecb')
call s:HL('NeogitRemote', '#7847bd', 'NONE')
call s:HL('NeotestAdapterName', '#7847bd', 'NONE', 'bold')
call s:HL('NeotestBorder', '#2e7de9', 'NONE')
call s:HL('NeotestDir', '#2e7de9', 'NONE')
call s:HL('NeotestExpandMarker', '#6172b0', 'NONE')
call s:HL('NeotestFailed', '#f52a65', 'NONE')
call s:HL('NeotestFile', '#118c74', 'NONE')
call s:HL('NeotestFocused', '#8c6c3e', 'NONE')
call s:HL('NeotestIndent', '#6172b0', 'NONE')
call s:HL('NeotestMarked', '#2e7de9', 'NONE')
call s:HL('NeotestNamespace', '#38919f', 'NONE')
call s:HL('NeotestPassed', '#587539', 'NONE')
call s:HL('NeotestRunning', '#8c6c3e', 'NONE')
call s:HL('NeotestSkipped', '#2e7de9', 'NONE')
call s:HL('NeotestTarget', '#2e7de9', 'NONE')
call s:HL('NeotestTest', '#6172b0', 'NONE')
call s:HL('NeotestWinSelect', '#2e7de9', 'NONE')
call s:HL('NoiceCompletionItemKindClass', '#b15c00', 'NONE')
call s:HL('NoiceCompletionItemKindConstant', '#9854f1', 'NONE')
call s:HL('NoiceCompletionItemKindConstructor', '#2e7de9', 'NONE')
call s:HL('NoiceCompletionItemKindDefault', '#6172b0', 'NONE')
call s:HL('NoiceCompletionItemKindEnum', '#b15c00', 'NONE')
call s:HL('NoiceCompletionItemKindEnumMember', '#387068', 'NONE')
call s:HL('NoiceCompletionItemKindEvent', '#b15c00', 'NONE')
call s:HL('NoiceCompletionItemKindField', '#387068', 'NONE')
call s:HL('NoiceCompletionItemKindFunction', '#2e7de9', 'NONE')
call s:HL('NoiceCompletionItemKindInterface', '#b15c00', 'NONE')
call s:HL('NoiceCompletionItemKindKeyword', '#007197', 'NONE')
call s:HL('NoiceCompletionItemKindMethod', '#2e7de9', 'NONE')
call s:HL('NoiceCompletionItemKindModule', '#8c6c3e', 'NONE')
call s:HL('NoiceCompletionItemKindOperator', '#387068', 'NONE')
call s:HL('NoiceCompletionItemKindProperty', '#387068', 'NONE')
call s:HL('NoiceCompletionItemKindReference', '#9854f1', 'NONE')
call s:HL('NoiceCompletionItemKindSnippet', '#68709a', 'NONE')
call s:HL('NoiceCompletionItemKindStruct', '#b15c00', 'NONE')
call s:HL('NoiceCompletionItemKindTypeParameter', '#387068', 'NONE')
call s:HL('NoiceCompletionItemKindUnit', '#b15c00', 'NONE')
call s:HL('NoiceCompletionItemKindValue', '#9854f1', 'NONE')
call s:HL('NoiceCompletionItemKindVariable', '#9854f1', 'NONE')
call s:HL('NonText', '#8990b3', 'NONE')
call s:HL('Normal', '#3760bf', '#e1e2e7')
call s:HL('NormalFloat', '#3760bf', '#e9e9ec')
call s:HL('NormalNC', '#3760bf', '#e1e2e7')
call s:HL('NormalSB', '#6172b0', '#e9e9ec')
call s:HL('NotifyDEBUGBody', '#3760bf', '#e1e2e7')
call s:HL('NotifyDEBUGBorder', '#c4c6d6', '#e1e2e7')
call s:HL('NotifyDEBUGIcon', '#848cb5', 'NONE')
call s:HL('NotifyDEBUGTitle', '#848cb5', 'NONE')
call s:HL('NotifyERRORBody', '#3760bf', '#e1e2e7')
call s:HL('NotifyERRORBorder', '#dbb6bb', '#e1e2e7')
call s:HL('NotifyERRORIcon', '#c64343', 'NONE')
call s:HL('NotifyERRORTitle', '#c64343', 'NONE')
call s:HL('NotifyINFOBody', '#3760bf', '#e1e2e7')
call s:HL('NotifyINFOBorder', '#44bbe2', '#e1e2e7')
call s:HL('NotifyINFOIcon', '#07879d', 'NONE')
call s:HL('NotifyINFOTitle', '#07879d', 'NONE')
call s:HL('NotifyTRACEBody', '#3760bf', '#e1e2e7')
call s:HL('NotifyTRACEBorder', '#b9b3cd', '#e1e2e7')
call s:HL('NotifyTRACEIcon', '#7847bd', 'NONE')
call s:HL('NotifyTRACETitle', '#7847bd', 'NONE')
call s:HL('NotifyWARNBody', '#3760bf', '#e1e2e7')
call s:HL('NotifyWARNBorder', '#c0a388', '#e1e2e7')
call s:HL('NotifyWARNIcon', '#8c6c3e', 'NONE')
call s:HL('NotifyWARNTitle', '#8c6c3e', 'NONE')
call s:HL('NvimTreeFolderIcon', '#2e7de9', 'NONE')
call s:HL('NvimTreeGitDeleted', '#914c54', 'NONE')
call s:HL('NvimTreeGitDirty', '#6183b9', 'NONE')
call s:HL('NvimTreeGitNew', '#2c6c75', 'NONE')
call s:HL('NvimTreeImageFile', '#6172b0', 'NONE')
call s:HL('NvimTreeIndentMarker', '#a8aecb', 'NONE')
call s:HL('NvimTreeNormal', '#6172b0', '#e9e9ec')
call s:HL('NvimTreeNormalNC', '#6172b0', '#e9e9ec')
call s:HL('NvimTreeOpenedFile', 'NONE', '#c4c8da')
call s:HL('NvimTreeRootFolder', '#2e7de9', 'NONE', 'bold')
call s:HL('NvimTreeSpecialFile', '#7847bd', 'NONE', 'underline')
call s:HL('NvimTreeSymlink', '#2e7de9', 'NONE')
call s:HL('NvimTreeWinSeparator', '#e9e9ec', '#e9e9ec')
call s:HL('Operator', '#006a83', 'NONE')
call s:HL('Pmenu', '#3760bf', '#e9e9ec')
call s:HL('PmenuSbar', 'NONE', '#d8d8dc')
call s:HL('PmenuSel', 'NONE', '#b3b8d1')
call s:HL('PmenuThumb', 'NONE', '#a8aecb')
call s:HL('PreProc', '#007197', 'NONE')
call s:HL('Question', '#2e7de9', 'NONE')
call s:HL('QuickFixLine', 'NONE', '#b6bfe2', 'bold')
call s:HL('ReferencesCount', '#7847bd', 'NONE')
call s:HL('ReferencesIcon', '#2e7de9', 'NONE')
call s:HL('ScrollbarError', '#c64343', 'NONE')
call s:HL('ScrollbarErrorHandle', '#c64343', '#c4c8da')
call s:HL('ScrollbarHandle', 'NONE', '#c4c8da')
call s:HL('ScrollbarHint', '#118c74', 'NONE')
call s:HL('ScrollbarHintHandle', '#118c74', '#c4c8da')
call s:HL('ScrollbarInfo', '#07879d', 'NONE')
call s:HL('ScrollbarInfoHandle', '#07879d', '#c4c8da')
call s:HL('ScrollbarMisc', '#7847bd', 'NONE')
call s:HL('ScrollbarMiscHandle', '#7847bd', '#c4c8da')
call s:HL('ScrollbarSearch', '#b15c00', 'NONE')
call s:HL('ScrollbarSearchHandle', '#b15c00', '#c4c8da')
call s:HL('ScrollbarWarn', '#8c6c3e', 'NONE')
call s:HL('ScrollbarWarnHandle', '#8c6c3e', '#c4c8da')
call s:HL('Search', '#3760bf', '#7890dd')
call s:HL('SignColumn', '#a8aecb', '#e1e2e7')
call s:HL('SignColumnSB', '#a8aecb', '#e9e9ec')
call s:HL('Sneak', '#c4c8da', '#9854f1')
call s:HL('SneakScope', 'NONE', '#b6bfe2')
call s:HL('Special', '#188092', 'NONE')
call s:HL('SpecialKey', '#8990b3', 'NONE')
call s:HL('SpellBad', 'NONE', 'NONE', 'undercurl', '#c64343')
call s:HL('SpellCap', 'NONE', 'NONE', 'undercurl', '#8c6c3e')
call s:HL('SpellLocal', 'NONE', 'NONE', 'undercurl', '#07879d')
call s:HL('SpellRare', 'NONE', 'NONE', 'undercurl', '#118c74')
call s:HL('Statement', '#9854f1', 'NONE')
call s:HL('StatusLine', '#6172b0', '#e9e9ec')
call s:HL('StatusLineNC', '#a8aecb', '#e9e9ec')
call s:HL('String', '#587539', 'NONE')
call s:HL('Substitute', '#e9e9ed', '#f52a65')
call s:HL('TSNodeKey', '#d20065', 'NONE', 'bold')
call s:HL('TSNodeUnmatched', '#8990b3', 'NONE')
call s:HL('TSRainbowBlue', '#2e7de9', 'NONE')
call s:HL('TSRainbowCyan', '#007197', 'NONE')
call s:HL('TSRainbowGreen', '#587539', 'NONE')
call s:HL('TSRainbowOrange', '#b15c00', 'NONE')
call s:HL('TSRainbowRed', '#f52a65', 'NONE')
call s:HL('TSRainbowViolet', '#7847bd', 'NONE')
call s:HL('TSRainbowYellow', '#8c6c3e', 'NONE')
call s:HL('TabLine', '#a8aecb', '#e9e9ec')
call s:HL('TabLineFill', 'NONE', '#e9e9ed')
call s:HL('TabLineSel', '#e9e9ed', '#2e7de9')
call s:HL('TargetWord', '#007197', 'NONE')
call s:HL('TelescopeBorder', '#2496ac', '#e9e9ec')
call s:HL('TelescopeNormal', '#3760bf', '#e9e9ec')
call s:HL('Title', '#2e7de9', 'NONE', 'bold')
call s:HL('Todo', '#e1e2e7', '#8c6c3e')
call s:HL('TreesitterContext', 'NONE', '#b3b8d1')
call s:HL('TroubleCount', '#9854f1', '#a8aecb')
call s:HL('TroubleNormal', '#6172b0', '#e9e9ec')
call s:HL('TroubleText', '#6172b0', 'NONE')
call s:HL('Type', '#188092', 'NONE')
call s:HL('Underlined', 'NONE', 'NONE', 'underline')
call s:HL('VertSplit', '#e9e9ed', 'NONE')
call s:HL('Visual', 'NONE', '#b6bfe2')
call s:HL('VisualNOS', 'NONE', '#b6bfe2')
call s:HL('WarningMsg', '#8c6c3e', 'NONE')
call s:HL('WhichKey', '#007197', 'NONE')
call s:HL('WhichKeyDesc', '#9854f1', 'NONE')
call s:HL('WhichKeyFloat', 'NONE', '#e9e9ec')
call s:HL('WhichKeyGroup', '#2e7de9', 'NONE')
call s:HL('WhichKeySeparator', '#848cb5', 'NONE')
call s:HL('WhichKeySeperator', '#848cb5', 'NONE')
call s:HL('WhichKeyValue', '#68709a', 'NONE')
call s:HL('Whitespace', '#a8aecb', 'NONE')
call s:HL('WildMenu', 'NONE', '#b6bfe2')
call s:HL('WinSeparator', '#e9e9ed', 'NONE', 'bold')
call s:HL('YankyPut', 'NONE', 'NONE')
call s:HL('YankyYanked', 'NONE', 'NONE')
call s:HL('debugBreakpoint', '#07879d', '#b7d3ed')
call s:HL('debugPC', 'NONE', '#e9e9ec')
call s:HL('diffAdded', '#2c6c75', 'NONE')
call s:HL('diffChanged', '#6183b9', 'NONE')
call s:HL('diffFile', '#2e7de9', 'NONE')
call s:HL('diffIndexLine', '#9854f1', 'NONE')
call s:HL('diffLine', '#848cb5', 'NONE')
call s:HL('diffNewFile', '#b15c00', 'NONE')
call s:HL('diffOldFile', '#8c6c3e', 'NONE')
call s:HL('diffRemoved', '#914c54', 'NONE')
call s:HL('healthError', '#c64343', 'NONE')
call s:HL('healthSuccess', '#387068', 'NONE')
call s:HL('healthWarning', '#8c6c3e', 'NONE')
call s:HL('helpCommand', '#2e7de9', '#a1a6c5')
call s:HL('htmlH1', '#9854f1', 'NONE', 'bold')
call s:HL('htmlH2', '#2e7de9', 'NONE', 'bold')
call s:HL('illuminatedCurWord', 'NONE', '#a8aecb')
call s:HL('illuminatedWord', 'NONE', '#a8aecb')
call s:HL('lCursor', '#e1e2e7', '#3760bf')
call s:HL('markdownCode', '#118c74', 'NONE')
call s:HL('markdownCodeBlock', '#118c74', 'NONE')
call s:HL('markdownH1', '#9854f1', 'NONE', 'bold')
call s:HL('markdownH2', '#2e7de9', 'NONE', 'bold')
call s:HL('markdownHeadingDelimiter', '#b15c00', 'NONE', 'bold')
call s:HL('markdownLinkText', '#2e7de9', 'NONE', 'underline')
call s:HL('mkdCodeDelimiter', '#3760bf', '#a1a6c5')
call s:HL('mkdCodeEnd', '#118c74', 'NONE', 'bold')
call s:HL('mkdCodeStart', '#118c74', 'NONE', 'bold')
call s:HL('qfFileName', '#2e7de9', 'NONE')
call s:HL('qfLineNr', '#68709a', 'NONE')
call s:HL('rainbowcol1', '#f52a65', 'NONE')
call s:HL('rainbowcol2', '#8c6c3e', 'NONE')
call s:HL('rainbowcol3', '#587539', 'NONE')
call s:HL('rainbowcol4', '#118c74', 'NONE')
call s:HL('rainbowcol5', '#2e7de9', 'NONE')
call s:HL('rainbowcol6', '#9854f1', 'NONE')
call s:HL('rainbowcol7', '#7847bd', 'NONE')
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
