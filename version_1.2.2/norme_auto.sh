#!/bin/sh

getScriptPath () {
    if [ -d ${0%/*} ]
    then
        abspath=$(cd ${0%/*} && echo $PWD/${0##*/})
        pathOnly=`dirname "$abspath"`
    else
        progdir=`dirname $0`
        cd $progdir
        pathOnly=$PWD
    fi

    echo $pathOnly;
    return
}
norme=$(getScriptPath)"/norme.py"
option="-score -libc -printline -return"

echo -e "\033[0;32;40m------------------------------ Checking the norme TWICE ------------------------------"
echo -e "Modifié par maillo_a\nUne suggestion ou un bug ?\nflavien.maillot@epitech.eu\n\033[0m"
echo -e "\033[0;36;40mChecking *.c files...\033[0m"
files=`find ./ -type f \( -name "*.c" ! -name "*op.c" \)`
python $norme $files $option
echo -e "\033[0;36;40m\nChecking *.h files...\033[0m"
files=`find ./ -type f -name "*.h"`
python $norme $files $option
echo -e "\033[0;36;40m\nChecking Makefiles...\033[0m"
files=`find ./ -type f -name "Makefile"`
python $norme $files $option
tempfile=$(find ./ -type f -name "*~" | wc -l)
if [ $tempfile != 0 ]
then
echo -e "\033[0;31;40m\nTemporary file found !\033[0m"
echo -e "\033[0;33;40m"; find ./ -type f -name "*~"; echo -e "\033[0m"
fi
tempfile=$(find ./ -type f -name "*#" | wc -l)
if [ $tempfile != 0 ]
then
echo -e "\033[0;31;40mOther temporary file found !\033[0m"
echo -e "\033[0;33;40m"; find ./ -type f -name "*#"; echo -e "\033[0m"
fi
echo "--------------------------------------------------------------------------------"
