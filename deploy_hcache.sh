#!/bin/bash

#Deploy hcache app

#echo deploy hcache script $1

#mkdir -p /usr/local/hcache
#cp $1 /usr/local/hcache

#service hcache start

echo binary file "$1"
echo config file "$2"

# deploing to m
for i in 4 5 6 7 8 9 10
do
    echo " - - - - - - - - - - -  Deploing to m$i  - - - - - - - - - - -  "
    echo scp $1 $2 deploy@m$i.c8.net.ua:/tmp

    scp $1 deploy@m$i.c8.net.ua:/tmp
    scp $2 deploy@m$i.c8.net.ua:/tmp
    ssh deploy@m$i.c8.net.ua 'sudo /etc/init.d/node_hcache stop; sudo service hcache stop; sudo mkdir -p /usr/local/hcache; sudo rm -f /usr/local/hcache/hcache; ssh-keyscan 212.1.66.240 >> ~/.ssh/known_hosts; sudo chmod 777 /usr/local/hcache/; sudo cp /tmp/config.toml /usr/local/hcache/; sudo cp /tmp/hcache /usr/local/hcache/; sudo /usr/local/hcache/hcache install; sudo service hcache restart; rm -f /tmp/hcache; rm -f /tmp/config.toml '
done

# deploing to p
for i in 1 2
do
    echo " - - - - - - - - - - -  Deploing to p$i  - - - - - - - - - - -  "
    echo scp $1 deploy@p$i.c8.net.ua:/tmp
    scp $1 deploy@p$i.c8.net.ua:/tmp
    scp $2 deploy@p$i.c8.net.ua:/tmp
    ssh deploy@p$i.c8.net.ua 'sudo /etc/init.d/node_hcache stop; sudo service hcache stop; sudo mkdir -p /usr/local/hcache; sudo rm -f /usr/local/hcache/hcache; ssh-keyscan 212.1.66.240 >> ~/.ssh/known_hosts; sudo chmod 777 /usr/local/hcache/; sudo cp /tmp/config.toml /usr/local/hcache/; sudo cp /tmp/hcache /usr/local/hcache/; sudo /usr/local/hcache/hcache install; sudo service hcache restart; rm -f /tmp/hcache; rm -f /tmp/config.toml '


done

# deploing to node1
    echo " - - - - - - - - - - -  Deploing to node1  - - - - - - - - - - -  "
    echo scp $1 deploy@node1.c8.net.ua:/tmp
    scp $1 deploy@node1.c8.net.ua:/tmp
    scp $2 deploy@node1.c8.net.ua:/tmp
    ssh deploy@node1.c8.net.ua 'sudo /etc/init.d/node_hcache stop; sudo service hcache stop; sudo mkdir -p /usr/local/hcache; sudo rm -f /usr/local/hcache/hcache; ssh-keyscan 212.1.66.240 >> ~/.ssh/known_hosts; sudo chmod 777 /usr/local/hcache/; sudo cp /tmp/config.toml /usr/local/hcache/; sudo cp /tmp/hcache /usr/local/hcache/; sudo /usr/local/hcache/hcache install; sudo service hcache restart; rm -f /tmp/hcache; rm -f /tmp/config.toml '


echo " - - - - - - - - - - -  ===== Done =====  - - - - - - - - - - -  "
~
~