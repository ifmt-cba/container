#First, the shell wrapper:
#===== begin hashit.sh =====
#!/usr/bin/bash

#Verifying python instalation
if ! apt list --installed python3 2>/dev/null | grep installed
then
        echo "Python3 not installed"
        echo "Installing Python3"
        apt install --assume-yes python3
else
        echo "[OK] - Python3"
fi

#Verifying pip instalation
if ! apt list --installed python3-pip 2>/dev/null | grep installed
then
        echo "PIP not installed"
        echo "Installing PIP"
        apt install --assume-yes python3-pip
else
        echo "[OK] - PIP"
fi

#Verifying bcrypt library instalation
if ! pip list | grep py-bcrypt
then
        echo "bcrypt library not installed"
        echo "Installing bcrypt"
        pip install py-bcrypt
else
        echo "[OK] - bcrypt library"
fi

echo ""
for x in $@
        do
        echo "Password: ${x}"
        python3 password.py ${x}
        echo
        done
#====== end  hashit.sh =====
#This allows me to input multiple strings.