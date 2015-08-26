" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" By default, when you compile a tex file using \ll, then you will be
" generating a .dvi file. Change this line if you want to set another default.
" NOTE: Make sure that a target for this format exists in the 'Compiler rules'
"       section below and is set up properly for your system.
if has('macunix')
	let g:Tex_DefaultTargetFormat = 'pdf'
else
	let g:Tex_DefaultTargetFormat = 'pdf'
endif

" ways to generate pdf files. there are soo many...
" NOTE: pdflatex generates the same output as latex. therefore quickfix is
"       possible.
let g:Tex_CompileRule_pdf = 'xelatex --src-specials --synctex=1 -interaction=nonstopmode -file-line-error-style $*'


" Viewer rules {{{
" these programs are for viewing other formats. 
" NOTE: latex-suite will automatically append file.<format> to these functions
"       when calling them. The viewer therefore cannot accept arguments after
"       the filename.
" NOTE: Windows users:
" 		Set your $PATH variable to include the full path to these programs.
if has('win32')
	let g:Tex_ViewRule_ps = 'gsview32'
	let g:Tex_ViewRule_pdf = 'AcroRd32'
	let g:Tex_ViewRule_dvi = 'yap -1'
elseif has('macunix')
	" Let the system pick.  If you want, you can override the choice here.
	let g:Tex_ViewRule_ps = ''
	let g:Tex_ViewRule_pdf = ''
	" let g:Tex_ViewRule_pdf = 'Acrobat\ Reader\ 5.1'
	let g:Tex_ViewRule_dvi = ''
	" Set this to 1 to disable opening a viewer with 'open -a'
	" Note: If you do this, you need to specify viewers above
	" let g:Tex_TreatMacViewerAsUNIX = 1
else
	if executable('okular')
		let g:Tex_ViewRule_ps = 'okular'
		let g:Tex_ViewRule_pdf = 'okular'
		let g:Tex_ViewRule_dvi = 'okular'
	else
		let g:Tex_ViewRule_ps = 'gv'
		let g:Tex_ViewRule_pdf = 'xpdf'
		let g:Tex_ViewRule_dvi = 'xdvi'
	endif
	" the option below specifies an editor for the dvi viewer while starting
	" up the dvi viewer according to Dimitri Antoniou's tip on vim.sf.net (tip
	" #225)
	let g:Tex_UseEditorSettingInDVIViewer = 1
endif


