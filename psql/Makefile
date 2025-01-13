all: psql.sh
psql.sh: psql.org
	bash ../scripts/org2nw psql.org | notangle -Rpsql.sh > psql.sh
