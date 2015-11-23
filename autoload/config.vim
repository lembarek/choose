let SiteBaseDir='/opt/lampp/htdocs/'
let SiteDir='food-we-love/'
let Vendor='vendor/'
let PhpUnitPhar=SiteDir.Vendor.'bin/phpunit'
let CodeCeptionPhar=SiteDir.Vendor.'bin/codecept'
let PhpSpecPhar=SiteDir.Vendor.'bin/phpspec run'

let SitesList = [
        \'call Food()',
        \'call Hooia()',
\]

let TestList = [
            \'normal :nnoremap ff :!clear && '.PhpSpecPhar.' -c /opt/lampp/htdocs/findJobs/phpspec.yml <cr>'.'',
            \'normal :nnoremap ff :!clear && '.CodeCeptionPhar.' %<cr>'.'', 
            \'normal :nnoremap ff :!clear && '.CodeCeptionPhar.' integration<cr>'.'', 
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.'  tests/App <cr>'.'',
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.'   % <cr>'.'',
            \'call RunOneFunctionWithPhpUnit()',
            \'normal :nnoremap ff :call TestThisFunction()<cr>',
            \'call RunOneFunctionWithPhpUnit2()',
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.' --coverage-text tests/App <cr>'.'',
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.' --coverage-text  % <cr>'.'',
            \'call RunOneFunctionWithPhpUnitWithCodeCoverage()',
            \'normal :nnoremap ff :call TestThisFunctionWithCodeCoverage()<cr>',
            \'call RunOneFunctionWithPhpUnit2WithCodeCoverage()',
            \'normal :vendor\bin\behat',
\]

let PhpUnitList = [
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.'   % <cr>'.'',
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.'  tests/App <cr>'.'',
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.' --coverage-text tests/App <cr>'.'',
            \'normal :nnoremap ff :!clear && '.PhpUnitPhar.' --coverage-text  % <cr>'.'',
            \'call RunOneFunctionWithPhpUnitWithCodeCoverage()',
\]

let codeCeptionList = [
            \'normal :nnoremap ff :!clear && '.CodeCeptionPhar.' %<cr>'.'', 
            \'normal :nnoremap ff :!clear && '.CodeCeptionPhar.' integration<cr>'.'', 
\]

let PhpSpecList = [
            \'normal :nnoremap ff :!clear && '.PhpSpecPhar.' -c /opt/lampp/htdocs/findJobs/phpspec.yml <cr>'.'',
\]

let commands = [
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


