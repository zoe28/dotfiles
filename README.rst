Dotfiles
========

How to install:
---------------

.. role:: bash(code)
   :language: bash

1. Clone the repository
2. Run :bash:`bash install.sh`
3. Run :bash:`source ~/.bashrc`
4. Run :bash:`vim` then run :bash:`:BundleInstall`
5. Run :bash:`vim ~/.gitconfig` and change the name, username and email

FAQ
---

*E185: Cannot find color scheme*

.. role:: bash(code)
   :language: bash

Did you run :bash:`:BundleInstall`? If so, check that :bash:`Bundle 'flazz/vim-colorschemes'` is included in the .vimrc
