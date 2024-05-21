#!/bin/bash

echo "**********************************************"
echo "***** Cleanup of GitOps Demo *****************"
lab finish example-gitops

cp collections/*.tar.gz /tmp

echo "**********************************************"
echo "***** Installing Collections ********************"
ansible-galaxy collection install -r collections/requirements.yml -p collections/


echo "**********************************************"
echo "***** Configuring ServerA ********************"
ansible-playbook Setup_Webserver.yml
lab start example-chat

