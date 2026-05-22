unmap <Space>

"" Text
set tabstop=4
set clipboard=unnamedplus

"" Mappings
nnoremap j gj
nnoremap k gk
nnoremap Q @@
nnoremap H ^
nnoremap L $

nnoremap <Space>n :noh<CR>
nnoremap <C-CR> o<Esc>k

vnoremap H ^
vnoremap L $

inoremap jj <Esc>

"" jscommands
exmap moveLineUp jsfile .obsidian/vim_javascript/moveLineUp.js
nmap <Up> :moveLineUp<CR>
exmap moveLineDown jsfile .obsidian/vim_javascript/moveLineDown.js
nmap <Down> :moveLineDown<CR>

exmap openTerminal jsfile .obsidian/vim_javascript/openTerminal.js
nmap <Space>ob :openTerminal<CR>

exmap goToLink jsfile .obsidian/vim_javascript/goToLink.js
nmap gt :goToLink<CR>
"" exmap goToLink obcommand editor:follow-link
"" nmap gt :goToLink<CR>


"" Remap obsidian commands
exmap back obcommand app:go-back
nnoremap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nnoremap <C-i> :forward<CR>

exmap togglefold obcommand editor:toggle-fold
nnoremap zf :togglefold<CR>

exmap tabnext obcommand workspace:next-tab
nmap <Space>l :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap <Space>h :tabprev<CR>
exmap newTab obcommand workspace:new-tab
nmap <Space>sv :newTab<CR>
exmap closeTab obcommand workspace:close
nmap <Space>q :closeTab<CR>

exmap fileSearch obcommand global-search:open
nmap <Space>tf :fileSearch<CR>
exmap revealCurrentFile obcommand file-explorer:reveal-active-file
nmap <Space>r :revealCurrentFile<CR>
