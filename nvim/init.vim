if &compatible
	set nocompatible
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/repos/github.com/.cache/dein'))

call dein#add('~/.config/nvim/repos/github.com/Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')

"Theme stuff
call dein#add('morhetz/gruvbox')


"status line
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
set encoding=utf-8

call dein#add('vim-scripts/taglist.vim')
call dein#add('vim-scripts/ctags.vim')
call dein#add('vim-scripts/LanguageTool')

let g:languagetool_jar='/opt/LanguageTool-3.8/languagetool-commandline.jar'
let g:languagetool_disable_rules='DASH_RULE,EN_QUOTES,WHITESPACE_RULE,COMMA_PARENTHESIS_WHITESPACE,EN_UNPAIRED_BRACKETS,MORFOLOGIK_RULE_EN_US'

call dein#add('vim-scripts/ctags.vim')
call dein#add('terryma/vim-multiple-cursors')

call dein#add('junegunn/vim-easy-align')

" matlab stuff
call dein#add('daeyun/vim-matlab')
call dein#add('vim-scripts/MatlabFilesEdition')

let $MATLABPATH='/home/malte/Documents/MATLAB/delsysmatlab/:/home/malte/Dokumente/bachelor/scrips/:/home/malte/Documents/MATLAB/export_fig/'

call dein#add('scrooloose/nerdtree')

call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')

" Shows git status for curent file/branch.
" >> https://github.com/airblade/vim-gitgutter
call dein#add ('airblade/vim-gitgutter')


"default value for max change signes if no
"changes ar not shown with signes any more
"increase this number or commit changes
"let g:gitgutter_max_signs = 500  

call dein#add('jiangmiao/auto-pairs')

call dein#add('rust-lang/rust.vim')

"--TODO tagbar would be nice
"call dein#add('racer-rust/vim-racer')
"call dein#add('ctrlpvim/ctrlp.vim')

"GitGutterLineHighlightsEnable
GitGutterEnable 

colorscheme gruvbox
set background=dark


call dein#end()

let g:airline_powerline_fonts = 1

if has("autocmd")
	filetype plugin indent on
	" filetype dependent settings
	au Filetype vhdl call FT_vhdl()
	" filetype dependent templates
	au BufNewFile *.{vhd,py,tex,asm,sh,c,java,html} call Template_Load(expand("%"))
	" replace $template:date$ and $template:filename$
	au BufNewFile *.{vhd,py,tex,asm,html} call Template_Replace_Special()
        " set default TeX flavor if *.tex file is found
        autocmd BufRead,BufNewFile *.tex set filetype=tex
else
	set autoindent
endif 

source ~/.config/nvim/vhdl.vim




syntax enable


"numbering
set number
set relativenumber
set cursorline

source ~/.config/nvim/mappings.vim

set expandtab
set shiftwidth=4
set softtabstop=4
set mouse=a

set backup
