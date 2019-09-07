BASH_FILE="$(pwd)/bashrc"
VIM_FILE="$(pwd)/vimrc"
TMUX_FILE="$(pwd)/tmux"

if [ ! -f ~/.bashrc ]; then
    echo "Creating .bashrc file";
    touch ~/.bashrc
fi

if [ -z $(fgrep -q bashrc ~/.bash_profile) ]; then
    echo "Sourcing .bashrc in .bash_profile";
    echo "source ~/.bashrc" >> ~/.bash_profile
fi

if [ ! -f ~/.bashrc.local ]; then
    echo "Linking .bashrc.local"
    ln -s $BASH_FILE ~/.bashrc.local 
else
    echo ".bashrc.local already exists"
fi

if [ -z $(fgrep -q bashrc.local ~/.bashrc) ]; then
    echo "Sourcing .bashrc.local in .bashrc"
    echo "source ~/.bashrc.local" >> ~/.bashrc
fi

source ~/.bashrc

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

if [ -z $(fgrep -q vimrc.local ~/.vimrc) ]; then
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
    ln -s $TMUX_FILE ~/.tmux.conf.local 
else
    echo ".tmux.conf.local already exists"
fi

if [ -z $(fgrep -q tmux.conf.local ~/.tmux.conf) ]; then
    echo "Sourcing .tmux.conf.local in .tmux.conf";
    echo "source-file ~/.tmux.conf.local" >> ~/.tmux.conf
fi

tmux source-file ~/.tmux.conf
