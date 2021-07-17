" leader key
let g:mapleader="\<Space>"

" settings
set autoindent " automatic indentation
set belloff+=ctrlg " If Vim beeps during completion
set completeopt+=menuone   " Use popup only when there is one match
set completeopt+=noinsert  " Don't insert anything until user selects something.
set inccommand=split " live update the susbtitute command
set path+=** " makes find command more useful
set shortmess+=c   " Shut off completion messages
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab " use tabs as indentation
set wildignore=*.git/*,*.tags,tags,*.o,*.class " ignore these files
set wildignorecase " ignore case for wildcard

" adding the colorscheme
packadd! nvim-solarized-lua
packadd! modus-theme-vim
set termguicolors
colorscheme modus-vivendi

" plugin settings
"" Dirvish
let g:loaded_netrwPlugin = 1
let g:dirvish_mode = ':sort ,^.*[\/],'
"" rooter
let g:rooter_patterns = ['.git', 'Makefile', 'build.bat']
let g:rooter_change_directory_for_non_project_files = ''

" functions
"" TODO add a function that searches for build.bat on windows to build the program.
"" Debugging colorscheme
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function! FindProjectRoot(lookFor)
	let pathMaker='%:p'
	while(len(expand(pathMaker))>len(expand(pathMaker.':h')))
		let pathMaker=pathMaker.':h'
		let fileToCheck=expand(pathMaker).'/'.a:lookFor
		if filereadable(fileToCheck)||isdirectory(fileToCheck)
			return expand(pathMaker)
		endif
	endwhile
	return 0
endfunction

" mappings
nnoremap <f10> :call <SID>SynStack()<CR>
nnoremap tn :tabnew<CR>
nnoremap tj :tabprevious<CR>
nnoremap tk :tabnext<CR>
nnoremap <F5> :ToggleTerminal<CR>

nnoremap <leader>wh <C-W>h
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wl <C-W>l

nnoremap <leader>wH <C-W>H
nnoremap <leader>wJ <C-W>J
nnoremap <leader>wK <C-W>K
nnoremap <leader>wL <C-W>L

" autocmd
augroup disable_autocomments
	autocmd!
	autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
	autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro
	autocmd BufNewFile,BufRead *.zig set ft=zig
	autocmd BufWinEnter,WinEnter term://* startinsert
	" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
	au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup end

augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

augroup vimrc-auto-mkdir
	autocmd!
	autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
	function! s:auto_mkdir(dir, force)
		if !isdirectory(a:dir)
					\   && (a:force
					\       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
			call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
		endif
	endfunction
augroup END
