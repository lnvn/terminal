#!/bin/bash

set -e # exit immediately if any command exit with a not zero status
# set -x # print command before execute (trace)

# global_var
items=("vimrc" "zshrc" "tmux.conf" "vim" "config/nvim" "oh-my-zsh/themes/dracula.zsh-theme") # list of config file

function help {
    list_item=$(printf "'%s' " "${items[@]}")
    echo "
    $items
    --backup
        Backup all file and directory listed in "items" inside install.sh script
        Currently we have [ $list_item ]
        Add file you wanna backup inside items list

    --link-config
        #####################################################################################################
        # IMPORTANT: You need to run --backup fisrt or cleanup all config file before you run --link-config #
        #####################################################################################################
        Soft link $list_item into \$HOME directory
    
    --backup-and-link
        Include backup and then link config file in one argument option

    --link-vimrc
        Only link .vimrc (vim) with settings.vim (neovim) for persional testing
    
    --check_package
        Check if all needed package are installed or not
    "
}


function backup_config {
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
    # get config file in "items" list and backup
    for config_file in "${items[@]}"
    do
        if [ -e ~/.$config_file ]; then
            echo "backing up: .$config_file"
            mv ~/.$config_file $backup_dir_version
        fi
    done
    echo "finish!"

    echo -e "\n"
}

function link_config {
    echo "=== Linking dotfile ==="

    # get config file in "items" list and soft link to local
    i=1 # use for count
    for config_file in "${items[@]}"
    do
        echo "$i. Linking .$config_file"
        ln -s $(pwd)/$config_file ~/.$config_file
        ((i++)) # use (( )) to perform arithmetic operations
    done

    echo -e "\n"
}

function sub_link_config {
    # Copy vimrc content to config/nvim/settings.vim
    echo "copy .vimrc -> .config/nvim/settings.vim"
    cat $(pwd)/vimrc > ~/.config/nvim/configs/settings.vim

    echo -e "\n"
}

# Check and install ZSH
function verify_zsh {
    if command -v zsh &> /dev/null; then
        echo "ZSH is installed"
        return 0
    else
        echo "ZSH not found, do you wanna install it, type \"yes\" to approve:" && read -r response
        if [ $response == "yes" ]; then
            sudo apt install zsh -y
            echo "---> Installed ZSH"
            return 0
        else
            echo "Skipped install ZSH"
            return 1
        fi
    fi
}

# Check and install Oh-my-zsh
function verify_omz {
    if [[ -d `$HOME/.oh-my-zsh` ]] &> /dev/null ; then
        echo "Oh-my-zsh not found, do you wanna install it, type \"yes\" to approve:" && read -r response
        if [ $response == "yes" ]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            echo "---> Installed Oh-my-zsh"
            return 0
        else
            echo "Skipped install Oh-my-zsh"
            return 1
        fi
    else
        echo "Oh-my-zsh is installed"
        return 0
    fi
}

# Check and install ZSH Autosuggestions
# function verify_autosuggest {
#     echo `$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions`
#     if [[ -d `$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions` ]] &> /dev/null; then
#         echo "ZSH Autosuggestions not found, do you wanna install it, type \"yes\" to approve:" && read -r response
#         if [ $response == "yes" ]; then
#             echo "---> Installed ZSH Autosuggestions"
#         else
#             echo "Skipped install ZSH Autosuggestions"
#         fi
#     else
#         echo "ZSH Autosuggestions is installed"
#     fi
# }

function check_package {
    # check if ZSH and Oh-my-zsh are installed
    verify_zsh && verify_omz
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
        sub_link_config
        ;;
        --backup-and-link)
        backup_config
        link_config
        sub_link_config
        ;;
        --link-vimrc)
        sub_link_config
        ;;
        --check-package)
        check_package
        ;;
        *)
        echo "Specify wrong argument, use --help for more detail"
        ;;
    esac
fi

# update install fzf in future
# $brew install fzf (which can help us to fuzzy search history use Ctrl + r)