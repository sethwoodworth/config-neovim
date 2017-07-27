" A neovim configuration using vim-plugged
if $TERM == "xterm-256color"
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
end

call plug#begin('~/.config/nvim/plugged')

" START keep

Plug 'morhetz/gruvbox'

Plug 'blueyed/vim-tmux-navigator'
Plug 'tpope/vim-commentary'

Plug 'kassio/neoterm'

Plug 'junegunn/fzf', { 'tag': '0.15.9', 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'commit': '2066643' }

Plug 'neomake/neomake' ", { 'commit': 'b6a7118' }

" Search file contents
Plug 'mileszs/ack.vim'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Tag functionality
Plug 'vim-scripts/AutoTag', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar' ", {'on': 'TagbarToggle'}

Plug 'tpope/vim-vinegar'
Plug 'fidian/hexmode'
Plug 'dietsche/vim-lastplace'
Plug 'tpope/vim-fugitive'
Plug 'w0ng/vim-hybrid'

" Asciidoc
Plug 'dahu/vimple', {'for' : 'asciidoc'}
Plug 'dahu/Asif', {'for' : 'asciidoc'}
Plug 'vim-scripts/SyntaxRange', {'for' : 'asciidoc'}
Plug 'dahu/vim-asciidoc', {'for' : 'asciidoc'}
Plug 'vim-voom/VOoM', {'for' : ['markdown', 'asciidoc']}

" Ruby/rails
Plug 'tpope/vim-rails', {'for' : 'ruby'}
Plug 'tpope/vim-endwise'

Plug 'airblade/vim-gitgutter', {'on' : 'GitGutterToggle'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'

" END keep

" Check config
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim', {'for' : ['python', 'ruby', 'html', 'css']}
" Plug 'klen/python-mode', {'for' : 'python'}
Plug 'janko-m/vim-test', {'for' : ['python', 'ruby']}
Plug 'jmcantrell/vim-virtualenv', {'for' : 'python'}

" Unused, learn
" Plug 'easymotion/vim-easymotion'

" Unused, remove?
" Plug 'jceb/vim-orgmode'
" Plug 'sirtaj/vim-openscad'
" Plug 'craigemery/vim-autotag'
" Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/base16-vim'
" Plug 'kchmck/vim-coffee-script'
" Plug 'jamessan/vim-gnupg'
" Plug 'godlygeek/tabular'
" Plug 'Shougo/deoplete.nvim'
" Plug 'scrooloose/syntastic', {'for' : ['sh', 'bash', 'ruby']}
" Plug 'floobits/floobits-neovim'



" Plug 'vim-scripts/ShowMarks'
" Plug 'vim-scripts/DrawIt'
call plug#end()

" Unicode by default
scriptencoding utf-8

" Colorscheme
" set t_Co=256
" let base16colorspace=256
" let g:base16_shell_path='/home/seth/.config/base16-shell/'
set background=dark
" let g:badwolf_darkgutter = 1
" colorscheme badwolf
let g:gruvbox_italic = 1
colorscheme gruvbox


" Visual behaviors
set list listchars=tab:·\ ,trail:≁,nbsp:∝
set noautoindent
set showmatch matchtime=2
set ttimeoutlen=10
set visualbell
set wildmode=list:longest

" mice are a pernicious habit, (but not literally)
set mouse=

" Search behavior: Smartcase
set ignorecase " you MUST set this to get smart case search
set smartcase  " Together this means that searches are
               " case insensitive until you specify a capital
" Search behavior: "very magic"
nnoremap / /\v
vnoremap / /\v

" Split behavior
set splitbelow " open vertical splits below the current pane
set splitright " open horizontal splits right of the current pane

" Normal mode bindings
nnoremap H ^
nnoremap L g_
nnoremap Y y$
nnoremap <F1> <ESC>
" Switch panes with ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Allow switching from vim terminals
tnoremap <C-h> <C-\><C-n>h
tnoremap <C-j> <C-\><C-n>j
tnoremap <C-k> <C-\><C-n>k
tnoremap <C-l> <C-\><C-n>l

" nvim terminal
tnoremap <Esc> <C-\><C-n>

" set g:terminal_scrollback_buffer_size=10000

" Tab settings
set expandtab shiftwidth=2 softtabstop=2
autocmd Filetype python setlocal expandtab shiftwidth=4 softtabstop=4

" numberwang
set number

" if you move to another pane or window, save!
autocmd FocusLost * silent! wa

" folding
set foldlevelstart=99  " begin with all folds showing

" vim-airline settings
function! NeotermStatus()
  if exists("g:neoterm_statusline")
    return g:neoterm_statusline
  endif
endfunc

function! AirlineInit()
  call airline#parts#define_function('neoterm', 'NeotermStatus')
  let g:airline_section_warning = airline#section#create_right(['whitespace', 'neoterm'])
endfunction
" autocmd user AirlineAfterInit call AirlineInit()

" " Leader settings
" <space> as leader
let mapleader = " "
vnoremap <Leader>2 :TREPLSendSelection
nnoremap <Leader>2 :TREPLSendLine
nnoremap <leader>"' :s/\"/\'/g <cr> :nohls <cr>
nnoremap <leader>'" :s/\'/\"/g <cr> :nohls <cr>
nnoremap <leader><leader> :nohls<CR>
nnoremap <leader>H :'<,'>s/:\(\w\+\)\s\+=>\s\+/\1: /g<CR>
nnoremap <leader>L :lclose<CR>
nnoremap <leader>M zM
nnoremap <leader>R zR
nnoremap <leader>T :TagbarOpenAutoClose<CR>
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <leader>a :Ack
nnoremap <leader>c :call neoterm#test#run('current')<CR>
nnoremap <leader>e :lwindow<CR>
nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>
nnoremap <leader>f :call neoterm#test#run('file')<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>h :s/:\(\w\+\)\s\+=>\s\+/\1: /g<CR>
nnoremap <leader>ii :IndentGuidesToggle<CR>
nnoremap <leader>l :lw<cr>
nnoremap <leader>m zm
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>r zr
nnoremap <leader>s :Cov<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>tt :TT
nnoremap <leader>v `[v`]
nnoremap <leader>w <C-w>v

