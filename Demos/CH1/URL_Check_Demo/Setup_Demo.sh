#!/bin/bash

echo "**********************************************"
echo "***** Copying Collections ********************"
cp collections/*.tar.gz /tmp

echo "**********************************************"
echo "***** Installing Collections ********************"
ansible-galaxy collection install -r collections/requirements.yml -p collections/


echo "**********************************************"
echo "***** Configuring ServerA ********************"
ansible-playbook Setup_Webserver.yml
## lab start example-chat  - To be used for the larger demo of use-cases

