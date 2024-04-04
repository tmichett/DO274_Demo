#!/bin/bash

echo "**********************************************"
echo "***** Copying Collections ********************"
cp collections/*.tar.gz /tmp

echo "**********************************************"
echo "***** Installing Collections ********************"
ansible-galaxy collection install -r collections/requirements.yml -p collections/


echo "**********************************************"
echo "***** Clone Repo from Github *****************"

git config --global credential.helper store
mkdir /tmp/Github
cd /tmp/Github
git clone https://github.com/tmichett/do274_eda_rulebooks.git
cd /tmp/Github/do274_eda_rulebooks


echo "**********************************************"
echo "***** Push Repository to Gitlab ***************"
echo "**********************************************"

echo ""

echo "Creating Gitlab Project"

cd /home/student/Github/DO274_Demo/Demos/Setup/Gitlab

#Install Pre-Req Python Modules for Gitlab Ansible Modules
sudo python -m pip install python-gitlab
sudo python -m pip install requests

#Install Community General Colelction for Ansible to provide Gitlab Ansible Module
ansible-galaxy collection install collections/community-general-5.5.0.tar.gz -p ./collections/

#Run Ansible Playbook with Correct Python Interpreter
ansible-playbook Create_Gitlab_Project.yml  -e 'ansible_python_interpreter=/usr/bin/python'

echo "Pushing DO274 Demo to Gitlab Now"
echo "UN/PW Combination"
echo "UN: student"
echo "PW: Stud3nt123"

cd /tmp/Github/do274_eda_rulebooks
git remote add gitlab https://git.lab.example.com/student/DO274_Demo
git remote set-url origin https://"student:Stud3nt123"@git.lab.example.com/student/DO274_Demo
git push -u gitlab main


echo "**********************************************"
echo "***** Pulling Repository from Gitlab *********"
echo "**********************************************"


mkdir /home/student/Gitlab
cd /home/student/Gitlab
git clone https://git.lab.example.com/student/DO274_Demo.git


echo "**********************************************"
echo "***** Setting Up Ansible Controller  *********"
echo "**********************************************"

cd /home/student/Github/DO274_Demo/Demos/Setup/Gitlab
ansible-playbook Create_SCM_Creds.yml
ansible-playbook Create_Project.yml
ansible-playbook Create_Jobs.yml