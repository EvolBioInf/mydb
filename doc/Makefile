TEXT = mydb

date = $(shell git log | grep Date | head -n 1 | sed -r 's/Date: +[A-Z][a-z]+ ([A-Z][a-z]+) ([0-9]+) [^ ]+ ([0-9]+) .+/\2_\1_\3/')
version = $(shell git describe)

all: $(TEXT)Doc.pdf
$(TEXT)Doc.pdf: $(TEXT)Doc.tex $(TEXT).tex
	echo $(date) | tr '_' ' ' > date.txt
	echo $(version) | tr '-' ' ' | awk '{printf "%s", $$1; if ($$2) printf "-%s", $$2; printf "\n"}' > version.txt
	pdflatex $(TEXT)Doc
	pdflatex $(TEXT)Doc
publish: $(TEXT)Doc.pdf
	if [ -d /mnt/c/Users/haubold/ownCloud\ -\ haubold@evolbio.mpg.de@owncloud.gwdg.de/docs/ ]; then \
		cp $(TEXT)Doc.pdf /mnt/c/Users/haubold/ownCloud\ -\ haubold@evolbio.mpg.de@owncloud.gwdg.de/docs/; \
	fi
%.tex: ../*/%.org $(TEXT).tex
	bash ../scripts/org2nw $< | awk -f ../scripts/preWeave.awk | noweave -n -x | sed 's/_test/\\_test/' > $@
clean:
	rm -f $(TEXT)Doc.aux $(TEXT)Doc.log $(TEXT)Doc.pdf $(TEXT)Doc.toc $(TEXT).tex version.txt date.txt
