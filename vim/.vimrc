" ln -sf ~/Dropbox/vim-settings/.vimrc ~/.vimrc

" VUNDLE {{{
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" }}}

" BUNDLES LIST {{{
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'Shougo/vimfiler.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'majutsushi/tagbar'
Plugin 'lucapette/vim-ruby-doc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'sjl/gundo.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
"Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'unblevable/quick-scope'
" Plugin 'elixir-lang/vim-elixir'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Shougo/unite.vim'
Plugin 'heartsentwined/vim-emblem'
" Plugin 'ngmy/vim-rubocop'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has('gui_running')
    " colorscheme Tomorrow-Night
    colorscheme railscasts2
    set background=dark
    set guifont=Ubuntu\ Mono\ 17
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
else
    set background=dark
    colorscheme railscasts2
    " colorscheme Tomorrow-Night
endif


" let g:loaded_netrwPlugin = 1
" let g:vimfiler_directory_display_top = 1
" " let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_tree_leaf_icon = ''
" let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_default_columns = ''
" " let g:vimfiler_explorer_columns = ''

" call vimfiler#custom#profile('default', 'context', {
"             \ 'safe' : 0,
"             \ })

" EASY TAGS OPTIONS {{{
"
" example:
" :UpdateTags -R ~/Projects/music_at_menlo/
let g:easytags_file = '~/.vim/tags'
let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_auto_highlight = 0
" }}}

let g:ruby_debugger_debug_mode = 1


" UNITE {{{
let g:unite_source_buffer_time_format = ""
let g:unite_winheight = 15
call unite#custom#profile('buffers', 'context', {'ignorecase': 1})
call unite#filters#sorter_default#use(['sorter_word'])
" }}}

" SYNTASTIC {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" }}}

" GENERAL OPTIONS {{{
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

syntax enable
set cursorline
set splitbelow
set splitright
set undofile
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set t_Co=256
"set background=dark
"colorscheme railscasts
set scrolljump=5
set scrolloff=3
set bs=2
set viewoptions=folds
set nocompatible
set nowrap
set nu
set laststatus=2
set autoindent
set wildmenu
set whichwrap=<,>,[,],h,l
set hlsearch
set incsearch
"set ignorecase
"set nobackup
"set nowritebackup
"set noswapfile

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" }}}

" TAB SETTINGS {{{
augroup tab_settings
    au!
    au filetype sh,csh,tcsh,zsh                setlocal ts=4 sts=4 sw=4 et
    au filetype php,javascript,css             setlocal ts=2 sts=2 sw=2 et tw=80
    au filetype ruby,eruby,yaml                setlocal ts=2 sts=2 sw=2 et
    au filetype text,txt,markdown,pandoc       setlocal ts=4 sts=4 sw=4 et tw=80
    au filetype html,xhtml,xml,html.handlebars setlocal ts=4 sts=4 sw=4 et
    au filetype html.mustache                  setlocal ts=4 sts=4 sw=4 et
    au filetype slim                           setlocal ts=2 sts=2 sw=2 et
    au filetype vim                            setlocal ts=4 sts=4 sw=4 et
    au filetype coffee                         setlocal ts=2 sts=2 sw=2 et
    au filetype cucumber                       setlocal ts=2 sts=2 sw=2 et
augroup END
" }}}

" OMNI COMPLETIONS dictionary {{{
set complete=""
set complete+=. " from bufer
set complete+=k " from dictionary
set complete+=b " from open buffers
set complete+=t " from tags
" }}}

" SYNTAX HIGHLIGHT {{{
au BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache
au BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars
au BufNewFile,BufRead *.embl set filetype=html.emblem
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.html.erb set filetype=html
au BufNewFile,BufRead *.rb set filetype=ruby
au BufNewFile,BufRead *.hamlc set filetype=haml
au BufNewFile,BufRead *.html.slim set filetype=slim
au BufNewFile,BufRead *.html set filetype=html.javascript
au BufRead,BufNewFile *.styl set filetype=css
au BufRead,BufNewFile *.eco set filetype=html
au BufRead,BufNewFile *.styl set syntax=stylus
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.scss set syntax=scss
au BufRead,BufNewFile *.sass set filetype=css
au BufRead,BufNewFile *.sass set syntax=sass
au BufRead,BufNewFile *.less set filetype=css
au BufRead,BufNewFile *.less set syntax=less
au BufNewFile,BufReadPost *.json set filetype=json
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufWrite *.rb set filetype=ruby
" }}}

" OMNI COMPLITION on {{{
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,eco set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
autocmd FileType stylus set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

set completeopt=longest,menuone
" }}}

" REMOVE TRAILING SPACES {{{
autocmd BufWritePre * :%s/\s\+$//e
" }}}
"
" 80 SYMBOLS LINE {{{
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" }}}

" RUBYDOC {{{
"let g:ruby_doc_command='open'
let g:qs_highlight_on_keys = ['f', 'F']
" }}}

" NERDTree SETTINGS {{{
let NERDTreeShowLineNumbers=1
let g:Tlist_Show_One_File = 1
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = [
            \'\.DS_Store$',
            \'\.bundle$','\.git$'
            \]
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksFile=expand("$HOME/.vim/.NERDTreeBookmarks")
let g:NERDTreeWinSize=40
let NERDTreeChDirMode=2
" }}}

" AIRLINE SETTINGS {{{
" let g:airline_theme = "tomorrow"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" }}}

" CTRL-P SETTINGS {{{
let g:ctrlp_buffer_func = { 'enter': 'CtrlPMappings' }
let g:ctrlp_match_window = 'top,order:btt,min:1,max:15,results:15'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|tmp|forum|log|public|bundle)$',
  \ 'file': '\v\.(exe|so|dll|log|jpeg|jpg|svg|png)$',
  \ }
" }}}

" ACK SETTINGS {{{
function! VAckSearch()
    norm! gv"sy
    return ':Ack "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
    return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

let g:ack_default_options = ' -s -H --nocolor --nogroup --column'
let g:ackhighlight = 1
" }}}

" FUGITIVE {{{
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()
" }}}

" MAPPING {{{

nnoremap ; :
nmap Q <Nop>
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
nnoremap <silent> <F1> :Unite buffer:- -toggle<CR>
nnoremap <C-c> <silent> <C-c>
nmap <F2> :NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>
nmap <leader><F2> :NERDTreeFind<CR>
imap <leader><F2> <Esc>:NERDTreeFind<CR>
nmap <F3> :TagbarToggle<CR>
imap <F3> <Esc>:TagbarToggle<CR>
nmap <F4> :GundoToggle<CR>
imap <F4> <Esc>:GundoToggle<CR>
nmap <F5> :ToggleGStatus<CR>
nmap  <Space> <Plug>(easymotion-s)
vmap  <Space> <Plug>(easymotion-s)
nmap <tab> <C-W>w
cmap w!! %!sudo tee > /dev/null %
vnoremap < <gv
vnoremap > >gv
vnoremap <C-]> :<C-u>exec VAckSearch()<CR>
vmap s' "zdi'<C-R>z'<ESC>
vmap s" "zdi"<C-R>z"<ESC>
vmap s( "zdi(<C-R>z)<ESC>
vmap s[ "zdi[<C-R>z]<ESC>
vmap s{ "zdi{<C-R>z}<ESC>

" bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

command W w
command Q q
command Qal qal

highlight Comment gui=italic
