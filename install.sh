#!/usr/bin/sh

cp -r mouli ~/.mouli
if [ $SHELL == "/bin/zsh" ]
then
   echo "alias norme='clear && cp ~/.mouli/norme.py ./; cp ~/.mouli/norme_auto.sh ./ && ./norme_auto.sh && rm -f norme.py norme_auto.sh'" >> ~/.zshrc
elif [ $SHELL == "/bin/bash" ]
then
   echo "alias norme='clear && cp ~/.mouli/norme.py ./; cp ~/.mouli/norme_auto.sh ./ && ./norme_auto.sh && rm -f norme.py norme_auto.sh'" >> ~/.bashrc
else
echo "Can't install Epi-Norme with your shell."
fi
echo "Install complete. Now source ~/.zshrc or ~/.bashrc."
