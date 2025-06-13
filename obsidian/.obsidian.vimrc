unmap <Space>

"" Text
set tabstop=4
set clipboard=unnamedplus

"" Mappings
nnoremap j gj
nnoremap k gk
nnoremap <Space>n :noh<CR>
nnoremap <C-CR> o<Esc>k

"" jscommands
exmap moveLineUp jsfile .obsidian/vim_javascript/moveLineUp.js
nmap <Up> :moveLineUp<CR>
exmap moveLineDown jsfile .obsidian/vim_javascript/moveLineDown.js
nmap <Down> :moveLineDown<CR>

exmap openTerminal jsfile .obsidian/vim_javascript/openTerminal.js
nmap <Space>ob :openTerminal<CR>

"" Remap obsidian commands
exmap back obcommand app:go-back
nnoremap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nnoremap <C-i> :forward<CR>

exmap togglefold obcommand editor:toggle-fold
nnoremap zf :togglefold<CR>

exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>

exmap fileSearch obcommand global-search:open
nmap <Space>tf :fileSearch<CR>
