EXE = mydb

all: $(EXE) query.sh

$(EXE): $(EXE).go
	go build $(EXE).go
$(EXE).go: $(EXE).org
	bash ../scripts/org2nw $(EXE).org | notangle -R$(EXE).go | gofmt > $(EXE).go
test: $(EXE) $(EXE)_test.go
	go test -v
$(EXE)_test.go: $(EXE).org
	bash ../scripts/org2nw $(EXE).org | notangle -R$(EXE)_test.go | gofmt > $(EXE)_test.go
query.sh: $(EXE).org
	bash ../scripts/org2nw $(EXE).org | notangle -Rquery.sh > query.sh
clean:
	rm -f $(EXE) *.go query.sh
