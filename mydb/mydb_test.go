package mydb

import (
	"bytes"
	"database/sql"
	"fmt"
	"os"
	"testing"
)

func TestMydb(t *testing.T) {
	var connections []*sql.DB
	query := "select gid from genome " +
		"join publication using(pid) " +
		"join project using(gid) " +
		"join institute using(iid) " +
		"order by genome.gid"
	data, e := os.ReadFile("r.txt")
	if e != nil {
		t.Error(e)
	}
	data = bytes.ReplaceAll(data, []byte("\n"), []byte(""))
	want := string(data)
	c, e := OpenSqlite("../gpdb/gpdb")
	if e != nil {
		t.Error(e)
	}
	connections = append(connections, c)
	c, e = OpenMysql("anonymous", "", "", "", "gpdb")
	if e != nil {
		t.Error(e)
	}
	connections = append(connections, c)
	c, e = OpenPostgresql("anonymous", "", "", "", "gpdb")
	if e != nil {
		t.Error(e)
	}
	connections = append(connections, c)
	nc := len(connections)
	for i, connection := range connections {
		fmt.Printf("Testing connection %d of %d\n", i+1, nc)
		rows, e := connection.Query(query)
		if e != nil {
			t.Error(e)
		}
		var s, get string
		for rows.Next() {
			rows.Scan(&s)
			get += s
		}
		if get != want {
			t.Errorf("Get:\n%s\nWant:\n%s\n", get, want)
		}
	}
}
