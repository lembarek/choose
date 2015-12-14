let g:SiteBaseDir='/opt/lampp/htdocs/'
let g:SiteDir='food-we-love/'
let g:Vendor='vendor/'

function! Config()
    let g:PhpUnitPhar=g:SiteBaseDir.g:SiteDir.g:Vendor.'bin/phpunit'
    let g:CodeceptionPhar=g:SiteBaseDir.g:SiteDir.g:Vendor.'bin/codecept'
    let g:PhpSpecPhar=g:SiteBaseDir.g:SiteDir.g:Vendor.'bin/phpspec run'

    let g:SitesList = [
            \'call Food()',
            \'call Hooia()',
            \'call Ccp()',
            \'call Share()',
    \]

    let g:TestList = [
                \'normal :nnoremap ff :!clear && '.g:PhpSpecPhar.' -c /opt/lampp/htdocs/findJobs/phpspec.yml <cr>'.'',
                \'normal :nnoremap ff :!clear && '.g:CodeceptionPhar.' %<cr>'.'', 
                \'normal :nnoremap ff :!clear && '.g:CodeceptionPhar.' integration<cr>'.'', 
                \'normal :nnoremap ff :!clear && '.g:PhpUnitPhar.'  tests/App <cr>'.'',
                \'normal :nnoremap ff :!clear && '.g:PhpUnitPhar.'   % <cr>'.'',
                \'call RunOneFunctionWithPhpUnit()',
                \'normal :nnoremap ff :call TestThisFunction()<cr>',
                \'call RunOneFunctionWithPhpUnit2()',
                \'normal :nnoremap ff :!clear && '.g:PhpUnitPhar.' --coverage-text tests/App <cr>'.'',
                \'normal :nnoremap ff :!clear && '.g:PhpUnitPhar.' --coverage-text  % <cr>'.'',
                \'call RunOneFunctionWithPhpUnitWithCodeCoverage()',
                \'normal :nnoremap ff :call TestThisFunctionWithCodeCoverage()<cr>',
                \'call RunOneFunctionWithPhpUnit2WithCodeCoverage()',
                \'normal :vendor\bin\behat',
    \]

    let g:PhpUnitList = [
                \'normal :nnoremap ff :!clear && '.g:PhpUnitPhar.'   % <cr>'.'',
                \'normal :nnoremap ff :!clear && '.g:PhpUnitPhar.'   <cr>'.'',
                \'call RunOneFunctionWithPhpUnit()',
                \'normal :nnoremap ff :call TestThisFunction()<cr>',
                \'call RunOneFunctionWithPhpUnit2()',
    \]

    let codeCeptionList = [
                \'normal :nnoremap ff :!clear && '.g:CodeceptionPhar.' %<cr>'.'', 
                \'normal :nnoremap ff :!clear && '.g:CodeceptionPhar.' integration<cr>'.'', 
    \]

    let g:PhpSpecList = [
                \'normal :nnoremap ff :!clear && '.g:PhpSpecPhar.' -c /opt/lampp/htdocs/findJobs/phpspec.yml <cr>'.'',
    \]

    let g:commands = [
                \'tabnew ~/.vimrc', 
                \'tabnew ~/.bashrc', 
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


