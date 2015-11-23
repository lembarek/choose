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

