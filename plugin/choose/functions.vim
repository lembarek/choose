runtime config.vim
runtime testFunctions.vim
runtime sitesFunctions.vim

function! CreateFile()
    let name = input('Name: ','','file')
    let dir = name

    execute 'normal :!mkdir -p  '.dir.''
    execute 'normal :!rmdir   '.dir.''
    execute 'normal :tabnew '.dir.''

endfunction 

function! Choose(commands)

    let keys = sort(keys(a:commands))

    for key in keys
            echo key 
    endfor

    let choix = input('choose: ')

    for key in keys
        if key =~ '^'.choix
            execute a:commands[key]
        endif
    endfor

    echo '  '


endfunction

function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }
 
    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction

function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace '.namespace.';'
    else
        exec 'normal i<?php'
    endif

    exec 'normal iclass '.name.'{}'

    exec 'normal i   public function  __construct(){ }0dw'
endfunction

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ') 
    if strlen(namespace)
        let segments = split(namespace, '\')
        let typehint = segments[-1]
    endif
    if strlen(namespace)
        exec 'normal gg/__construct/)i, ' . typehint . ' $' . dependency . ''
    else
        exec 'normal gg/__construct/)i, $' . dependency . ''
    endif
    exec 'normal /}O$this->a' . dependency . ' = $' . dependency . ';'
    exec 'normal ?{kOprotected $' . dependency . ';'
    if strlen(namespace)
        exec 'normal ?class?\v(use|php)ouse ' . namespace . ';'
    endif
    " Remove opening comma if there is only one dependency
    exec 'normal :%s/\v(\(, |\()/\(/'
endfunction

function! Laravel()

    abbrev gm !php artisan generate:model
    abbrev gc !php artisan generate:controller
    abbrev mig !php artisan migrate
    abbrev gmig !php artisan generate:migration 
    nnoremap ng :!php artisan 

    nnoremap <leader>lf :call FacadeLookup()<cr>
    nnoremap <leader>c :call Class()<cr>
    nnoremap <leader>v :call AddDependency()<cr>

endfunction

function! Laravel4()
    call Laravel()
    abbrev omig tabnew app/database/migrations/
    abbrev oc tabnew app/controllers/
    nnoremap ;r :e app/routes.php<cr>
endfunction

function! Laravel5()
    call Laravel()
    abbrev omig tabnew database/migrations/
    abbrev oc tabnew app/Http/Controllers/
endfunction

function! MyVimRc()
    call Laravel()
    abbrev pft PHPUnit_Framework_TestCase
    nnoremap f; :call CreateFile()<cr>
    nnoremap ;c :call Class()<cr>
    nnoremap nf :call Choose(g:CodeceptionList)<cr>
    nnoremap  nd :call Choose(g:commands)<cr>
endfunction

function! SetArabic()
    set keymap=arabic
    set encoding=utf-8
    set arabicshape
    set arabic
    set rl
endfunction

