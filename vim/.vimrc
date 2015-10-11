set incsearch ignorecase smartcase hlsearch nocompatible
" Tim Pope's pathogen to manage plugins
execute pathogen#infect()
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red

" Turn on line numbering
set number
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

"Key mappings
let mapleader=','
noremap \ ,
inoremap jk <ESC>
" inoremap kj <ESC>
nnoremap ; :
nnoremap : ;
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" Easier window hopping
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>
" Auto expand the current path (Practical Vim page 95)
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
" DIY Hardmode
" nnoremap h <nop>
" nnoremap j <nop>
" nnoremap k <nop>
" nnoremap l <nop>

" Mute highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" Vertical diffs by default
set diffopt=filler,vertical
" Also, open the split window where it belongs
set splitbelow
set splitright
" Let's make it easier to search by the current visual selection
" * goes forward and # goes backward!
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
"
" & command isn't that helpful as it drops the flags you specified
" (from Practical Vim page 242)
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Git branches in a status line?
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %Pset statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" Keep some breathing lines around the cursorline when scrolling
set scrolloff=5
" I hate shift-k!
nnoremap K <nop>
" Also Q isn't that useful to me
nnoremap Q <nop>
" Ctlr-p by name
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Faster timeout for my crazy esc keys!
set timeoutlen=200
cnoremap dr! Dispatch! bundle exec rspec
cnoremap dr Dispatch bundle exec rspec
"============================================================================
"" Use arrow keys to navigate after a :vimgrep or :helpgrep
"============================================================================

nmap <silent> <RIGHT>         :cnext<CR>
nmap <silent> <RIGHT><RIGHT>  :cnfile<CR><C-G>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <LEFT><LEFT>    :cpfile<CR><C-G>
"============================================================================
" Make :help appear in a full-screen tab, instead of a window
"============================================================================

    "Only apply to .txt files...
    augroup HelpInTabs
        autocmd!
        autocmd BufEnter  *.txt   call HelpInNewTab()
    augroup END

    "Only apply to help files...
    function! HelpInNewTab ()
        if &buftype == 'help'
            "Convert the help window to a tab...
            execute "normal \<C-W>T"
        endif
    endfunction
