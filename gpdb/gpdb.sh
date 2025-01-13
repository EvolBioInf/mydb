cat gpdb.sql sqlite.sql |
    sqlite3 gpdb
mysql -u anonymous -e "create database if not exists gpdb"
cat gpdb.sql mysql.sql |
    mysql -u anonymous gpdb --local_infile=1
db=$(psql -U anonymous -c "\list" |
           awk '$1=="gpdb"{print $1}')
if [[ $db != "gpdb" ]]; then
    createdb -U anonymous gpdb
fi
cat gpdb.sql psql.sql |
    psql -U anonymous -d gpdb -q
