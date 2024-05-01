# Vars of Makefile
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

all: a

a: array.o
	gcc $(CFLAGS) $< -o $@.out

array.o: array.c
	gcc $(CFLAGS) -c $<

run: a
	./a.out

clear:
	@rm -f ./array.o ./a.out
