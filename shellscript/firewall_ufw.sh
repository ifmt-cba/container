#!/usr/bin/env bash
#VARIABLES --------------------------------------------------------------- #
STATUS=`systemctl status ufw | grep -i "running" | cut -d " " -f 4,5,6`
START=`systemctl start ufw`
SHOW=`ufw show added command`
RELOAD=`ufw --reload`
#CODE -------------------------------------------------------------------- #
clear
while true;do
echo " "
echo "Welcome at $0"
echo " "
echo "Choose a option below to start!
1- ensure ufw service is installed
2- show ufw status
3- start ufw service 
4- show available rules
5- add new rules
6- reload ufw service
0- Exit script"
echo " "
echo -n "selected option: "
read option
case $option in
   1) 
      if [ -x `command -v ufw` ]
      then
         echo " "
         echo "Installed and latest version"
         sleep 2
         echo " "
      else
         echo "Not installed yet"
         sleep 2
         echo " "
      fi
      ;;
   2)

      echo " "
      echo "ufw status: $STATUS"
      ;;

   3)
      echo "Starting service..."
      sleep 2
      echo "$START"
      ;;
   4)
      echo -n "Rules available... $SHOW"
         echo " "
      ;;
   5)
      echo -n "Type a rule: "
      read rule
      if [ -z $rule ]
      then   
         echo "You don't type nothing"
      else
         echo -n "Your rule: $rule"   
         echo " "
         ufw --add-service=$rule --permanent
      fi
      echo 
      ;;
   6)
      echo "Reloading..."
      sleep 2
      echo "$RELOAD"
      ;;
   *)
      echo "No input found please, try again!"
      ;;
esac
done
#END ------------------------------------------------------------------ #
