function! Food()
    let SiteDir="food-we-love"
    call Laravel4()
endfunction

function! Hooia()
    let g:SiteDir="hooia/"
    call Config()
    call Laravel5()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction

