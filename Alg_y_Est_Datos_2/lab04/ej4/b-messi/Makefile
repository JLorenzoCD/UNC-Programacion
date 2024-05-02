CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

all: b

b: main.o
	gcc $(CFLAGS) main.o -o $@

main.o: main.c data.h
	gcc $(CFLAGS) main.c -c

run: b
	./b

clear:
	rm -f main.o ./b
