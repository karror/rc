:syntax enable
:set number
:set showmode
:set ruler
:set wildmenu
:set autoindent
:set hlsearch
:set showmatch
:set smartcase
:set spelllang=pl_pl
:set tabstop=2 shiftwidth=2 "expandtab
:set listchars=eol:⏎,tab:\|\ ,trail:~,extends:>,precedes:<
:set list
:hi CursorLine   cterm=NONE ctermbg=black guibg=black guifg=white
:hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
:set cursorline



" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

au FileType xhtml,xml,html,js,jsx so ~/.vim/autoload/html_autoclosetag.vim

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif


call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight' | Plug 'scrooloose/nerdtree-project-plugin' | Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
" Plug 'dense-analysis/ale'
Plug 'joshdick/onedark.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'HansPinckaers/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern'
Plug 'othree/yajs.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
call plug#end()

let g:lightline = {'colorscheme': 'wombat'}

set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>

let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]

let g:ncm2#matcher = 'substrfuzzy'
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

map <F2> :NERDTreeToggle<CR>
map <F3> :s/<c-r><c-w>/<c-r>"/g<c-f>$F/i
map <F4> :s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i


set background=dark

let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_background="soft"
let g:gruvbox_material_invert_tabline=1
let g:gruvbox_material_transparent_background=1

colorscheme gruvbox-material

let g:lightline = {'colorscheme' : 'gruvbox_material'}

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

let g:coc_disable_startup_warning = 1
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

command! -range TOpdf <line1>,<line2> hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo 'Created: %.pdf'
command! -range PrintRange set background=light | <line1>,<line2> TOhtml | set background=dark
command! PrintFile set background=light | TOhtml | set background=dark
