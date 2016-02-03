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

function! Share()
    let g:SiteDir="share/"
    call Config()
    call Laravel5()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction

function! Package()
    let g:SiteDir="packages/"
    call Config()
    call Laravel5()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction

function! Core()
    let g:SiteDir="packages/lembarek/core/"
    call Config()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction

function! Auth()
    let g:SiteDir="packages/lembarek/auth/"
    call Config()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction


function! Role()
    let g:SiteDir="packages/lembarek/role/"
    call Config()
    nnoremap nf :call Choose(g:PhpUnitList)<cr>
endfunction

