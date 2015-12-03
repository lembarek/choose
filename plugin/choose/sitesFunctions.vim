function! Food()
    let g:SiteDir="food-we-love/"
    call Config()
    call Laravel4()
endfunction

function! Ccp()
    let g:SiteDir="ccp/"
    call Config()
    call Laravel4()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction

function! Hooia()
    let g:SiteDir="hooia/"
    call Config()
    call Laravel5()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction

