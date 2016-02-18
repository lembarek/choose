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

function! Config()

    let g:PhpUnitPhar=g:SiteDir.g:Vendor.'/bin/phpunit'
    let g:PhpUnitConfig=g:SiteDir.'phpunit.xml'
    let g:PhpUnit=g:testMap.g:PhpUnitPhar.' -c '.g:PhpUnitConfig

    let g:CodeceptionPhar=g:SiteDir.g:Vendor.'/bin/codecept'
    let g:CodeceptionConfig=g:SiteDir.'/codeception.yml'
    let g:CodeceptionRun=g:testMap.g:CodeceptionPhar.' run -c '.g:CodeceptionConfig


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

    let g:PhpUnitList = [
                \'normal '.g:PhpUnit.' % <cr>'.'',
                \'normal '.g:PhpUnit.'   <cr>'.'',
                \'call RunOneFunctionWithPhpUnit()',
                \'normal :nnoremap ff :call TestThisFunction()<cr>',
                \'call RunOneFunctionWithPhpUnit2()',
    \]

    let g:CodeceptionList = {
               \'% => %':  'normal '.g:CodeceptionRun.'  %<cr>'.'',
               \'l => all': 'normal '.g:CodeceptionRun.' <cr>'.'', 
               \'u => unit': 'normal '.g:CodeceptionRun.' unit<cr>'.'', 
               \'a => acceptance':  'normal '.g:CodeceptionRun.' acceptance<cr>'.'', 
               \'f => functional': 'normal '.g:CodeceptionRun.' functional<cr>'.'', 
               \'i => integration': 'normal '.g:CodeceptionRun.' integration<cr>'.'' 
    \}

    let g:PhpSpecList = [
                \'normal '.g:testMap.g:PhpSpecPhar.' -c /opt/lampp/htdocs/findJobs/phpspec.yml <cr>'.'',
    \]

    let g:commands = [
                \'tabnew ~/.vimrc', 
                \'tabnew ~/.bashrc', 
                \'tabnew ~/.vim/bundle/snipmate.vim/snippets/php.snippets', 
                \'tabnew ~/.vim/ftplugin/php/laravel.vim', 
                \'tabnew ~/.vim/plugin/commands.vim', 
                \'tabnew /media/d/next_internet/with_your_computer/with_your_computer.txt',
                \'tabnew app/Http/routes.php', 
                \'tabnew config/app.php', 
                \'tabnew composer.json', 
                \'!phpunit --coverage-html coverage  %',
                \'!/media/d/backtrack/programs/firefox/firefox --new-window /opt/lampp/htdocs/findJobs/coverage/index.html',
                \'nnoremap ff :!vendor/bin/behat<cr>',
    \]

endfunction

call Config()

