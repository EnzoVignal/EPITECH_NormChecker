#!/usr/bin/sh

cp -r mouli ~/.mouli
if [ $SHELL == "/bin/zsh" ] || [ $SHELL == "/usr/bin/zsh" ]
then
    echo "alias norme='clear && cp ~/.mouli/norme.py ./; cp ~/.mouli/norme_auto.sh ./ && ./norme_auto.sh && rm -f norme.py norme_auto.sh'" >> ~/.zshrc
echo "Install complete. Now source ~/.zshrc."
elif [ $SHELL == "/bin/bash" ] || [ $SHELL == "/usr/bin/bash" ]
then
   echo "alias norme='clear && cp ~/.mouli/norme.py ./; cp ~/.mouli/norme_auto.sh ./ && ./norme_auto.sh && rm -f norme.py norme_auto.sh'" >> ~/.bashrc
echo "Install complete. Now source ~/.bashrc."
else
echo "Can't install Epi-Norme with your shell."
fi
