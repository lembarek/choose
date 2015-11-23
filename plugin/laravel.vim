" this is create by lembarek benghezala


abbrev omig tabnew app/database/migrations/
abbrev oc tabnew app/controllers/

abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev mig !php artisan migrate
abbrev gmig !php artisan generate:migration 


nnoremap ng :!php artisan 



" Concept - load underlying class for Laravel
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



nnoremap <leader>lf :call FacadeLookup()<cr>



function! Class()
    let name = input('Class name?')
    let namespace = input('Any Namespace?')

    if strlen(namespace)
        exec 'normal i<?php namespace '.namespace.';'

    else
        exec 'normal i<?php'
    endif


    exec 'normal iclass '.name.'{}0'


    exec 'normal i   public function  __construct(){ }'
endfunction
nnoremap <leader>c :call Class()<cr>



" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ') 
    let segments = split(namespace, '\')
    let typehint = segments[-1]
    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['
    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g'
endfunction
nnoremap <leader>v :call AddDependency()<cr>

nnoremap <leader>m yiw:!clear && phpunit --filter "<cr>
nnoremap ;r :e app/routes.php<cr>
"set wildignore+=*/vendor/*

nnoremap <Leader>t  :!clear && phpunit -c ../../phpunit.xml %<cr>

nnoremap <leader>m  yiw:!clear && phpunit -c ../../phpunit.xml "<cr>


" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')
    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif
    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nnoremap <leader>g :call Class()<cr>

function! CreateFile()
    let name = input('Name: ')
    let base = "app/"
    let dir = base.name

    execute 'normal :!mkdir -p  '.dir.''
    execute 'normal :!rmdir   '.dir.''
    execute 'normal :tabnew '.dir.''

endfunction 
nnoremap f; :call CreateFile()<cr>

function! RunOneFunctionWithPhpUnit()
   let l:winview = winsaveview()
   execute 'normal ?functionwvwh"fy'
   let command =  ':nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit --filter "/::'.@f.'.*(.*)/" %<cr>' 
   execute 'normal '.command.''
   call winrestview(l:winview)
endfunction


function! RunOneFunctionWithPhpUnit2()
   let l:winview = winsaveview()
   let l:functionName = input('function name: ')
   let command =  ':nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit   --filter "/::'.l:functionName.'.*(.*)/" <cr>' 
   execute 'normal '.command.''
   call winrestview(l:winview)
endfunction


"it get the name of function where I am insede
function! TestThisFunction()
   let l:winview = winsaveview()
   execute 'normal ?functionwvwh"fy'
   let l:command =  ':!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit  --filter "/::'.@f.'.*(.*)/"' 
   execute l:command
   call winrestview(l:winview)
endfunction


function! RunOneFunctionWithPhpUnitWithCodeCoverage()
   let l:winview = winsaveview()
   execute 'normal ?functionwvwh"fy'
   let command =  ':nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit  --coverage-text --filter "/::'.@f.'.*(.*)/" %<cr>' 
   execute 'normal '.command.''
   call winrestview(l:winview)
endfunction


function! RunOneFunctionWithPhpUnit2WithCodeCoverage()
   let l:winview = winsaveview()
   let l:functionName = input('function name: ')
   let command =  ':nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit  --coverage-text --filter "/::'.l:functionName.'.*(.*)/" <cr>' 
   execute 'normal '.command.''
   call winrestview(l:winview)
endfunction


"it get the name of function where I am insede
function! TestThisFunctionWithCodeCoverage()
   let l:winview = winsaveview()
   execute 'normal ?functionwvwh"fy'
   let l:command =  ':!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit  --coverage-text --filter "/::'.@f.'.*(.*)/"' 
   execute l:command
   call winrestview(l:winview)
endfunction


function! Choose(commands)

    let letter = 0
    for choix in a:commands
            echo letter.'  ===>  'choix
            let letter=letter+1
    endfor

    echo '  '
    let choix = input('choose: ')

    execute a:commands[choix]

endfunction

let FFList = [
            \'normal :nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpspec run -c /opt/lampp/htdocs/findJobs/phpspec.yml <cr>'.'',
            \'normal :nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/codecept run %<cr>'.'', 
            \'normal :nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/codecept run integration<cr>'.'', 
            \'normal :nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit  tests/App <cr>'.'',
            \'normal :nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit   % <cr>'.'',
            \'call RunOneFunctionWithPhpUnit()',
            \'normal :nnoremap ff :call TestThisFunction()<cr>',
            \'call RunOneFunctionWithPhpUnit2()',
            \'normal :nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit --coverage-text tests/App <cr>'.'',
            \'normal :nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit --coverage-text  % <cr>'.'',
            \'call RunOneFunctionWithPhpUnitWithCodeCoverage()',
            \'normal :nnoremap ff :call TestThisFunctionWithCodeCoverage()<cr>',
            \'call RunOneFunctionWithPhpUnit2WithCodeCoverage()',
            \'normal :vendor\bin\behat',
\]

nnoremap  nf :call Choose(FFList)<cr>

nnoremap ff :!clear && /opt/lampp/htdocs/findJobs/vendor/bin/phpunit --coverage-text  tests/App <cr>
