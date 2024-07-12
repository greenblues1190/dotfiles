" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged' Avoid using standard Vim directory names like 'plugin' call plug#begin('~/.config/nvim/plugged')
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'nordtheme/vim'
Plug 'letorbi/vim-colors-modern-borland'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-startify'
Plug 'rhysd/git-messenger.vim'
" Initialize plugin system
call plug#end()

"---------------------------------------------------------

set nocompatible " 오리지널 vi와 호환성 제거
language ko_KR.UTF-8

if (has('termguicolors'))
  set termguicolors
endif

set updatetime=300
set number relativenumber
set history=1000
set bs=indent,eol,start
set ww+=h,l

"키워드를 입력하면 바로 검색을 시작하고, 매치된 결과는 하이라이트합니다. 대소문자는 무시하되, 입력된 패턴에 대문자가 포함되어 있으면 대소문자를 구분하여 검색합니다.
set incsearch hlsearch ignorecase smartcase

" set laststatus=2

set linebreak
set showmatch
let &showbreak = '+++ '
" set list listchars=tab:»\ ,trail:·

set tabstop=2 shiftwidth=2 expandtab
set smartindent autoindent
set smarttab

" set fillchars+=vert:│ " change vertical line character

" CursorLine Config
set cursorline
hi CursorLine cterm=NONE ctermbg=240
hi CursorLineNr cterm=NONE ctermfg=lightgrey

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"---------------------------------------------------------

set fileencodings=utf8,euc-kr
filetype on " 파일종류에 따른 구문 강조
filetype plugin on " plugin on
filetype indent on " 파일 유형에 따라 탭간격 조정
if has("syntax")
  syntax on
endif

"---------------------------------------------------------
" Colorscheme Config
" set background=dark
" let g:material_terminal_italics = 1
" 
let g:material_theme_style = 'default-community'
" colorscheme material
" colo seoul256
colo nord
" colo ephemanord
" colo borland
" let g:BorlandStyle = "classic"
let g:limelight_conceal_ctermfg = 7
let g:limelight_conceal_guifg = '#434c5e'

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE

"---------------------------------------------------------
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='nord_minimal'

"---------------------------------------------------------

" Netrw Config
let g:netrw_banner = 0
let g:netrw_winsize = 25

"--------------------------------------------------------
" vim-fugitive config

set signcolumn=yes

"---------------------------------------------------------
" vim-indent-guides config
" let g:indentguides_spacechar = '┆'
" let g:indentguides_tabchar = '┆'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size=1
" 
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=240
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238

"--------------------------------------------------------
" CoC Config

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
" set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>x  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" CocFzfList
nnoremap <silent><nowait> <space>f  :<C-u>CocFzfList<CR>

" coc-explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\     'root-uri': '~/.config/coc',
\   },
\   'right': {
\     'position': 'right',
\     'width': 50,
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\     'floating-width': 80,
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }
nmap <space>e <Cmd>CocCommand explorer --preset right<CR>
nmap <space>E <Cmd>CocCommand explorer --preset floating<CR>

"---------------------------------------------------------
" use fzf in vim
set rtp+=/opt/homebrew/opt/fzf

"---------------------------------------------------------
" goyo + limelight (focus mode)

let g:goyo_width = 100
let g:goyo_height = '60%'
let g:limelight_default_coefficient = 0.7
" let g:goyo_linenr = 1

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set nowrap
  set scrolloff=999
  Limelight
  GitGutterBufferDisable
  let &showbreak = ''
  " set nocursorline

  " transparent fillchars
  let &fcs='eob: ,vert: ,lastline: '

  " nord setting
  hi VertSplit ctermfg=0 guifg=#2e3440
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set wrap
  set scrolloff=5
  Limelight!
  GitGutterBufferEnable
  let &showbreak = '+++ '
  " set cursorline

  " transparent background
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi VertSplit ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>z :Goyo<CR>

"---------------------------------------------------------
" editorconfig-vim
" To ensure that this plugin works well with Tim Pope's fugitive, avoid loading EditorConfig for any remote files over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"---------------------------------------------------------
" startify
" " returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks=['~/.zshrc', '~/.config/nvim/init.vim', '~/.config/alacritty/alacritty.yml', '~/Projects']
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Recent Files']   },
          \ { 'type': 'dir',       'header': ['   Recent Files in: '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
          \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_custom_header = startify#center([
        \ '                                              ___  ',
        \ '                                           ,o88888 ',
        \ '                                        ,o8888888'' ',
        \ '                  ,:o:o:oooo.        ,8O88Pd8888"  ',
        \ '              ,.::.::o:ooooOoOoO. ,oO8O8Pd888''"    ',
        \ '            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ',
        \ '           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ',
        \ '          , ..:.::o:ooOoOO8O888O8O,COCOO"          ',
        \ '         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ',
        \ '          . ..:.::o:ooOoOoOO8O8OCCCC"o             ',
        \ '             . ..:.::o:ooooOoCoCCC"o:o             ',
        \ '             . ..:.::o:o:,cooooCo"oo:o:            ',
        \ '         `   . . ..:.:cocoooo""''o:o:::''            ',
        \ '          .`   . ..::ccccoc"''o:o:o:::''             ',
        \ '         :.:.    ,c:cccc"'':.:.:.:.:.''              ',
        \ '       ..:.:"''`::::c:"''..:.:.:.:.:.''               ',
        \ '     ...:.''.:.::::"''    . . . . .''                 ',
        \ '    .. . ....:."'' `   .  . . ''''                    ',
        \ '  . . . ...."''                                     ',
        \ '  .. . ."''                                         ',
        \ ' .                                                 ',
        \ ])
let g:startify_custom_header = ''

"---------------------------------------------------------
" git-messenger.vim
let g:git_messenger_always_into_popup = v:true
let g:git_messenger_include_diff = "current"
" let g:git_messenger_date_format = "%Y %b %d %X"
hi link gitmessengerPopupNormal CursorLine
