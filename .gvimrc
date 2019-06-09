set nocompatible

"==============================================================
" Set tabsize, no of space chars used for indentation, and 
" force tabs to be spaces
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
"==============================================================
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

"==============================================================
" Set Linebreaks and Wrapping
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
"==============================================================
set formatoptions+=l
set wrap
set linebreak
set nolist  
set textwidth=0
set wrapmargin=0

"==============================================================
" Colorscheme, Font, Highlight current line, Add line numbers
"==============================================================
set cursorline
set number
set guifont=Source\ Code\ Pro:h15
colorscheme slate

"==============================================================
" Set color column to show where you're going past col 80
"==============================================================
highlight ColorColumn ctermbg=magenta
set colorcolumn=81

set history=50    " keep 50 lines of command line history
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

"==============================================================
" In many terminal emulators the mouse works just fine, thus enable it.
"==============================================================
if has('mouse')
  set mouse=a
endif

"==============================================================
" Set up the Status Bar and make it show permanently
" From Hacking Vim 7.2 eBook
"==============================================================
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [COL=%03v]\ [%p%%]\ [LEN=%L]

set diffexpr=MyDiff()
