Print variables in file without comments

awk '$1 ~ /^[^;#]/' inventory.txt


Perform Installation

lab start install-installation

tar xzf ansible-automation-platform-setup-bundle-2.4-6-x86_64.tar.gz

mv ansible-automation-platform-setup-bundle-2.4-6-x86_64 aap2.4

cd aap2.4

cp ~/DO274_Demos/Demos/Installation/inventory .
