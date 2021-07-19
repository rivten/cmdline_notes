# Command Line Notes {#Command Line Notes}

Disclaimer : this is by no means meant to be an exhaustive entry for
command lines. This is just helpful stuffed that I gathered whenever I
learned a useful trick. I hope you can get something out of it.

-   [#alias](#alias "wikilink")
-   [#ansi](#ansi "wikilink")
-   [#at](#at "wikilink")
-   [#aur](#aur "wikilink")
-   [#awk](#awk "wikilink")
-   [#base64](#base64 "wikilink")
-   [#bash](#bash "wikilink")
-   [#beep](#beep "wikilink")
-   [#binaries](#binaries "wikilink")
-   [#cmake](#cmake "wikilink")
-   [#cron](#cron "wikilink")
-   [#cut](#cut "wikilink")
-   [#date](#date "wikilink")
-   [#dd](#dd "wikilink")
-   [#django](#django "wikilink")
-   [#docker](#docker "wikilink")
-   [#du](#du "wikilink")
-   [#elixir](#elixir "wikilink")
-   [#executables](#executables "wikilink")
-   [#filedescriptors](#filedescriptors "wikilink")
-   [#find](#find "wikilink")
-   [#fzf](#fzf "wikilink")
-   [#gdb](#gdb "wikilink")
-   [#getopts](#getopts "wikilink")
-   [#git](#git "wikilink")
-   [#gpg](#gpg "wikilink")
-   [#grep](#grep "wikilink")
-   [#haskell](#haskell "wikilink")
-   [#inotifywait](#inotifywait "wikilink")
-   [#jobs](#jobs "wikilink")
-   [#journalctl](#journalctl "wikilink")
-   [#jq](#jq "wikilink")
-   [#ln](#ln "wikilink")
-   [#mitmproxy](#mitmproxy "wikilink")
-   [#mysql](#mysql "wikilink")
-   [#neofetch](#neofetch "wikilink")
-   [#network](#network "wikilink")
-   [#notify-send](#notify-send "wikilink")
-   [#opam](#opam "wikilink")
-   [#pacman](#pacman "wikilink")
-   [#pandoc](#pandoc "wikilink")
-   [#parallel](#parallel "wikilink")
-   [#php](#php "wikilink")
-   [#pip](#pip "wikilink")
-   [#postgresql](#postgresql "wikilink")
-   [#read](#read "wikilink")
-   [#sed](#sed "wikilink")
-   [#shuf](#shuf "wikilink")
-   [#sqlite](#sqlite "wikilink")
-   [#ssh](#ssh "wikilink")
-   [#sudo](#sudo "wikilink")
-   [#test](#test "wikilink")
-   [#tmux](#tmux "wikilink")
-   [#tr](#tr "wikilink")
-   [#wc](#wc "wikilink")
-   [#xclip](#xclip "wikilink")
-   [#xdg-open](#xdg-open "wikilink")
-   [#xxd](#xxd "wikilink")
-   [#zsh](#zsh "wikilink")

## sudo

## docker

See all containers

``` bash
    sudo docker container ls
```

Delete all containers

``` bash
    sudo docker container ls -q | xargs sudo docker container rm
```

See all volumes

``` bash
    sudo docker volume ls
```

Delete all volumes

``` bash
    sudo docker volume ls -q | xargs sudo docker volume rm
```

Restart a container

``` bash
    sudo docker restart <container_name>
```

## django

See all django admin commands

``` bash
    django-admin
```

Run server

``` bash
    python manage.py runserver
```

Put script into shell

``` bash
    python manage.py shell < my_script.py
```

## pandoc

## pacman

See all packages installed

``` bash
    pacman -Qe
```

output it in a file

``` bash
    pacman -Qe > ~/installed.txt
```

To see all dependencies of a package in graphviz

``` bash
    dot -Tpng -o <filename>.png <(pactree -g <package_name>)
```

## find

``` bash
    find <folder> -name <file_name>
```

You can also specify the type

``` bash
    -type [d|f|l|...]
```

d: directory f: file l: link

For others, check the manpage

## elixir

## sqlite

To see all tables

``` bash
    .tables
```

To see the schema of a table

``` bash
    .schema <table_name>
```

To execute a sql query on a db in command line:

``` bash
    sqlite3 <db_name> '<sql_query>'
```

or if the query is in a file

``` bash
    sqlite3 <db_name> < <sql_file>
```

To see how the query is executed

``` bash
    EXPLAIN QUERY PLAN <query>
```

## postgresql

Check that postgres is installed

``` bash
    psql --version
```

How to install (ubuntu)

``` bash
    sudo apt-get update
```

``` bash
    sudo apt-get install postgresql postgresql-contrib
```

How to install (arch)

``` bash
    sudo pacman -S postgresql
```

Create a user and a first database

``` bash
    sudo su -l postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
```

Start the service

``` bash
    sudo systemctl start postgresql.service
```

To see all services running

``` bash
    systemctl
```

Check where are stored the data

``` bash
    sudo -u postgres psql -c "show data_directory;"
```

Connect to the database

``` bash
    psql -U postgres
```

Inside the user, see all databases:

``` bash
    \l
```

Inside the user, exit

``` bash
    exit
```

Close the service

``` bash
    sudo systemctl stop postgresql.service
```

Make the service start automatically at boot

``` bash
    sudo systemctl enable postgresql.service
```

### Connect to a table {#Connect to a table}

Once your in the psql repl, to see all databases:

``` bash
    \l
```

To connect to a database:

``` bash
    \c <database_name>` (c is short for connect
```

To see all tables in a database:

``` bash
    \dt
```

To see the layout of a table:

``` bash
    \d <table_name>
```

## binaries

To see the local binary path of a user

``` bash
    systemd-path user-binaries
```

To put a binary in pat

``` bash
    sudo mv my_binary ~/.local/bin/
```

``` bash
    chmod +x my_binary
```

or:

``` bash
    chmod u+x my_binary
```

To make the console aware of the change

``` bash
    exec -l bash
```

## haskell

Beware of ghc and cabal. In ArchLinux, build must be done dynamically.
Refer to : <https://wiki.archlinux.org/index.php/haskell>

Basically, compiling with ghc must be done with the `-dynamic` flag.
Futhermore, in the cabal config file `~/.cabal/config` the following
options must be activated :

``` yaml
    library-vanilla: False
    shared: True
    executable-dynamic: True
    program-default-options
    ghc-options: -dynamic
```

That also means that when ghc or cabal is upgraded, one must delete all
the currently referenced and built library in order for them to be
rebuilt to the current version.

## git

Commit a change

``` bash
    git commit -m <message>
```

Move to branch

``` bash
    git checkout <branch>
```

Create new branch

``` bash
    git branch <new_branch_name> <origin_branch_name>
```

See all local branches

``` bash
    git branch
```

See all remote branches

``` bash
    git branch -r
```

To get latest changes

``` bash
    git fetch [--prune]
```

Merge changes into CURRENT branch

``` bash
    git merge <branch_name>
```

To find a faulty commit

``` bash
    git bisect start
```

``` bash
    git bisect bad
```

``` bash
    git bisect good <known_good_commit_or_tag>
```

Find the most recent common ancestor of two commits

``` bash
    git merge-base <sha_a> <sha_b>
```

Find all files modified by a commit

``` bash
    git diff-tree --no-commit-id --name-only -r  <commit-hash>
```

Find modif count of a file

``` bash
    git rev-list --count <file>
```

Find the name of the git repo

``` bash
    git rev-parse --show-top-level
```

Do a diff of common ancestor of \<main> and \<my_branch>

``` bash
    git diff <main>...<my_branch>
```

Forking workflow:

> <https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/>

## ssh

Activate ssh daemon on machine

``` bash
    sudo systemctl start sshd
```

Copy files over ssh

``` bash
    scp [-r] <user>@<ip_addr>:<file_path> <file_dest>
```

Gen key:

``` bash
    ssh-keygen -t <cipher>
```

Known-hosts in

``` bash
    ~/.ssh/known_hosts
```

Public key of authorized hosts in

``` bash
    ~/.ssh/authorized_keys
```

## journalctl

See all entries from today (a lot already)

``` bash
    journalctl -S today
```

## du

See size in human-readable form, sorted, only one depth

``` bash
    du -d 1 -h <folder> | sort -h
```

## executables

See filetype of file

``` bash
    file <file_path>
```

To see debug info

``` bash
    objdump
```

To trace syscalls

``` bash
    strace <file>
```

To see all dynamic library dependencies

``` bash
    ldd <file>
```

Also

``` bash
    readelf <elf_file>
```

## xxd

``` bash
    xxd <file>
```

## network

ArchLinux Wiki :
<https://wiki.archlinux.org/index.php/Network_configuration>

Make sure to have iproute2 package on arch

``` bash
    sudo pacman -S iproute2
```

Ping a url

``` bash
    ping -c <count> <url>
```

See config

``` bash
    ip addr
```

or

``` bash
    ifconfig
```

See the path of a request:

``` bash
    tracepath <request>
```

See all the opened socket :

``` bash
    ss
```

or

``` bash
    netcat
```

## linux user {#linux user}

Add a user

``` bash
    useradd <username>
```

To create a user with a home directory:

``` bash
    useradd -m <username>
```

Change the password

``` bash
    passwd <username>
```

Switch to user

``` bash
    su - <username>
```

See who currently is

``` bash
    who
```

Remove user

``` bash
    userdel <username>
```

Add a user to sudoers

``` bash
    sudo usermod -a -G sudo <username>
```

You may need to edit visudo file (in vi mode) and uncomment the line for
sudo users (you may need to reboot afterwards)

``` bash
    sudo visudo
```

For more info : <https://wiki.archlinux.org/index.php/Sudo#Using_visudo>

## clean trash {#clean trash}

Trash folder

``` bash
    /home/<user>/.local/share/Trash/files
```

You can just `rm -rf` into it

## npm

See all packages installed

``` bash
    npm ls
```

## aur

<https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_and_upgrading_packages>

Installation process :

1.  Go to the folder where all the packages lives
2.  Download the package from the AUR
    ``` bash
        git clone <aur_link>
    ```
3.  Go into the directory
4.  Build and install the package
    ``` bash
        makepkg -si
    ```
5.  If there is issues about the key (but you have to be sure)
    ``` bash
        makepkg --skippgpcheck -si
    ```

Upgrade process :

``` bash
    git pull
```

``` bash
    makepkg -si
```

## gpg

<https://wiki.archlinux.org/index.php/GnuPG>
<https://linux.101hacks.com/unix/gpg-command-examples/>

Generate a key

``` bash
    gpg --gen-key
```

Encrypt a file

``` bash
    gpg -e -r <username> ~<username>/file
```

or more simply

``` bash
    gpg -e <file>
```

Decrypt file

``` bash
    gpg -d <file>
```

(you can use [#base64](#base64 "wikilink") to encode/decode it further)

## php

See where is the php.ini file

``` bash
    php -i | grep php.ini
```

or

``` bash
    php --ini
```

To check if the system has all requirements

``` bash
    symfony check:requirements
```

If iconv is missing, install it from the [#aur](#aur "wikilink") and
then, in php.ini file, after all the extensions, add

``` bash
    extension=iconv.so
```

## ls

To see all (even hidden):

``` bash
    ls -a
```

To see with more infos :

``` bash
    ls -l
```

To see sorted by used (or reversed):

``` bash
    ls -lt
```

``` bash
    ls -lts
```

## wc

A tool to count words or lines. To count lines

``` bash
    wc -l <my_input>
```

## fzf

To get bash completion, in bashrc:

``` bash
    source /usr/share/fzf/completion.bash
```

``` bash
    source /usr/share/fzf/key-bindings.bash
```

## awk

To specify file separator `-F <fs>` To write the script inside a file
`-f <file>`

## sed

## grep

## cut

``` bash
    cut -d<delimiter char> -f<fields_to_keep> <file_or_stdin>
```

## bash

To edit current command in editor : `CTRL-X CTRL-E`

To set a variable locally for just the command

``` bash
    var=value cmd
```

To execute a command recursively on all files in a folder (without using
`find` `-exec` that executes in a subshell):

        while IFS= read -r -d '' file; do
            cmd "$file"
        done < <(find . -type f -name '*.txt' -print0)

### cool bash oneliners {#cool bash oneliners}

Fuzzy-search git commits (more here
<https://gist.github.com/junegunn/f4fca918e937e6bf5bad>)

``` bash
git log --all --oneline --color=always | fzf --ansi --no-sort --preview="git show --color=always {+1}" | cut -d" " -f1 | xargs git show
```

Find commit count of each file in a folder

``` bash
find -type f -exec bash -c 'echo "$0" $(git rev-list --count --all -- "$0")' {} \;
```

Display a todo each hour

        while true; do
            notify-send "$(t | shuf -n 1)" ''
            sleep 3600
        done;

List of heavy-sized pacman packages (could probably be improved)

``` bash
    LC_ALL=C pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | awk 'NR%2 { printf %s , -zsh; next; }1'| awk '{print , }'| sed 's/iB//' | sed 's/\.[0-9]*//' | sort -hk 2 | tail 
```

## xclip

To put output of a command into clipboard

``` bash
    <my_command> | xclip
```

To put it in the clipboard

``` bash
    xclip -selection clipboard
```

> or

``` bash
    xclip -se c
```

## xdg-open

To open a file with default GUI application

``` bash
    xdg-open <file>
```

## jobs

To stop a jobs to background in a shell: `CTRL-Z` To see all jobs in the
background of a shell:

``` bash
    jobs
```

To put a job in foreground (if no pid given, last job in background is
taken)

``` bash
    fg [pid]
```

## parallel

## base64

Encode:

``` bash
    base64 <stdin|file>
```

Decode

``` bash
    base64 -d <stidin|file>
```

## gdb

Inside gdb, to trigger on a syscall

``` bash
    catch syscall <syscall>
```

Inside gdb, inspect memory mappings

``` bash
    info proc map
```

## alias

``` bash
    alias command_name=command
```

## dd

## ansi

Escape codes for color and moving text into the terminal
<https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797>

## mitmproxy

``` bash
    mitmdump -s script.py
```

If you want to use on https/tls connexions, you need to accept the mitm
certificates in your browser. They are in

> `~/.mitmproxy/`

If this does not work, it could be that the certificates expired. In
this case, just delete the certificates and new one will appear at next
launch.

The basic script is:

        import mitmproxy
        def response(flow):
           pass

## at

``` bash
    echo "command_to_run" | at -M now + 1 min
```

To output to tty :

``` bash
    echo "command_to_run > $(tty)" | at -M now + <time_forward>
```

You can also specify an absolute time.

To see all running jobs

``` bash
    atq
```

You might need to launch the daemon

``` bash
    sudo systemd start atd
```

## notify-send

To send a desktop notification:

``` bash
    notify-send 'title' 'message'
```

You can specify an urgency with -u in `low` `normal` or `critical`.
`critical` never disappear on screen.

## shuf

Shuffles lines of stdin

``` bash
    shuf
```

Takes only n lines

``` bash
    shuf -n <n>
```

## cron

<https://www.linuxtricks.fr/wiki/cron-et-crontab-le-planificateur-de-taches>

## tmux

<https://tmuxcheatsheet.com/>

Attach to an already existing session:

``` bash
    tmux attach
```

Hiding a tmux pane:

> <https://unix.stackexchange.com/questions/145857/how-do-you-hide-a-tmux-pane>

## getopts

## date

    function countdown(){
       date1=$((`date +%s` + $1)); 
       while [ "$date1" -ge `date +%s` ]; do 
         echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
         sleep 0.1
       done
    }
    function stopwatch(){
      date1=`date +%s`; 
       while true; do 
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
        sleep 0.1
       done
    }

## cmake

Usually the flow is :

``` bash
    mkdir build
```

``` bash
    cd build
```

``` bash
    cmake <options> ..
```

For the build release you can do

> `-DCMAKE_BUILD_TYPE=[Debug,Release,RelWithDebInfo,MinSizeRel]`

To enable verbose ouput (and see actual compiling commands) when
building:

> `-DCMAKE_VERBOSE_MAKEFILE=TRUE`

You can either build with the generated makefile or with cmake

``` bash
    cmake --build <path/to/build/dir>
```

## ln

``` bash
    ln -s <file> <link>
```

To remove:

``` bash
    unlink <symlink_to_remove>
```

## pip

Upgrade all packages:

``` bash
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
```

## zsh

vim keybindings

``` bash
    bindkey -v
```

Remap escape

``` bash
    bindkey -M viins 'jk' vim-cmd-mode
```

## read

To read from stdin or a file
<https://stackoverflow.com/questions/6980090/how-to-read-from-a-file-or-stdin-in-bash>

## test

Check if something exists

``` bash
    test -e <file_desc>
```

``` bash
    [ -e <file_desc> ]
```

``` bash
    [[ -e <file_desc> ]]
```

Replace `-e` with `-f` to explicitly test a file, with `-d` for a
directory, with `-x` for an executable

To test multiple files

``` bash
    `[[ -f <file1> && -f <file2> ]]
```

To test if a string is nonzero

``` bash
    test -n <str>
```

``` bash
    [-n <str>]
```

``` bash
    [[-n <str>]]
```

## file descriptors {#file descriptors}

stdin ==> fd 0 stdout ==> fd 1 stderr ==> fd 2

To redirect a command stdout to null

``` bash
    cmd > /dev/null
```

To redirect a command stderr to null

``` bash
    cmd 2> /dev/null
```

To redirect all output to null

``` bash
    cmd > /dev/null 2>&1
```

## beep

<https://wiki.archlinux.org/title/PC_speaker#Run_as_non-root_user>

## mysql

Check the archwiki when in doubt. By default, the root password is
empty.

To connect to the daemon

``` bash
    sudo mysql -u root -p
```

To see all the databases

``` bash
    SHOW DATABASES;
```

Without quitting the command line

``` bash
    sudo mysql -u root -p -e "show databases;"
```

## inotifywait

To execute bash script when a file or a folder is modified:

    while inotifywait -q -e modify filename >/dev/null; do
        echo "filename is changed"
        # do whatever else you need to do
    done

    inotifywait -m -r -q --format '%w%f' <folder> | while read file
    do
      echo "something happened on path $file"
    done

## tr

Generate a list of random characters and numbers

``` bash
    tr -dc A-Za-z0-9 < /dev/urandom | head -c <character_count>
```

## opam

See all available packages

``` bash
    opam list -a
```

## dune

Start a exe project

``` bash
    dune init exe <project_name>
```

To build

``` bash
    dune build
```

## jq
