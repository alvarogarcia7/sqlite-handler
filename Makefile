db.sqlite3:
	cat backup.sql | sqlite3 db.sqlite3
.PHONY: db.sqlite3

backup.sql:
	sqlite3 db.sqlite3 .dump > backup.sql
.PHONY: backup.sql

backup: backup.sql
	mv backup.sql data/
	cd data/ && git commit -am "Save"

load: db.sqlite3

