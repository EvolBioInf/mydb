dirs = gpdb mydb mysql psql
all: progs doc
progs:
	for dir in $(dirs); do \
		make -C $$dir; \
	done
doc: progs
	make -C doc
clean:
	for dir in $(dirs); do \
		make clean -C $$dir; \
	done
	make clean -C doc
