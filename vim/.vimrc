" ln -sf ~/Dropbox/vim-settings/.vimrc ~/.vimrc
set rtp+=/usr/local/opt/fzf

" Install vim-plug for new VIM
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'gcmt/wildfire.vim'
" Plug 'slim-template/vim-slim'
call plug#end()

if has('gui_running')
    colorscheme hybrid
    highlight Comment gui=italic
    set background=dark
    set guifont=Monaco\ for\ Powerline:h16
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set clipboard=unnamed
    set mouse=a
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
else
    set background=dark
    colorscheme hybrid
endif

let g:rails_ctags_arguments = ['--languages=Ruby']

" ALE {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" }}}

" RSPEC {{{
let g:rspec_runner = "os_x_iterm2"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" }}}

" GENERAL OPTIONS {{{
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

syntax enable
set splitbelow
set splitright
set undofile
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set t_Co=256
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
    au filetype html,xhtml,xml,html.handlebars setlocal ts=2 sts=2 sw=2 et
    au filetype html.mustache                  setlocal ts=2 sts=2 sw=2 et
    au filetype slim                           setlocal ts=2 sts=2 sw=2 et
    au filetype vim                            setlocal ts=4 sts=4 sw=4 et
    au filetype coffee                         setlocal ts=2 sts=2 sw=2 et
    au filetype cucumber                       setlocal ts=2 sts=2 sw=2 et
    au filetype json                           setlocal ts=2 sts=2 sw=2 et
    au filetype vue                            setlocal ts=2 sts=2 sw=2 et
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
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
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
let NERDTreeHighlightCursorline = 0
" }}}

" FZF {{{
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Go to tag under cursor
nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}

" Ag SETTINGS {{{
function! AgSearch()
    norm! gv"sy
    return ':Ag '. @s
endfunction
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
nmap <F1> <nop>
nmap Q <Nop>
nnoremap <silent> <F1> :Buffer<CR>

nnoremap <C-c> <silent> <C-c>
nmap <F2> :NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>
nmap <leader><F2> :NERDTreeFind<CR>
imap <leader><F2> <Esc>:NERDTreeFind<CR>
nmap <F5> :ToggleGStatus<CR>
nmap <F6> :GFiles?<CR>
nmap <C-p> :Files<CR>
nmap <tab> <C-W>w
cmap w!! %!sudo tee > /dev/null %
vnoremap < <gv
vnoremap > >gv
vnoremap <C-]> :<C-u>exec AgSearch()<CR>
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
