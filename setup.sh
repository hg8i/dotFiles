
# setup script for linkii

unlink ~/.vimbrc; ln -s dotFiles/.vimbrc ../.vimbrc
unlink ~/.vimrc; ln -s dotFiles/.vimrc ../.vimrc
unlink ~/.xinitrc; ln -s dotFiles/.xinitrc ../.xinitrc
unlink ~/.bashrc; ln -s dotFiles/.bashrc ../.bashrc
unlink ~/.Xresources; ln -s dotFiles/.Xresources ../.Xresources
unlink ~/.xbindkeysrc; ln -s dotFiles/.xbindkeysrc ../.xbindkeysrc

unlink ~/.Xmodmap_t470s; ln -s dotFiles/.Xmodmap_t470s ../.Xmodmap_t470s
unlink ~/.Xmodmap_hhkb; ln -s dotFiles/.Xmodmap_hhkb ../.Xmodmap_hhkb

unlink ~/redshift.conf; ln -s dotFiles/redshift.conf ../redshift.conf

unlink ~/.i3; ln -s dotFiles/.i3 ../.i3
