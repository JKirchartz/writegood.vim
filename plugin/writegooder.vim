"
" Testing text for the the writegood plugin, a vim plugin based on Matt Might's
" '3 shell scripts that can improve your writing'
" http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/
"
" Joel Kirchartz (tweaks) 2015-10-15
" David Beckingsale 2012-04-22
"
if exists('g:loaded_writegooder') || &cp
    finish
endif

let g:loaded_writegooder = 1

function! s:WritegooderToggle()
    call writegood#toggle()
endfunction

function! s:WritegooderEnable()
    call writegood#enable()
endfunction

function! s:WritegooderDisable()
    call writegood#disable()
endfunction

command! -bar WritegooderToggle       call s:WritegooderToggle()
command! -bar WritegooderEnable       call s:WritegooderEnable()
command! -bar WritegooderDisable      call s:WritegooderDisable()

" Default mapping
nmap <leader>wg :WritegooderToggle<cr>
