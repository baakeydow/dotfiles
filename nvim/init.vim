" Keep Plug commands between plug#begin() and plug#end().
call plug#begin('~/.vim/plugged')

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'Yggdroot/indentLine'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter' " Show git diff of lines edited
Plug 'edkolev/tmuxline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive' " :Git
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
"Plug 'pangloss/vim-javascript' " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'yuezk/vim-js' " JavaScript syntax
Plug 'maxmellon/vim-jsx-pretty' " JS and JSX syntax

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"Plug 'Shougo/deoplete.nvim' " For async completion
Plug 'Shougo/denite.nvim' " For Denite features

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' " always last

" All of your Plugins must be added before the following line
call plug#end() " required

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

