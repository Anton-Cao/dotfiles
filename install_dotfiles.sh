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
    
    if [ ! -f ~/.zshrc.local ]; then
        echo "Linking .zshrc.local"
        ln -s $ZSH_FILE ~/.zshrc.local 
    else
        echo ".zshrc.local already exists"
    fi

    if [ ! -f ~/.zsh-theme.local ]; then
        echo "Linking .zsh-theme.local"
        ln -s $ZSH_THEME ~/.zsh-theme.local 
    else
        echo ".zsh-theme.local already exists"
    fi
    
    if ! fgrep -q local ~/.zshrc; then
        echo "Sourcing .zshrc.local in .zshrc"
        echo "source ~/.zshrc.local" >> ~/.zshrc
    fi

    if ! fgrep -q theme ~/.zshrc; then
        echo "Sourcing .zsh-theme.local in .zshrc"
        echo "source ~/.zsh-theme.local" >> ~/.zshrc
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
    
    if [ ! -f ~/.bashrc.local ]; then
        echo "Linking .bashrc.local"
        ln -s $BASH_FILE ~/.bashrc.local 
    else
        echo ".bashrc.local already exists"
    fi
    
    if ! fgrep -q local ~/.bashrc; then
        echo "Sourcing .bashrc.local in .bashrc"
        echo "source ~/.bashrc.local" >> ~/.bashrc
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

if [ ! -f ~/.vimrc.local ]; then
    echo "Linking .vimrc.local";
    ln -s $VIM_FILE ~/.vimrc.local 
else
    echo ".vimrc.local already exists"
fi

if ! fgrep -q vimrc.local ~/.vimrc; then
    echo "Sourcing .vimrc.local in .vimrc";
    echo "source ~/.vimrc.local" >> ~/.vimrc
fi

if [ ! -f ~/.tmux.conf ]; then
    echo "Creating .tmux.conf file";
    touch ~/.tmux.conf
fi

if [ ! -f ~/.tmux.conf.local ]; then
    echo "Linking .tmux.conf.local";
    ln -s $TMUX_FILE ~/.tmux.conf.local 
else
    echo ".tmux.conf.local already exists"
fi

if ! fgrep -q tmux.conf.local ~/.tmux.conf; then
    echo "Sourcing .tmux.conf.local in .tmux.conf";
    echo "source-file ~/.tmux.conf.local" >> ~/.tmux.conf
fi

tmux source-file ~/.tmux.conf
