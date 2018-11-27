if $TERM == "screen-256color"
  set termguicolors
end

call plug#begin('~/.config/nvim/plugged')
" Plug 'craigemery/vim-autotag'
" Plug 'klen/python-mode', {'for' : 'python'}
Plug 'MarcWeber/vim-addon-mw-utils' " required lib
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete async
Plug 'SirVer/ultisnips' " snippets
Plug 'airblade/vim-gitgutter', {'on' : 'GitGutterToggle'} " highlights git line status
Plug 'alfredodeza/coveragepy.vim', {'for' : 'python'} " highlights code coverage
Plug 'bling/vim-airline' " fancy statusline
Plug 'christoomey/vim-tmux-navigator' " C-h,j,k,l navigation between tmux and vim
Plug 'dietsche/vim-lastplace' " reopen a file the last place we were
Plug 'fatih/vim-hclfmt'
Plug 'fidian/hexmode' " view/edit binary as hex
Plug 'fishbullet/deoplete-ruby', {'for' : 'ruby'} " autocomplete for ruby
Plug 'honza/vim-snippets' " snippets
Plug 'janko-m/vim-test', {'for' : ['python', 'ruby']} " runs tests
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy file search
Plug 'junegunn/fzf.vim' " fuzzy file search
Plug 'junegunn/vader.vim' " test vimscript
Plug 'kassio/neoterm' " terminal in neovim
Plug 'kovetskiy/vim-bash'
Plug 'majutsushi/tagbar' , {'on': 'TagbarToggle'} " a module map
Plug 'mitsuhiko/vim-python-combined' " improved python syntax
Plug 'morhetz/gruvbox' " colorscheme
Plug 'nathanaelkane/vim-indent-guides' " highlight indent level
Plug 'neomake/neomake' " async linter and highlighter
Plug 'tomtom/tlib_vim', {'for' : ['python', 'ruby', 'html', 'css']} " library FIXME: document what requires
Plug 'tpope/vim-commentary' " idiomatic line comment toggling vim syntax
Plug 'tpope/vim-endwise' " better xml tag support
Plug 'tpope/vim-fugitive' " git integration
Plug 'tpope/vim-rails', {'for' : 'ruby'} " rails
Plug 'tpope/vim-repeat' " repeat tpope vim syntax extensions
Plug 'tpope/vim-surround' " idiomatic matching surrounding character vim syntax
Plug 'tpope/vim-unimpaired' " pairs of extra key bindings
Plug 'tpope/vim-vinegar' " better vim file browser
Plug 'vim-scripts/AutoTag', {'on': 'TagbarToggle'} " auto update local tags file
Plug 'vim-python/python-syntax'
Plug 'chrisbra/NrrwRgn'
Plug 'dbsr/vimpy'

Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
call plug#end()

" Colorscheme
set background=dark
let g:gruvbox_italic = 1
colorscheme gruvbox

" Visual behavior
set foldlevelstart=99 " show all folds
set list listchars=tab:·\ ,trail:≁,nbsp:∝ " show whitespace and tabs as unicode
set number " show linenumbers
" set noautoindent " don't indent for me
set showmatch matchtime=2 " show matching brackets
set splitbelow " open vertical splits below the current pane
set splitright " open horizontal splits right of the current pane
set ttimeoutlen=10 " timeout to wait for followup keycodes
set visualbell " use visual bell instead of beeping
set wildmode=list:longest " when more than one match, list, match longest string

" Tabs
set expandtab shiftwidth=2 softtabstop=2
set textwidth=100

" Search
set ignorecase " you MUST set this to get smart case search
set smartcase  " Together this means that searches are
               " case insensitive until you specify a capital
" no magic
nnoremap / /\M
vnoremap / /\M

" Normal mode bindings
" `H` moves to first non-whitespace character on a line
" `L` moves to the last non-blank character of the line
" `Y` yanks from cursor to end of line
nnoremap H ^
nnoremap L g_
nnoremap Y y$
vnoremap H ^
vnoremap L g_

" `C-h,j,k,l` switch pane focus
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" `C-p` runs FZF fuzzy file searcher
nnoremap <C-p> :FZF<CR>
" `<F10>` shows syntax highlighting group under cursor
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Terminal mode bindings
" Allow switching from vim terminals
tnoremap <C-h> <C-\><C-n>h
tnoremap <C-j> <C-\><C-n>j
tnoremap <C-k> <C-\><C-n>k
tnoremap <C-l> <C-\><C-n>l
" `<ESC>` switches to Normal mode in terminal
tnoremap <ESC> <C-\><C-n>

" Insert mode binding
" `<F1>` sends `<ESC>`
inoremap <F1> <ESC>
" Command mode binding
" `:w!!` saves file as root
cmap w!! w !sudo tee %


