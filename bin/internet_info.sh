#!/bin/bash

# Internal IP
IP=$(hostname -I | awk {'print $1}')

# Packet loss check
timeout 7s ping -c 5 google.com | grep 'loss' | awk '{print $6}' > /dev/null 2>&1
if [[ $? -eq 0 ]]
    then
        PL=$(ping -c 5 google.com | grep 'loss' | awk '{print $6}')
        PL+=" p/l"
    else
        PL=""
fi

# Speedtest
DL=$(speedtest-cli --simple | awk 'NR==2{print $2}')
UP=$(speedtest-cli --simple | awk 'NR==3{print $2}')

# Public IP
PUB_IP=$(speedtest-cli --json | jq -r .client.ip)

if [[ "$PUB_IP" = ";; connection timed out; no servers could be reached" ]]; then 
    PUB_IP="Not Available"
elif [[ "$PUB_IP" = "" ]]; then
    PUB_IP="No external access"
else 
    PUB_IP=$(speedtest-cli --json | jq -r .client.ip)
fi
 
INTERNET=''

#internet_info=`iwconfig eth0 | grep "Signal level" | awk '{print $2}' | sed 's/-//g'`

# if [[ $internet_info -lt 20 ]]; then
#     echo -n '#[fg=colour150]'
# elif [[ $internet_info -lt 30 ]]; then
#     echo -n '#[fg=colour155]'
# elif [[ $internet_info -lt 40 ]]; then
#     echo -n '#[fg=colour160]'
# elif [[ $internet_info -lt 50 ]]; then
#     echo -n '#[fg=colour163]'
# else
#     echo -n '#[fg=colour150]'
# fi

echo -n "#[fg=colour150]$INTERNET  #[fg=colour81]$PL #[fg=colour86]$DL Mbit/s $UP Mbit/s #[fg=colour197]$IP | $PUB_IP"
