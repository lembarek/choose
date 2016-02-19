function! GetComposerDir()
        let pwd = getcwd()
        while pwd != '/'
             if filereadable(pwd.'/composer.json')
               return pwd 
            endif
            let pwd = fnamemodify(pwd, ':h')
        endwhile
endfunction

let g:SiteDir= GetComposerDir()
let g:Vendor='/vendor'
let g:testMap=':nnoremap ff :!clear && '
let g:FileRelativePathToComposer = substitute(expand('%:p'), '^'.g:SiteDir.'/', '','')
let g:FileRelativePathToCodeceptionConfig= substitute(expand('%:p'), '^'.g:SiteDir.'/tests/', '','')
let g:CodeceptionConfig=g:SiteDir.'/codeception.yml'

let g:PhpUnitPhar=g:SiteDir.g:Vendor.'/bin/phpunit'
let g:PhpUnitConfig=g:SiteDir.'phpunit.xml'
let g:PhpUnit=g:testMap.g:PhpUnitPhar.' -c '.g:PhpUnitConfig

let g:CodeceptionPhar=g:SiteDir.g:Vendor.'/bin/codecept'
let g:CodeceptionRun=g:testMap.g:CodeceptionPhar.' run -c '.g:CodeceptionConfig.' '

let g:PhpSpecPhar=g:SiteDir.g:Vendor.'/bin/phpspec run'

let g:TestList = [
            \'normal '.g:testMap.g:PhpSpecPhar.' -c /opt/lampp/htdocs/findJobs/phpspec.yml <cr>'.'',
            \'normal '.g:testMap.g:CodeceptionPhar.' %<cr>'.'', 
            \'normal '.g:testMap.g:CodeceptionPhar.' integration<cr>'.'', 
            \'normal '.g:testMap.g:PhpUnitPhar.'  tests/App <cr>'.'',
            \'normal '.g:testMap.g:PhpUnitPhar.'   % <cr>'.'',
            \'call RunOneFunctionWithPhpUnit()',
            \'normal :nnoremap ff :call TestThisFunction()<cr>',
            \'call RunOneFunctionWithPhpUnit2()',
            \'normal '.g:testMap.g:PhpUnitPhar.' --coverage-text tests/App <cr>'.'',
            \'normal '.g:testMap.g:PhpUnitPhar.' --coverage-text  % <cr>'.'',
            \'call RunOneFunctionWithPhpUnitWithCodeCoverage()',
            \'normal :nnoremap ff :call TestThisFunctionWithCodeCoverage()<cr>',
            \'call RunOneFunctionWithPhpUnit2WithCodeCoverage()',
            \'normal :vendor\bin\behat',
\]

let g:PhpUnitList = {
            \'% => %': 'normal '.g:PhpUnit.' % <cr>'.'',
            \'l => all': 'normal '.g:PhpUnit.'   <cr>'.'',
            \'t => this function': 'call RunOneFunctionWithPhpUnit()'
\}

let g:CodeceptionList = {
            \'% => %':  'normal '.g:CodeceptionRun.g:FileRelativePathToComposer.'<cr>'.'',
            \'l => all': 'normal '.g:CodeceptionRun.' <cr>', 
            \'u => unit': 'normal '.g:CodeceptionRun.' unit<cr>', 
            \'a => acceptance':  'normal '.g:CodeceptionRun.' acceptance<cr>', 
            \'f => functional': 'normal '.g:CodeceptionRun.' functional<cr>', 
            \'i => integration': 'normal '.g:CodeceptionRun.' integration<cr>',
            \'t => this function': 'call RunOneFunctionWithCodeception()'
\}

let g:commands = {
            \'vimrc ': 'tabnew ~/.vimrc', 
            \'bash': 'tabnew ~/.bashrc', 
            \'php': 'tabnew ~/.vim/bundle/snipmate.vim/snippets/php.snippets', 
            \'laravel.vim': 'tabnew ~/.vim/ftplugin/php/laravel.vim', 
            \'commands.vim': 'tabnew ~/.vim/plugin/commands.vim', 
            \'todos':  'tabnew /media/d/etude/encours/txt/todos.txt',
            \'down':  'tabnew /media/d/develop/sh/down/down.sh',
            \'alias':  'tabnew ~/.my_aliases',
            \'cont':  'tabnew ~/.my_contrc',
            \'my_bash':  'tabnew ~/.my_bashrc',
            \'zsh':  'tabnew ~/.zshrc',
\}


