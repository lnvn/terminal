#!/bin/bash

set -e # exit immediately if any command exit with a not zero status
# set -x # print command before execute (trace)

function help {
    echo '
    --backup
        Backup all file and directory listed in "items" inside install.sh script
        Currently we have [ ".vimrc" ".zshrc" ".tmux.conf" ".vim" ]
        Add file you wanna backup inside items list

    --link-config
        #####################################################################################################
        # IMPORTANT: You need to run --backup fisrt or cleanup all config file before you run --link-config #
        #####################################################################################################
        Soft link ".vimrc" ".zshrc" ".tmux.conf" ".vim" into \$HOME directory
    '
}


function backup_config {
    set -e
    echo "=== Backup config ==="

    echo "1. Create backup directory"
    backup_dir_name="backup_terminal_config"
    backup_dir_path=$HOME
    
    # create backup directory if not exist
    backup_dir=$backup_dir_path/$backup_dir_name
    if [ ! -d "$backup_dir" ]; then
        mkdir $backup_dir
        echo "created directory $backup_dir_name"
    else
        echo "directory $backup_dir_name existed"
    fi
    echo -e "\n"

    echo "2. Start backup config"
    current_date=$(date "+%Y%m%d_%H%M%S")
    backup_dir_version="$backup_dir/v$current_date/" # create version of backup in case we have change

    mkdir $backup_dir_version
    items=(".vimrc" ".zshrc" ".tmux.conf" ".vim") # list of config to backup
    for config_file in "${items[@]}"
    do
        if [ -e ~/$config_file ]; then
            echo "backing up: $config_file"
            mv ~/$config_file $backup_dir_version
        fi
    done
    echo "finish!"

    echo -e "\n"
}


function link_config {
    set -e
    echo "=== Linking dotfile ==="

    #
    # Get infor to write script

    echo "1. Linking .vimrc"
    ln -s $(pwd)/vimrc ~/.vimrc
    echo "2. Linking .zshrc"
    ln -s $(pwd)/zshrc ~/.zshrc
    echo "3. Linking .tmux.conf"
    ln -s $(pwd)/tmux.conf ~/.tmux.conf
    echo "4. Linking .vim"
    ln -s $(pwd)/vim ~/.vim

    if [ $? -eq 0 ]; then
        echo "The last command was successful."
    else
        echo "The last command had an error."
    fi

    echo -e "\n"
}

# execute 
if [ $# -eq 0 ]; then
    echo "Please specify argument, use --help for more detail"
else
    case "$1" in
        --help)
        help
        ;;
        --backup)
        backup_config
        ;;
        --link-config)
        link_config
        ;;
        *)
        echo "Specify wrong argument, use --help for more detail"
    esac
fi