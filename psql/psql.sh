# sudo apt install -y postgresql-common
# sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
# sudo apt update
# sudo apt -y upgrade
# sudo apt install -y postgresql
sudo -u postgres createuser -s anonymous
createdb -U anonymous anonymous
dropdb anonymous
sudo -u postgres dropuser anonymous
sudo -u postgres createuser -s anonymous
createdb anonymous
