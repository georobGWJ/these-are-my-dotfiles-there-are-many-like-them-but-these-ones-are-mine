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
colorscheme peachpuff

"==============================================================
" Set color column to show where you're going past col 80
"==============================================================
highlight ColorColumn ctermbg=magenta
set colorcolumn=81

"==============================================================
" Miscellaneous Settings
"==============================================================
set history=50    " keep 50 lines of command line history
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

"==============================================================
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"==============================================================
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
