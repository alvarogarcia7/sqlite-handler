db.sqlite3:
	rm db.sqlite3
	cat data/backup.sql | sqlite3 db.sqlite3
.PHONY: db.sqlite3

data/backup.sql:
	sqlite3 db.sqlite3 .dump > data/backup.sql
.PHONY: data/backup.sql

last-element:
	cat data/backup.sql|grep INSERT | tail -2 | less
	cd data && git log -n1 -p
.PHONY: last-element

backup: data/backup.sql
	cd data/ && git commit -am "Save"

load: db.sqlite3

