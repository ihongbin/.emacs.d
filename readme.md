How to Install GNU Emacs 29.4 in Ubuntu 24.04, 22.04 via PPA

sudo add-apt-repository ppa:ubuntuhandbook1/emacs
sudo apt install emacs emacs-common

sudo apt remove --autoremove emacs emacs-common
sudo add-apt-repository --remove ppa:ubuntuhandbook1/emacs


chinese font: https://github.com/lxgw/LxgwWenKai?tab=readme-ov-file
code font: https://www.nerdfonts.com/font-downloads

install in linux
fc-list
mkdir /usr/share/fonts/myfons
wget xxx.fonturl
tar -xvzf filename.tar.gz
cp ~/Downloads/*.ttf /usr/share/fonts/myfons
fc-cache -f -v

emacs check all avaliable fonts

(dolist (font (x-list-fonts "*"))
  (insert (format "%s\n" font)))

-LXGW-LXGW WenKai Mono-medium-normal-normal
-LXGW-LXGW WenKai Mono-regular-normal-normal
-LXGW-LXGW WenKai Mono-light-normal-normal

Iosevka Nerd Font Mono


change key binding
http://xahlee.info/emacs/emacs/emacs_hyper_super_keys.html

(setq  x-meta-keysym 'super
       x-super-keysym 'meta)

(setq x-super-keysym 'super)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-x") 'kill-region)


emacs --daemon
emacsclient -c
emacsclient -r
emacsclient -e '(save-buffers-kill-emacs)'


chinese input
apt install librime-dev
https://github.com/DogLooksGood/emacs-rime
