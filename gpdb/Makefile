db = $(shell psql -U anonymous -c "\list" | grep gpdb | cut -f 1 -d '|' | sed 's/ //g')
all: gpdb.ps gpdb.sh gpdb.sql mysql.sql psql.sql sqlite.sql 
	bash gpdb.sh
gpdb.ps: gpdb.dot
	sfdp -T ps gpdb.dot > gpdb.ps
gpdb.sh: gpdb.org
	bash ../scripts/org2nw gpdb.org | notangle -Rgpdb.sh > gpdb.sh
gpdb.sql: gpdb.org
	bash ../scripts/org2nw gpdb.org | notangle -Rgpdb.sql > gpdb.sql
mysql.sql: gpdb.org
	bash ../scripts/org2nw gpdb.org | notangle -Rmysql.sql > mysql.sql
psql.sql: gpdb.org
	bash ../scripts/org2nw gpdb.org | notangle -Rpsql.sql > psql.sql
sqlite.sql: gpdb.org
	bash ../scripts/org2nw gpdb.org | notangle -Rsqlite.sql > sqlite.sql

clean:
	rm -f gpdb.ps gpdb.sh gpdb.sql mysql.sql psql.sql sqlite.sql
	rm -f gpdb
	mysql -u anonymous -e "drop database if exists gpdb"
	test -z $(db) || dropdb -U anonymous gpdb
