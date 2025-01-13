curl https://dev.mysql.com/downloads/repo/apt/ |
    grep apt-config
wget https://dev.mysql.com/get/mysql-apt-config_0.8.33-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.33-1_all.deb
sudo apt update
sudo atp install mysql-community-server
mysql -e "show global variables like 'local_infile'"
mysql -e "set global local_infile=true"
mysql -e "show global variables like 'local_infile'"