" that thing ari showed me
" :w!! will save file as root
cmap w!! w !sudo tee %

" pop up message with syntax highlighting group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Python-mode settings
let g:python_host_prog='/usr/bin/python2'
let g:pymode_folding = 0
" vaC, vaM -- select class, method
" <leader>b insert breakpoint
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX: breakpoint'
let g:pymode_complete_on_dot = 0
let g:pymode_lint_ignore = "E501,E221,E302,E701"
let g:pymode_virtualenv = 0
" completion via C-Space
" <C-c>g for jump to definition

let NERDTreeIgnore=['\.pyc']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0

let vimple_init_vn = 0

" Ctrl-p settings
let g:ctrlp_custom_ignore = '\v[\/][\.]*(node_modules|git|hg|svn)$'

" fzf settings
map <C-P> :FZF<CR>

let g:fzf_buffers_jump = 0
" CTRL-T open in new tab
" CTRL-X open in horizontal split
" CTRL-V open in vertical split

" Git gutter
" ]c - next change, [c - prev change
" <leader>hs - stage hunk
" <leader>hs - stage hunk
let g:gitgutter_enabled = 0

" Neomake
" run on every buffer save
autocmd! BufWritePost *.rb Neomake
let g:neomake_ruby_enabled_makers = ['rubocop']
" let g:neomake_python_enabled_markers = []


" Rails / ruby
" :A & :R jump to Alternate and Related files see: rails-alternate

let ruby_minlines = 500
let ruby_operators = 1
let ruby_space_errors = 1
let ruby_fold = 1
let ruby_no_comment_fold = 1

" Neoterm
let g:neoterm_size = 80
let g:neoterm_position = 'vertical'
let g:neoterm_autoscroll = 1
command! -nargs=+ TT Topen | Ts

" Completion: Using deoplete.
let g:deoplete#sources = {}
let g:deoplete#sources.python = ['buffer', 'tag' , 'member', 'omni']
let g:deoplete#sources.ruby = ['buffer', 'tag'] ", 'member', 'omni']
let g:deoplete#auto_completion_start_length = 5
let g:deoplete#max_list = 50
let g:deoplete#enable_at_startup = 1

" Ultisnips
let g:UltiSnipsSnippetsDir='/home/seth/.config/nvim/snippets/'

" Ack.vim: use ag, the silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Universal Ctags rspec support
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }
