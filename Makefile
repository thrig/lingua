#CFLAGS = -g
CC=gcc
CFLAGS += -O2 -std=c99 -Wall -pedantic -fstack-protector-all -fPIE -pie -pipe

depend:
	cpanm --installdeps .

sitelen-sin: sitelen-sin.c

test:
	@prove

clean:
	@-rm -f sitelen-sin 2>/dev/null
