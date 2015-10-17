" ln -sf ~/Dropbox/vim-settings/.vimrc ~/.vimrc

" VUNDLE {{{
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" }}}

" BUNDLES LIST {{{
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'lucapette/vim-ruby-doc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'sjl/gundo.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'unblevable/quick-scope'
Plugin 'elixir-lang/vim-elixir'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 80 symbols
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:ruby_doc_command='open'
let g:qs_highlight_on_keys = ['f', 'F']

" EASY TAGS OPTIONS {{{
"
" example:
" :UpdateTags -R ~/Projects/music_at_menlo/
let g:easytags_file = '~/.vim/tags'
let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_auto_highlight = 0
" }}}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


" GUI OPTIONS {{{
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guifont=Menlo\ for\ Powerline:h14
endif
" }}}

" GENERAL OPTIONS {{{
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
filetype plugin indent on

syntax enable
set shell=/bin/bash
set splitbelow
set splitright
set undofile
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set t_Co=256
set background=dark
colorscheme railscasts
set scrolljump=5
set scrolloff=3
syntax on
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
    au filetype sh,csh,tcsh,zsh           setlocal ts=4 sts=4 sw=4 et
    au filetype php,javascript,css        setlocal ts=2 sts=2 sw=2 et tw=80
    au filetype ruby,eruby,yaml           setlocal ts=2 sts=2 sw=2 et
    au filetype text,txt,markdown,pandoc  setlocal ts=4 sts=4 sw=4 et tw=80
    au filetype html,xhtml,xml            setlocal ts=4 sts=4 sw=4 et
    au filetype slim                      setlocal ts=2 sts=2 sw=2 et
    au filetype vim                       setlocal ts=4 sts=4 sw=4 et
    au filetype coffee                    setlocal ts=2 sts=2 sw=2 et
    au filetype cucumber                  setlocal ts=2 sts=2 sw=2 et
augroup END
" }}}

" OMNI COMPLITIONS dictionary {{{
set complete=""
set complete+=. " from bufer
set complete+=k " from dictionary
set complete+=b " from open buffers
set complete+=t " from tags
" }}}

" SYNTAX HIGHLIGHT {{{
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
set completeopt=longest,menuone
" }}}

" REMOVE TRAILING SPACES {{{
autocmd BufWritePre * :%s/\s\+$//e
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
let g:NERDTreeWinSize=35
let NERDTreeChDirMode=2
" }}}

" AIRLINE SETTINGS {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
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
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|tmp)$',
  \ 'file': '\v\.(exe|so|dll|log|jpeg|jpg|svg|png)$',
  \ }
" }}}


function! VAckSearch()
    norm! gv"sy
    return ':Ack "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
    return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

" MAPPING {{{
map <F1> <nop>
nnoremap ; :
nmap <F2> :NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
imap <F3> <Esc>:TagbarToggle<CR>
nmap <F4> :GundoToggle<CR>
imap <F4> <Esc>:GundoToggle<CR>
nmap <leader><F2> :NERDTreeFind<CR>
imap <leader><F2> <Esc>:NERDTreeFind<CR>
nmap <C-c> <plug>NERDCommenterToggle
vmap <C-c> <plug>NERDCommenterToggle
map <Leader>R :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
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
map <C-PageUp> :bprevious<CR>
map <C-PageDown> :bnext<CR>

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
