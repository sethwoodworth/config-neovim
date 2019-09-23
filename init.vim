if $TERM == "screen-256color"
  set termguicolors
end

call plug#begin('~/.config/nvim/plugged')
Plug 'dracula/vim'  " colorscheme
Plug 'NLKNguyen/papercolor-theme'  " colorscheme
"Plug 'bling/vim-airline' " fancy statusline
Plug 'itchyny/lightline.vim' " lightweight fancy statusline

Plug 'dietsche/vim-lastplace' " reopen a file the last place we were


Plug 'airblade/vim-gitgutter', {'on' : 'GitGutterToggle'} " highlights git line status
Plug 'nathanaelkane/vim-indent-guides' " highlight indent level

Plug 'janko-m/vim-test', {'for' : ['python', 'ruby']} " runs tests
Plug 'neomake/neomake' " async linter and highlighter


Plug 'kovetskiy/vim-bash', {'for' : 'bash'}

" Plug 'christoomey/vim-tmux-navigator' " C-h,j,k,l navigation between tmux and vim
Plug 'knubie/vim-kitty-navigator'
Plug 'jgdavey/tslime.vim'

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-syntax'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/float-preview.nvim'
Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }


Plug 'vim-python/python-syntax'
Plug 'mitsuhiko/vim-python-combined' " improved python syntax
Plug 'alfredodeza/coveragepy.vim', {'for' : 'python'} " highlights code coverage
Plug 'SirVer/ultisnips', {'for' : 'python'} " snippets
Plug 'honza/vim-snippets', {'for' : 'python'} " snippets
Plug 'jeetsukumaran/vim-pythonsense', {'for' : 'python'} " python smart motion objects
Plug 'lepture/vim-jinja'

Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf/', 'do': './install --all' } " fuzzy file search
Plug 'junegunn/fzf.vim'


Plug 'majutsushi/tagbar' , {'on': 'TagbarToggle'} " a module map
" Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-commentary' " idiomatic line comment toggling vim syntax
Plug 'tpope/vim-endwise' " better xml tag support
Plug 'tpope/vim-fugitive' " git integration
Plug 'tpope/vim-rails', {'for' : 'ruby'} " rails
Plug 'tpope/vim-repeat' " repeat tpope vim syntax extensions
Plug 'tpope/vim-surround' " idiomatic matching surrounding character vim syntax
" Plug 'tpope/vim-unimpaired' " pairs of extra key bindings
Plug 'tpope/vim-vinegar' " better vim file browser


Plug 'Shougo/vinarise.vim'

" Rust
Plug 'rust-lang/rust.vim'

" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
Plug 'dimbleby/black.vim'

" multi-column split scrolling
Plug 'jcorbin/vim-bindsplit'
" make buffer of highlighted region
Plug 'chrisbra/NrrwRgn'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'

Plug 'fatih/vim-hclfmt'

call plug#end()

" Colorscheme
set background=light
" colorscheme dracula
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
let g:lightline = { 'colorscheme': 'PaperColor' }

" Visual behavior
set foldlevelstart=99 " show all folds
set list listchars=tab:·\ ,trail:≁,nbsp:∝ " show whitespace and tabs as unicode
set noshowmode " handled by statusline
set number " show linenumbers
" set noautoindent " don't indent for me
set showmatch matchtime=2 " show matching brackets
set splitbelow " open vertical splits below the current pane
set splitright " open horizontal splits right of the current pane
set ttimeoutlen=10 " timeout to wait for followup keycodes
set visualbell " use visual bell instead of beeping
set wildmode=list:longest " when more than one match, list, match longest string

" set completeopt=menu,noselect
"set completeopt=menu,preview

" Tabs
set expandtab shiftwidth=2 softtabstop=2
" don't wrap text for me
set textwidth=0

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
" TODO implement in visual mode too
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_
nnoremap Y y$

