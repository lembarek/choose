"created by lembarek benghezala
"

function! Execute(commands)

    let l:letter = 0
    for l:choix in a:commands
            echo l:letter.'  ===>  'l:choix
            let l:letter=l:letter+1
    endfor

    echo '  '
    let l:choix = input('choose: ')

    execute a:commands[l:choix]

endfunction

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

nnoremap  nd :call Execute(commands)<cr>



