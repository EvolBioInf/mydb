package mydb

import (
	"database/sql"
	"fmt"
	"github.com/go-sql-driver/mysql"
	_ "github.com/jackc/pgx/v5/stdlib"
	_ "github.com/mattn/go-sqlite3"
	"log"
)

func OpenSqlite(name string) (*sql.DB, error) {
	d, e := sql.Open("sqlite3", name)
	if e != nil {
		log.Fatal(e)
	}
	return d, e
}
func OpenMysql(user, pass, host, port,
	db string) (con *sql.DB, err error) {
	if host == "" {
		host = "127.0.0.1"
	}
	if port == "" {
		port = "3306"
	}
	addr := host + ":" + port
	cfg := mysql.Config{
		User:   user,
		Passwd: pass,
		Net:    "tcp",
		Addr:   addr,
		DBName: db,
	}
	dsn := cfg.FormatDSN()
	con, err = sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal(err)
	}
	pingErr := con.Ping()
	if pingErr != nil {
		log.Fatal(pingErr)
	}
	return con, err
}
func OpenPostgresql(user, pass, host, port,
	db string) (con *sql.DB, err error) {
	templ := "postgres://%s:%s@%s:%s/%s"
	if host == "" {
		host = "localhost"
	}
	if port == "" {
		port = "5432"
	}
	ds := fmt.Sprintf(templ, user, pass, host, port, db)
	con, err = sql.Open("pgx", ds)
	if err != nil {
		log.Fatal(err)
	}
	return con, err
}
