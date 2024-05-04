Print variables in file without comments

awk '$1 ~ /^[^;#]/' inventory.txt
