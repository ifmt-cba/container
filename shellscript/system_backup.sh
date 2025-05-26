#!/usr/bin/env bash
#VARIABLES --------------------------------------------------------------- #
ROOT_UID=0
timestamp=`date +%d-%m-%y-%H:%M`
dir_source=/etc
dir_dest=/backup
#FUNCTIONS --------------------------------------------------------------- #
compact() {
   tar -cvf $dir_dest/bkp-$timestamp-usr.tar.gz $dir_source
}
isroot() {
   if [ "$UID" -ne "$ROOT_UID" ]
then
   echo ""
        echo "Precisa ser root para executar o backup!"
   echo ""
        exit $E_NOTROOT
fi
}
#CODE -------------------------------------------------------------------- #
isroot
if [ -d $dir_dest ]
then
   compact
else
   if [ -f $dir_dest ]
   then
      echo "$dir_dest é um arquivo, precisa ser um diretório."
      sleep 2
   else
      mkdir $dir_dest
      compact
   fi
fi
#END -------------------------------------------------------------------- #
