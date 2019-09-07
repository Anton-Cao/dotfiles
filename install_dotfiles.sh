BASH_FILE="bashrc"
VIM_FILE="vimrc"
TMUX_FILE="tmux"

if [ ! -f ~/.bashrc ]; then
    echo "Creating .bashrc file";
    touch ~/.bashrc
fi

if [ ! fgrep -q bashrc ~/.bash_profile]; then
    echo "Sourcing .bashrc in .bash_profile";
    echo "source ~/.bashrc" >> ~/.bash_profile
fi

if [ ! -f ~/.bashrc.local ]; then
    echo "Linking .bashrc.local"
    ln -s ~/.bashrc.local $BASH_FILE
else
    echo ".bashrc.local already exists"
fi

if [ ! fgrep -q bashrc.local ~/.bashrc ]; then
    echo "Sourcing .bashrc.local in .bashrc"
    echo "source ~/.bashrc.local" >> ~/.bashrc
fi

source ~/.bash_profile

if [ ! -f ~/.vimrc ]; then
    echo "Creating .vimrc file";
    touch ~/.vimrc
fi

if [ ! -f ~/.vimrc.local ]; then
    echo "Linking .vimrc.local";
    ln -s ~/.vimrc.local $VIM_FILE
else
    echo ".vimrc.local already exists"
fi

if [ ! fgrep -q vimrc.local ~/.vimrc ]; then
    echo "Sourcing .vimrc.local in .vimrc";
    echo "source ~/.vimrc.local" >> ~/.vimrc
fi

# TMUX
if [ ! -f ~/.tmux.conf ]; then
    echo "Creating .tmux.conf file";
    touch ~/.tmux.conf
fi

if [ ! -f ~/.tmux.conf.local ]; then
    echo "Linking .tmux.conf.local";
    ln -s ~/.tmux.conf.local $TMUX_FILE
else
    echo ".tmux.conf.local already exists"
fi

if [ ! fgrep -q tmux.conf.local ~/.tmux.conf ]; then
    echo "Sourcing .tmux.conf.local in .tmux.conf";
    echo "source-file ~/.tmux.conf.local" >> ~/.tmux.conf
fi

tmux source-file ~/.tmux.conf
