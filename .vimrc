set nocompatible " be iMproved, required
filetype off     " required

filetype plugin on " required
syntax enable

colorscheme palenight

" Custom completion style
""" Pmenu – normal item
""" PmenuSel – selected item
""" PmenuSbar – scrollbar
""" PmenuThumb – thumb of the scrollbar
hi Pmenu ctermbg=black ctermfg=white
hi PmenuSel ctermbg=white ctermfg=blue

"""
autocmd VimEnter * NERDTree
filetype indent on

let mapleader = " "

let g:coc_global_extensions = ['coc-python', 'coc-highlight', 'coc-fzf-preview', 'coc-sh', 'coc-git', 'coc-yank', 'coc-yaml', 'coc-json', 'coc-tsserver']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:tmuxline_preset = 'full'
let g:airline_theme = "badwolf"
let g:typescript_compiler_binary = 'tsc'
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:deoplete#enable_at_startup = 1
let g:typescript_indent_disable = 1
"let g:coc_user_config = {}
"let g:coc_user_config['coc.preferences.jumpCommand'] = 'vsplit'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=lightgreen guibg=NONE guifg=lightgreen
hi MatchParen guifg=magenta guibg=white

if (has("termguicolors"))
 set termguicolors
endif

set cmdheight=1
set ts=2 sw=2 et
set noautoindent
set nocindent
set nosmartindent
set indentexpr=
set guifont=Hack_Nerd_Font_Mono
set foldmethod=indent
set foldlevel=99
"set background=dark
set backspace=indent,eol,start
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»
set list
set wildmenu
set encoding=utf-8
set termencoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set ruler
set title
set ignorecase
set smartcase
set showcmd
set expandtab
set showmatch

set mouse=a
set t_Co=256
set ttyfast

set splitbelow
set splitright

set lazyredraw
set updatetime=300

set number
set relativenumber
set numberwidth=4

" Allow copy and paste from system clipboard
set clipboard=unnamed

" no indent on paste
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END

nnoremap <silent> <Leader>= :call ToggleZoom(v:true)<CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
noremap <S-Right> <C-w><Right>
noremap <S-Left> <C-w><Left>
noremap <S-Up> <C-w><Up>
noremap <S-Down> <C-w><Down>

" Easy tab switching
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Toggle NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <c-g> :NERDTreeToggle<CR>
" Format code with Prettier
nnoremap <silent><leader>b :Prettier<CR>
" New Tab
nnoremap <silent><leader>t :tabnew<CR>
" Vertical Split
nnoremap <silent><leader>\ :vsplit<CR>
" Horizontal Split
noremap <leader>n <c-w>n
" Open available Buffers
nnoremap <silent><leader>o :Buffers<CR>
" Preview Project files
nnoremap <silent><leader>f :FzfPreviewProjectFiles<CR>
nnoremap <silent><leader>F :FZF<CR>
" Search in all Project files
nnoremap <silent><leader>v :Ag<CR>
" NEXT/PREV Buffer
nnoremap <silent><leader>] :bnext<CR>
nnoremap <silent><leader>[ :bprevious<CR>
" CLOSE current Buffer withoout closing window
nnoremap <silent><leader>d :new<BAR>bd#<BAR>bp<CR>
"nnoremap <silent><leader>d :bp<BAR>bd#<CR>
" FORCE CLOSE current window
noremap <leader>x <c-w>c
" Yank list
nnoremap <silent><leader>y  :<C-u>CocList -A --normal yank<cr>
" Inspect file commits
nnoremap <silent><leader>i  :<C-u>CocList -A --normal bcommits<cr>
" Refresh Coc
nnoremap <silent><leader>r :CocRestart<CR>

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)

" Zoom current buffer
function! ToggleZoom(zoom)
  if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:zoom
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-W>\|\<C-W>_"
  endif
endfunction

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

"Python Settings
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4
autocmd FileType python set autoindent
autocmd FileType python set expandtab
autocmd FileType python set textwidth=80
autocmd FileType python set smartindent
autocmd FileType python set shiftwidth=4
autocmd FileType python map <buffer> <F2> :w<CR>:exec '! python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:exec '! python' shellescape(@%, 1)<CR>
