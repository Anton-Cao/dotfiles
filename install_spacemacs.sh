#!/bin/bash

cd ~

if [ ! -f "~/.spacemacs" ]; then
    mv .emacs.d .emacs.d.bak
    mv .emacs .emacs.bak
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

echo "Copy contents of `spacemacs_user_config` into `.spacemacs`"
