BASH_FILE="$(pwd)/bashrc"
ZSH_FILE="$(pwd)/zshrc"
ZSH_THEME="$(pwd)/agnoster.zsh-theme"
VIM_FILE="$(pwd)/vimrc"
TMUX_FILE="$(pwd)/tmux"

if [[ $SHELL == *zsh ]]; then
    echo "ZSH";
    if [ ! -f ~/.zshrc ]; then
        echo "Creating .zshrc file";
        touch ~/.zshrc
    fi
    
    if ! fgrep -q zshrc ~/.zprofile; then
        echo "Sourcing .zshrc in .zprofile";
        echo "source ~/.zshrc" >> ~/.zprofile
    fi
    
    if [ ! -f ~/.zshrc.dotfiles ]; then
        echo "Linking .zshrc.dotfiles"
        ln -s $ZSH_FILE ~/.zshrc.dotfiles
    else
        echo ".zshrc.dotfiles already exists"
    fi

    if [ ! -f ~/.zsh-theme.dotfiles ]; then
        echo "Linking .zsh-theme.dotfiles"
        ln -s $ZSH_THEME ~/.zsh-theme.dotfiles
    else
        echo ".zsh-theme.dotfiles already exists"
    fi
    
    if ! fgrep -q dotfiles ~/.zshrc; then
        echo "Sourcing .zshrc.dotfiles in .zshrc"
        echo "source ~/.zshrc.dotfiles" >> ~/.zshrc
    fi

    if ! fgrep -q theme ~/.zshrc; then
        echo "Sourcing .zsh-theme.dotfiles in .zshrc"
        echo "source ~/.zsh-theme.dotfiles" >> ~/.zshrc
    fi
    
    source ~/.zshrc
elif [[ $SHELL == *bash ]]; then
    echo "BASH";
    if [ ! -f ~/.bashrc ]; then
        echo "Creating .bashrc file";
        touch ~/.bashrc
    fi
    
    if ! fgrep -q bashrc ~/.bash_profile; then
        echo "Sourcing .bashrc in .bash_profile";
        echo "source ~/.bashrc" >> ~/.bash_profile
    fi
    
    if [ ! -f ~/.bashrc.dotfiles ]; then
        echo "Linking .bashrc.dotfiles"
        ln -s $BASH_FILE ~/.bashrc.dotfiles
    else
        echo ".bashrc.dotfiles already exists"
    fi
    
    if ! fgrep -q dotfiles ~/.bashrc; then
        echo "Sourcing .bashrc.dotfiles in .bashrc"
        echo "source ~/.bashrc.dotfiles" >> ~/.bashrc
    fi
    
    source ~/.bashrc
else
    echo "UNRECOGNIZED SHELL $SHELL";
    exit
fi


if [ ! -f ~/.vimrc ]; then
    echo "Creating .vimrc file";
    touch ~/.vimrc
fi

if [ ! -f ~/.vimrc.dotfiles ]; then
    echo "Linking .vimrc.dotfiles";
    ln -s $VIM_FILE ~/.vimrc.dotfiles
else
    echo ".vimrc.dotfiles already exists"
fi

if ! fgrep -q vimrc.dotfiles ~/.vimrc; then
    echo "Sourcing .vimrc.dotfiles in .vimrc";
    echo "source ~/.vimrc.dotfiles" >> ~/.vimrc
fi

if [ ! -f ~/.tmux.conf ]; then
    echo "Creating .tmux.conf file";
    touch ~/.tmux.conf
fi

if [ ! -f ~/.tmux.conf.dotfiles ]; then
    echo "Linking .tmux.conf.dotfiles";
    ln -s $TMUX_FILE ~/.tmux.conf.dotfiles
else
    echo ".tmux.conf.dotfiles already exists"
fi

if ! fgrep -q tmux.conf.dotfiles ~/.tmux.conf; then
    echo "Sourcing .tmux.conf.dotfiles in .tmux.conf";
    echo "source-file ~/.tmux.conf.dotfiles" >> ~/.tmux.conf
fi

tmux source-file ~/.tmux.conf
