set number
cd ~/
" スペース
set expandtab
set tabstop=2
set shiftwidth=2
" terminalモード離脱をescに、esc*2でターミナルでesc
tnoremap <ESC> <c-\><c-n><Plug>(esc)
nnoremap <Plug>(esc)<ESC> i<ESC>
" Space + ? 系
nnoremap <space>e <Cmd>Fern . -reveal=% -drawer<CR> 
nnoremap <space>t <Cmd>ToggleTerm<CR>
" 矢印禁止!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" 表示行で上下移動
nnoremap j gj
nnoremap k gk
" コピペ
nnoremap <C-S>V a<C-r>+<Esc>
inoremap <C-S>V <C-r>+
cnoremap <C-S>V <C-r>+

" ターミナルを開いたらに常にinsertモードに入る
autocmd  TermOpen  * :startinsert
