all: all.db bad.db

all.db: allgismu graph
	./allgismu < graph > all

bad.db: all.db badgismu
	./badgismu > bad

depend:
	cpanm --installdeps ..

.PHONY: depend