" `C-h,j,k,l` switch pane focus
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" `C-p` runs FZF fuzzy file searcher
nnoremap <C-p> :FZF<CR>
nnoremap <C-t> :Tags<CR>
" `<F10>` shows syntax highlighting group under cursor
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Terminal mode bindings
" Allow switching from vim terminals
" tnoremap <C-h> <C-\><C-n>h
" tnoremap <C-j> <C-\><C-n>j
" tnoremap <C-k> <C-\><C-n>k
" tnoremap <C-l> <C-\><C-n>l
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
nmap <leader>B <Plug>BindsplitVsplit
nnoremap <leader>bs <Plug>BindsplitVsplit
" `<l>c` vim-test run nearest test to cursor
nnoremap <leader>c :TestNearest<CR>
nnoremap <leader>cc :TestFile<CR>
" `<l>ev` open vim config for editing in vertical split
nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>
" `<l>f` format python
nnoremap <leader>f :Black<CR>
" `<l>g` toggle git status gutter
nnoremap <leader>g :GitGutterToggle<CR>
" `<l>ii` toggle vim-indent-guides
nnoremap <leader>ii :IndentGuidesToggle<CR>
" `<l>l` show location list, usually populated with syntax checkers
nnoremap <leader>l :lwindow<cr>
" `<l>p` toggle paste mode
nnoremap <leader>p :set paste!<CR>
" `<l>r` fold less (reduce)
" nnoremap <leader>r zr
" `<l>s` toggle show coverage
nnoremap <leader>s :Coveragepy show<CR>
" `<l>t` toggle Tagbar
nnoremap <leader>t :TagbarToggle<CR>
" `<l>tt` new tabl
nnoremap <leader>tt :tabe<CR>
" `<l>v` re-select previous paste
nnoremap <leader>v `[v`]
" `<l>w` create vertical split
nnoremap <leader>w <C-w>v

" Send selection to tmux
vmap <leader>r <Plug>SendSelectionToTmux
nmap <leader>r <Plug>NormalModeSendToTmux
nmap <leader>st <Plug>SetTmuxVars

" Python language tab settings
augroup python
  autocmd Filetype python setlocal expandtab shiftwidth=4 softtabstop=4
  " set csprg=pycscope
augroup END
let g:python_highlight_all = 1

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
if filereadable("cscope.out")
  set cscopetag
  silent cs add cscope.out
endif

" Grep config
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Indent Guides
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

let g:python3_host_prog='/home/seth/.local/venvs/nvim/bin/python3'

" FZF
" CTRL-T open in new tab
" CTRL-X open in horizontal split
" CTRL-V open in vertical split
" let g:fzf_buffers_jump = 0
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" Git gutter
" ]c - next change, [c - prev change
" <leader>hs - stage hunk
" <leader>hs - stage hunk
let g:gitgutter_enabled = 0

" Neomake
" autocmd! BufWritePost *.py Neomake pylint
" autocmd! BufWritePost *.rb Neomake
let g:neomake_python_enabled_makers = ['pylint', 'mypy']
let g:neomake_ruby_enabled_makers = ['rubocop']
" let g:neomake_logfile = '/tmp/neomake.log'
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)
let g:neomake_error_sign = {'text': '🔥', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '🔔', 'texthl': 'NeomakeWarningSign'}

" python formatter
" One must install black inside the same virtualenv that hosts python3_host_prog
let g:black_virtualenv = '~/.local/venvs/nvim/'

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

" NCM2 autocompletion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

inoremap <c-c> <ESC>
" allows <enter> to escape completion menu
" All instances broken and insert
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

au TextChangedI * call ncm2#auto_trigger()
let g:float_preview#docked = 0

" Ultisnips
let g:UltiSnipsSnippetsDir='~/.config/nvim/snippets/'

" Tagbar
let g:tagbar_sort = 0
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
let g:tagbar_compact = 1

" Vim-test configuration
let test#strategy = 'kitty'
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'dotenv -f .env-test run venv/bin/pytest -svvx'
" let g:coveragepy_uncovered_sign = '⨴'
let g:coveragepy_uncovered_sign = '💔'

" Vim-lsp python
if executable('pyls')
  au user lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:bindsplit(...) abort
    if a:0
        let l:count=(a:1 - 1)
    else
        let l:count=1
    endif
    echom l:count
    let l:curwin=winnr()
    for i in range(1, l:count)
        vsplit
        setlocal noscrollbind
        execute "normal! z+"
        setlocal scrollbind
    endfor
    execute l:curwin . "wincmd w"
    setlocal scrollbind
endfunction
command! -nargs=? -bar Bindsplit call s:bindsplit(<args>)

" allow folder specific .vimrc files
set exrc
set secure
