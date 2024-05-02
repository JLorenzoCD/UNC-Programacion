CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

all: c

c: sizes.o
	gcc $(CFLAGS) sizes.o -o $@

sizes.o: sizes.c data.h
	gcc $(CFLAGS) sizes.c -c

run: c
	./c

clear:
	rm -f sizes.o ./c
