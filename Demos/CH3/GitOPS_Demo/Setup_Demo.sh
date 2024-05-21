#!/bin/bash

echo "**********************************************"
echo "***** Copying Collections ********************"
cp collections/*.tar.gz /tmp

echo "**********************************************"
echo "***** Installing Collections ********************"
ansible-galaxy collection install -r collections/requirements.yml -p collections/

echo "**********************************************"
echo "***** Configuring EDA and Gitlab   ***********"
lab start example-gitops

echo "**********************************************"
echo "***** Configuring BASHC Git Prompt ***********"
cd /home/student/Github/DO274_Demo/Demos/CH3/GitOPS_Demo/Gitprompt
ansible-playbook Git_Tools_Setup.yml

echo "**********************************************"
echo "***** Preparing Demo Items Cloning ***********"
cd ~/git-repos
git clone git@git.lab.example.com:student/gitops_automation
git clone git@git.lab.example.com:student/gitops_application
cd gitops_automation/


