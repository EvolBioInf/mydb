TEXT = mydb

date = $(shell git log | grep Date | head -n 1 | sed -r 's/Date: +[A-Z][a-z]+ ([A-Z][a-z]+) ([0-9]+) [^ ]+ ([0-9]+) .+/\2_\1_\3/')
version = $(shell git describe)

all: $(TEXT)Doc.pdf ../gpdb/gpdb.ps
$(TEXT)Doc.pdf: $(TEXT)Doc.tex $(TEXT).tex gpdb.tex mysql.tex psql.tex intro.tex
	echo $(date) | tr '_' ' ' > date.txt
	echo $(version) | tr '-' ' ' | awk '{printf "%s", $$1; if ($$2) printf "-%s", $$2; printf "\n"}' > version.txt
	latex $(TEXT)Doc
	latex $(TEXT)Doc
	dvips $(TEXT)Doc -o -q
	ps2pdf -dALLOWPSTRANSPARENCY $(TEXT)Doc.ps
publish: $(TEXT)Doc.pdf
	if [ -d /mnt/c/Users/haubold/ownCloud\ -\ haubold@evolbio.mpg.de@owncloud.gwdg.de/docs/ ]; then \
		cp $(TEXT)Doc.pdf /mnt/c/Users/haubold/ownCloud\ -\ haubold@evolbio.mpg.de@owncloud.gwdg.de/docs/; \
	fi
%.tex: ../*/%.org
	bash ../scripts/org2nw $< | awk -f ../scripts/preWeave.awk | noweave -n -x | sed 's/_test/\\_test/' > $@
clean:
	rm -f $(TEXT)Doc.aux $(TEXT)Doc.dvi $(TEXT)Doc.log $(TEXT)Doc.pdf $(TEXT)Doc.ps $(TEXT)Doc.toc $(TEXT).tex version.txt date.txt gpdb.tex mysql.tex
