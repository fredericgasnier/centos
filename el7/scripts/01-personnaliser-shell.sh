#!/bin/bash
#
# 01-personnaliser-shell.sh
#
# Nicolas Kovacs, 2019
#
# Ce script installe une invite de commande personnalisée et une série d'alias
# pratiques pour root et les utilisateurs du système. Il ajoute également une
# série d'options par défaut à l'éditeur Vim.

. source.sh

# Personnalisation du shell Bash pour root
echo
echo -e ":: Configuration du shell Bash pour l'administrateur... \c"
sleep $DELAY
cat $CWD/../config/bash/bashrc-root > /root/.bashrc
ok

# Personnalisation du shell Bash pour les utilisateurs
echo "::"
echo -e ":: Configuration du shell Bash pour les utilisateurs... \c"
sleep $DELAY
cat $CWD/../config/bash/bashrc-users > /etc/skel/.bashrc
if [ ! -z "$(ls -A /home)" ]; then
  for UTILISATEUR in $(ls /home); do
    cat $CWD/../config/bash/bashrc-users > /home/$UTILISATEUR/.bashrc
    chown $UTILISATEUR:$UTILISATEUR /home/$UTILISATEUR/.bashrc
  done
fi
ok

# Quelques options pratiques pour Vim
echo "::"
echo -e ":: Configuration de Vim... \c"
sleep $DELAY
cat $CWD/../config/vim/vimrc > /etc/vimrc
ok

echo

exit 0
