q="select * from genome"
echo "$q" | sqlite3 ../gpdb/gpdb
echo "$q" | mysql -u anonymous gpdb
echo "$q" | psql -U anonymous gpdb
