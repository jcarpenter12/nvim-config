" Plugins will be downloaded under the specified directory.
call plug#begin() " Navigation
Plug 'scrooloose/nerdtree'

" Nerdtree path copy
Plug 'mortonfox/nerdtree-clip'

" UI related Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'luochen1990/rainbow'

" Better Visual Guide
" Plug 'Yggdroot/indentLine'
Plug 'junegunn/seoul256.vim'

" Python highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Linting
" Plug 'w0rp/ale'

" Autocomplete
" Plug 'davidhalter/jedi-vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'jiangmiao/auto-pairs'
" Plug 'Shougo/neopairs.vim'

" " Multi cursors
" Plug 'terryma/vim-multiple-cursors'

" Snippets
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Comments
Plug 'tpope/vim-commentary'

" Go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Terraform
Plug 'hashivim/vim-terraform'

" Jupyter Notebook
" Plug 'jupyter-vim/jupyter-vim'

" Telescope fuzzy search
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Surround parentheses
Plug 'tpope/vim-surround'

" README preview
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Git Blame
Plug 'APZelos/blamer.nvim'

" Terraform
"
" Plug 'vim-syntastic/syntastic'
" Plug 'juliosueiras/vim-terraform-completion'
"
" coc autocomplete
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}  
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}  
" Plug 'neoclide/coc-jedi', {'do': 'yarn install --frozen-lockfile'}  

call plug#end()

filetype plugin indent on

set encoding=utf-8
syntax on
silent! color seoul256
set background=dark
set list
set listchars=space:.
set cursorline
set autochdir
set nu
set clipboard+=unnamedplus
set spelllang=en
set spellsuggest=best,9

" Spell suggest
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.*
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set omnifunc=htmlcomplete#CompleteTags

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
autocmd BufRead,BufNewFile *.tf set filetype=terraform

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred

" python neovim venv
let g:python3_host_prog="~/venvs/neovim/bin/python"

let g:mapleader = ' '

" Escape remap for interactive and terminal
inoremap jh <Esc>
tnoremap jh  <C-\><C-n>

" Clear search highlighting on enter
nnoremap <CR> :noh<CR><CR>

" Clipboard mappings
vnoremap <Leader>y "+y
noremap <Leader>y "+y
noremap <Leader>Y "+yg_
noremap <Leader>yy "+yy
noremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Auto reload vim conf
nnoremap <Leader>vr :source $MYVIMRC<CR>

" terminal cmds
nnoremap <Leader>T :split term://zsh<CR>
nnoremap <Leader>t :tabnew <bar> term<CR>

" Esc
" nnoremap jh  <C-\><C-n>

" Delete mappings
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier','eslint'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'go': ['gofmt', 'goimports'],
\   'json':['prettier'],
\   'yaml':['prettier'],
\   'yml':['prettier'],
\}

" Add below for sql formatting disabled due to jinja template conflict
" \   'sql':['pgformatter'],

let g:ale_linters = {
             \ 'go': ['golint'],
             \ 'json':['jsonlint'],
             \ 'sql': ['sqllint'],
             \ 'yaml':['yamllint'],
             \ 'yml':['yamllint'],
             \}

let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
let b:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 2 --spaces 2'

" Toggle fixer
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" jedi
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#show_call_signatures = 0
" let g:deoplete#sources#jedi#show_docstring = 1
" let g:jedi#use_tabs_not_buffers = 1
" " deoplete let g:deoplete#enable_at_startup = 1 call deoplete#custom#source('_', 'converters',
" 		\ ['converter_auto_paren'])
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" ultisnips
" let g:UltiSnipsExpandTrigger = "<C-j>"

" multi cursors
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_start_key='<F5>'
" let g:multi_cursor_next_key='<C-x>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-k>'
" let g:multi_cursor_quit_key='<Esc>'

" nerdtree
map <C-n> :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Rainbow parentheses
" let g:rainbow_active = 1

" clipboard
set clipboard+=unnamedplus

" go settings
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_hightlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_addtags_transform = "camelcase"
let g:go_gocode_propose_source = 1
autocmd BufWritePost *.go silent! GoBuild -i

" Git Blamer Settings
let g:blamer_enabled = 1
let g:blamer_template = '<commit-short>, <committer>, <committer-time> • <summary>'

" Shift lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Warning messages
set statusline^=%{coc#status()}

" Terraform https://github.com/juliosueiras/vim-terraform-completion
" Syntastic Config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" " (Optional)Remove Info(Preview) window
" set completeopt-=preview

" " (Optional)Hide Info(Preview) window after completions
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" " (Optional) Enable terraform plan to be include in filter
" let g:syntastic_terraform_tffilter_plan = 1

" " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
" let g:terraform_completion_keys = 1

" " (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
" let g:terraform_registry_module_completion = 0

" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
" let g:deoplete#enable_at_startup = 1
" call deoplete#initialize()
"

""""""""""""""
" CoC Config
""""""""""""""
let g:coc_default_semantic_highlight_groups = 1
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" <Tab>: completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" <S-Tab>: completion back
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"
" <CR>: confirm completion, or insert <CR>
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
