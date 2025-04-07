sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
sudo apt update
sudo apt -y upgrade
sudo apt install -y postgresql
sudo systemctl restart postgresql.service
sudo -u postgres createuser -s anonymous
createdb -U anonymous anonymous
dropdb -U anonymous
sudo -u postgres dropuser anonymous
sudo -u postgres createuser -s anonymous
createdb -U anonymous
