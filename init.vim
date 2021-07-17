" leader key
let g:mapleader="\<Space>"

" settings
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab " use tabs as indentation

" adding the colorscheme
packadd! modus-theme-vim
set termguicolors
colorscheme modus-vivendi

" functions
"" TODO add a function that searches for build.bat on windows to build the program.
"" Debugging colorscheme
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" mappings
nnoremap <f10> :call <SID>SynStack()<CR>
nnoremap tn :tabnew<CR>
nnoremap tj :tabprevious<CR>
nnoremap tk :tabnext<CR>


" autocmd
augroup disable_autocomments
	autocmd!
	autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
	autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro
	autocmd BufNewFile,BufRead *.vert,*.tesc,*.tese,*.glsl,*.geom,*.frag,*.comp set filetype=glsl
	autocmd BufNewFile,BufRead *.zig set ft=zig
	autocmd BufWinEnter,WinEnter term://* startinsert
	autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
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
