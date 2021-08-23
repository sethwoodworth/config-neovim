set termguicolors

call plug#begin('~/.config/nvim/plugged')
Plug 'NLKNguyen/papercolor-theme'  " colorscheme
Plug 'savq/melange' " treesitter supporting colorscheme
Plug 'itchyny/lightline.vim' " lightweight fancy statusline

Plug 'dietsche/vim-lastplace' " reopen a file the last place we were

" Git plugins
Plug 'tpope/vim-fugitive' " git integration

" Test running plugins
Plug 'janko-m/vim-test', {'for' : ['python', 'ruby']} " runs tests
"Plug 'neomake/neomake' " async linter and highlighter

Plug 'nathanaelkane/vim-indent-guides' " highlight indent level

" Syntax plugins
Plug 'kovetskiy/vim-bash', {'for' : 'bash'}
Plug 'vim-python/python-syntax'
Plug 'mitsuhiko/vim-python-combined' " improved python syntax

" Screen division navigation plugins
Plug 'knubie/vim-kitty-navigator'

Plug 'SirVer/ultisnips', {'for' : 'python'} " snippets
Plug 'honza/vim-snippets', {'for' : 'python'} " snippets
Plug 'jeetsukumaran/vim-pythonsense', {'for' : 'python'} " python smart motion objects
Plug 'lepture/vim-jinja'

Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf/', 'do': './install --all' } " fuzzy file search
Plug 'junegunn/fzf.vim'


Plug 'preservim/tagbar' , {'on': 'TagbarToggle'} " a module map

Plug 'tpope/vim-commentary' " idiomatic line comment toggling vim syntax
Plug 'tpope/vim-repeat' " repeat tpope vim syntax extensions
Plug 'tpope/vim-surround' " idiomatic matching surrounding character vim syntax
Plug 'tpope/vim-vinegar' " better vim file browser

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Plug 'psf/black', { 'branch': 'stable' }

Plug 'hashivim/vim-terraform', {'for': 'terraform'}

" Markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" lsp
Plug 'neovim/nvim-lspconfig'

" lsp completion
Plug 'hrsh7th/nvim-compe'

call plug#end()

" Colorscheme
set background=light
" let g:PaperColor_Theme_Options = {
"   \   'language': {
"   \     'python': {
"   \       'highlight_builtins' : 1
"   \     }
"   \   }
"   \ }
" colorscheme PaperColor
" let g:lightline = { 'colorscheme': 'PaperColor' }
colorscheme melange

" Visual behavior
set updatetime=300
set signcolumn=number
set foldlevelstart=99 " show all folds
set list listchars=tab:·\ ,trail:␣,nbsp:∝ " show whitespace and tabs as unicode
set noshowmode " handled by statusline
set number " show linenumbers
" set noautoindent " don't indent for me
set showmatch matchtime=2 " show matching brackets
set splitbelow " open vertical splits below the current pane
set splitright " open horizontal splits right of the current pane
set ttimeoutlen=10 " timeout to wait for followup keycodes
set visualbell " use visual bell instead of beeping
set wildmode=list:longest " when more than one match, list, match longest string
set completeopt=noinsert,menuone,noselect

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
" `C-h,j,k,l` switch pane focus
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_
nnoremap Y y$

nnoremap <C-p> :FZF<CR>
nnoremap <C-t> :Tags<CR>
" `<F10>` shows syntax highlighting group under cursor
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" `<ESC>` switches to Normal mode in terminal
tnoremap <ESC> <C-\><C-n>

" Insert mode binding
" `<F1>` sends `<ESC>`
inoremap <F1> <ESC>
inoremap <c-c> <ESC>
" Command mode binding
" `:w!!` saves file as root
cmap w!! w !sudo tee %

" Leader bindings
" <space> as leader, shown here as <l>
let mapleader = " "
" `<l>2` send line or selection to terminal
" vnoremap <Leader>2 :TREPLSendSelection
" nnoremap <Leader>2 :TREPLSendLine
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
nnoremap <leader>bb ibreakpoint()<esc>
" `<l>c` vim-test run nearest test to cursor
nnoremap <leader>c :TestNearest<CR>
nnoremap <leader>cc :TestFile<CR>
" `<l>ev` open vim config for editing in vertical split
nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>
" `<l>ii` toggle vim-indent-guides
nnoremap <leader>ii :IndentGuidesToggle<CR>
" `<l>l` show location list, usually populated with syntax checkers
"nnoremap <leader>l :lwindow<cr>
" MOVED to lsp
" `<l>p` toggle paste mode
nnoremap <leader>p :set paste!<CR>
" `<l>r` fold less (reduce)
" nnoremap <leader>r zr
" `<l>t` toggle Tagbar
nnoremap <leader>t :TagbarToggle<CR>
" `<l>tt` new tabl
nnoremap <leader>tt :tabe<CR>
" `<l>v` re-select previous paste
nnoremap <leader>v `[v`]
" `<l>w` create vertical split
nnoremap <leader>w <C-w>v

" Python language tab settings
augroup python
  autocmd Filetype python setlocal expandtab shiftwidth=4 softtabstop=4
  " set csprg=pycscope
augroup END
let g:python_highlight_all = 1

" Grep config
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Indent Guides
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

let g:python3_host_prog='/home/swoodworth/.local/venvs/nvim/bin/python3'

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

" Terraform
let g:terraform_fmt_on_save=1

" vim-markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2

lua << EOF
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end
local lspconfig = require('lspconfig')
lspconfig.pylsp.setup{
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = true },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        flake8 = { enabled = false },
        yapf = { enabled = false }
      }
    }
  }
}
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    tags = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = true;
    luasnip = false;
  };
}
EOF

"

" allow folder specific .vimrc files
set exrc
set secure
