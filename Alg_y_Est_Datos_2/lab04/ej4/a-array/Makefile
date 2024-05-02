CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

all: a

a: array.o
	gcc $(CFLAGS) array.o -o $@

array.o: array.c
	gcc $(CFLAGS) array.c -c

run: a
	./a

clear:
	rm -f array.o ./a