" Leader bindings
" <space> as leader, shown here as <l>
"
let mapleader = " "
" `<l>2` send line or selection to terminal
vnoremap <Leader>2 :TREPLSendSelection
nnoremap <Leader>2 :TREPLSendLine
" `<l>"'` switch " for '
nnoremap <leader>"' :s/\"/\'/g <cr> :nohls <cr>
" `<l>'"` switch ' for "
nnoremap <leader>'" :s/\'/\"/g <cr> :nohls <cr>
" `<l><l>` clear search highlighting
nnoremap <leader><leader> :nohls<CR>
" grep for word under cursor
nnoremap <leader>G :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" `<l>H` convert selection ruby hashes to hash rockets (incomplete)
nnoremap <leader>H :'<,'>s/:\(\w\+\)\s\+=>\s\+/\1: /g<CR>
" `<l>L` close location list
nnoremap <leader>L :lclose<CR>
" `<l>M` close all folds
nnoremap <leader>M zM
" `<l>R` open all folds
nnoremap <leader>R zR
" `<l>T` open Tagbar, close on selection
nnoremap <leader>T :TagbarOpenAutoClose<CR>
" `<l>W` strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" `<l>b` insert an IPython embed as breakpoint
nnoremap <leader>b i__import__('IPython').embed()<esc>
" `<l>c` vim-test run nearest test to cursor
nnoremap <leader>c :TestNearest<CR>
" `<l>ev` open vim config for editing in vertical split
nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>
" `<l>f` vim-test run file as tests
nnoremap <leader>f :TestFile<CR>
" `<l>g` toggle git status gutter
nnoremap <leader>g :GitGutterToggle<CR>
" `<l>h` convert all ruby hashes to hash rockets (incomplete)
nnoremap <leader>h :s/:\(\w\+\)\s\+=>\s\+/\1: /g<CR>
" `<l>ii` toggle vim-indent-guides
nnoremap <leader>ii :IndentGuidesToggle<CR>
" `<l>l` show location list, usually populated with syntax checkers
nnoremap <leader>l :lwindow<cr>
" `<l>m` fold more (increase)
nnoremap <leader>m zm
" `<l>p` toggle paste mode
nnoremap <leader>p :set paste!<CR>
" `<l>r` fold less (reduce)
nnoremap <leader>r zr
" `<l>s` toggle show coverage
nnoremap <leader>s :Coveragepy show<CR>
" `<l>t` toggle Tagbar
nnoremap <leader>t :TagbarToggle<CR>
" `<l>v` re-select previous paste
nnoremap <leader>v `[v`]
" `<l>w` create vertical split
nnoremap <leader>w <C-w>v

" Python language tab settings
augroup python
  autocmd Filetype python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END
let g:python_highlight_all = 1

" Grep config
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" vim-airline
function! NeotermStatus()
  if exists("g:neoterm_statusline")
    return g:neoterm_statusline
  endif
endfunc

function! AirlineInit()
  call airline#parts#define_function('neoterm', 'NeotermStatus')
  let g:airline_section_warning = airline#section#create_right(['whitespace', 'neoterm'])
endfunction

" Python-mode settings
" FIXME: cleanup or remove
" let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/home/swoodworth/.local/share/virtualenvs/nvim-V95aoDmf/bin/python'
let g:python_host_prog='/home/swoodworth/.local/share/virtualenvs/neovim-P0pe4FPa/bin/python'
let g:pymode_folding = 0
" vaC, vaM -- select class, method
" <leader>b insert breakpoint
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX: breakpoint'
let g:pymode_complete_on_dot = 0
let g:pymode_lint_ignore = "E501,E221,E302,E701"
let g:pymode_virtualenv = 0

" FZF
" CTRL-T open in new tab
" CTRL-X open in horizontal split
" CTRL-V open in vertical split
let g:fzf_buffers_jump = 0

" Git gutter
" ]c - next change, [c - prev change
" <leader>hs - stage hunk
" <leader>hs - stage hunk
let g:gitgutter_enabled = 0

" Neomake
autocmd! BufWritePost *.py Neomake pylint
autocmd! BufWritePost *.rb Neomake
let g:neomake_python_enabled_markers = ['pylint', 'mypy']
let g:neomake_ruby_enabled_makers = ['rubocop']


" Vim-rails
" :A & :R jump to Alternate and Related files see: rails-alternate
let ruby_fold = 1
let ruby_minlines = 500
let ruby_no_comment_fold = 1
let ruby_operators = 1
let ruby_space_errors = 1

" Neoterm
let g:neoterm_size = 80
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_autoscroll = 1
" command! -nargs=+ TT Topen | Ts
let g:neoterm_repl_python = 'ipython --no-autoindent --simple-prompt'

" Deoplete
let g:deoplete#sources = {}
let g:deoplete#sources.python = ['ultisnips' , 'buffer', 'tag' , 'member', 'omni']
let g:deoplete#sources.ruby = ['buffer', 'tag'] ", 'member', 'omni']
let g:deoplete#auto_completion_start_length = 3
let g:deoplete#max_list = 50
let g:deoplete#enable_at_startup = 1

" Ultisnips
let g:UltiSnipsSnippetsDir='/home/seth/.config/nvim/snippets/'

" Tagbar
let g:tagbar_show_visibility = 1
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

" Vim-test configuration
let test#strategy = 'neoterm'
let test#python#runner = 'pytest'

" Vim-lsp python
if executable('pyls')
  au user lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif


" allow folder specific .vimrc files
set exrc
set secure
