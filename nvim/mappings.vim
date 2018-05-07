"remaps
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Search
noremap <A-f> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

tnoremap <ESC> <C-\><C-n>

nnoremap ö }
nnoremap Ö {

"mappings for spell check sanity
noremap <C-l>  [s
nnoremap <C-h> ]s 
nnoremap ü z= 

"navigate through windows with alt key and hjkl
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-H> <C-\><C-n><C-w>H
tnoremap <A-J> <C-\><C-n><C-w>J
tnoremap <A-K> <C-\><C-n><C-w>K
tnoremap <A-L> <C-\><C-N><C-w>L
nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L

noremap <F2> :TlistToggle<Enter>
noremap <F3> :NERDTreeToggle<Enter>
noremap <F4> :vsplit term://bash<Enter>


"Navigating with guides
inoremap <Space><Space> <Esc>/(<>)<Enter>"_c4l
inoremap <Space><Backspace> (<>)<Esc>/(<>)<Enter>"_c4l
vnoremap <Space><Space> <Esc>/(<>)<Enter>"_c4l
map <Space><Space> <Esc>/(<>)<Enter>"_c4l
inoremap ;gui (<>)

"mapping for ESC if capslock is not mapped to
"it through gui
inoremap jw <Esc>
inoremap wj <Esc>

"Spell-check set to F7
map <F7> :setlocal spell! spelllang=en_us<CR>
nnoremap <C-m> :w<CR>:make<CR>
nnoremap <C-s> :w<CR>



"Latex Mappings
autocmd FileType tex inoremap ,fr    \begin{frame}<Enter>\frametitle{}<Enter><Enter>(<>)<Enter><Enter>\end{frame}<Enter><Enter>(<>)<Esc>6kf}i
autocmd FileType tex inoremap ,fi    \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter>(<>)<Esc>3kA
autocmd FileType tex inoremap ,exe   \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter>(<>)<Esc>3kA
autocmd FileType tex inoremap ,em    \emph{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,bf    \textbf{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,it    \textit{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,ct    \cite[chapter (<>), p.~(<>)]{(<>)} (<>) <Esc>T[
autocmd FileType tex inoremap ,p     \citep{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,glos  {\gll<Space>(<>)<Space>\\<Enter>(<>)<Space>\\<Enter>\trans{``(<>)''}}<Esc>2k2bcw
autocmd FileType tex inoremap ,g     \gls{}(<>)<Esc>4hi
autocmd FileType tex inoremap ,gl    \glspl{}(<>)<Esc>4hi
autocmd FileType tex inoremap ,x     \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ,en    \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter>(<>)<Esc>3kA\item<Space>
autocmd FileType tex inoremap ,it    \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter>(<>)<Esc>3kA\item<Space>
autocmd FileType tex inoremap ,i     \item<Space>
autocmd FileType tex inoremap ,ref   \ref{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,t     \begin{tabular}<Enter>(<>)<Enter>\end{tabular}<Enter><Enter>(<>)<Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,tab   \begin{tableau}<Enter>\inp{(<>)}<Tab>\const{(<>)}<Tab>(<>)<Enter>(<>)<Enter>\end{tableau}<Enter><Enter>(<>)<Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ,can   \cand{}<Tab>(<>)<Esc>T{i
autocmd FileType tex inoremap ,con   \const{}<Tab>(<>)<Esc>T{i
autocmd FileType tex inoremap ,v     \vio{}<Tab>(<>)<Esc>T{i
autocmd FileType tex inoremap ,a     \href{}{(<>)}<Space>(<>)<Esc>2T{i
autocmd FileType tex inoremap ,sc    \textsc{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,sec   \section{%DELRN%}<Enter><BS>\label{sec_%DELRN%}<Enter>(<>)<Esc>2k:MultipleCursorsFind<Space>%DELRN%<Enter>c
autocmd FileType tex inoremap ,ssec  \subsection{%DELRN%}<Enter><BS>\label{ssec_%DELRN%}<Enter>(<>)<Esc>2k:MultipleCursorsFind<Space>%DELRN%<Enter>c
autocmd FileType tex inoremap ,sssec \subsubsection{%DELRN%}<Enter><BS>\label{sssec_%DELRN%}<Enter>(<>)<Esc>2k:MultipleCursorsFind<Space>%DELRN%<Enter>c
autocmd FileType tex inoremap ,st    <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,beg   \begin{%DELRN%}<ESC>o<BS>\end{%DELRN%}<ESC>O(<>)<ESC>jo<Enter>(<>)<Esc>4k:MultipleCursorsFind<Space>%DELRN%<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ,up    <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up    /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt    \texttt{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ,bt    {\blindtext}
autocmd FileType tex inoremap ,nu    $\varnothing$
autocmd FileType tex inoremap ,col   \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter>(<>)<Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,m     \begin{equation}<Return>(<>)<Return>\end{equation}<Esc>3k
"""END

autocmd FileType bib inoremap ,b @book{ <Enter>title<Space>=<Space>{(<>)}, <Enter>author<Space>=<Space>{(<>)}, <Enter>publisher<Space>=<Space>{(<>)}, <Enter>isbn<Space>=<Space>{(<>)}, <Enter>year<Space>=<Space>{(<>)}, <Enter>series<Space>=<Space>{(<>)}, <Enter>edition<Space>=<Space>{(<>)}, <Enter>volume<Space>=<Space>{(<>)}<Enter><BS>}<Enter>(<>)<Esc>10kA,<Esc>i
autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>"(<>)",<Enter>title<Space>=<Space>"(<>)",<Enter>booktitle<Space>=<Space>"(<>)",<Enter>editor<Space>=<Space>"(<>)",<Enter>year<Space>=<Space>"(<>)",<Enter>publisher<Space>=<Space>"(<>)",<Enter>}<Enter>(<>)<Esc>8kA,<Esc>i
