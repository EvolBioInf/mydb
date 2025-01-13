all: mycli.sh
mycli.sh: mysql.org
	bash ../scripts/org2nw mysql.org | notangle -Rmycli.sh > mycli.sh
clean:
	rm -f mycli.sh
