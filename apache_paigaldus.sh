#!/bin/bash

# Apache2 paigaldusskript
# skript kontrollib kas apache2 on paigaldatud, kui ei siis paigaldab selle

if dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed" > /dev/null; then
    echo "Apache2 on juba paigaldatud."
    systemctl status apache2 | head -n 10
else
    echo "Apache2 ei ole paigaldatud. Paigaldan Apache2..."

    sudo apt update
    sudo apt install -y apache2
    echo "Apache2 paigaldamine on lõpetatud."

    systemctl status apache2 | head -n 10
fi
