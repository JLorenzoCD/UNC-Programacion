# Vars of Makefile
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

all: c

c: sizes.o
	gcc $(CFLAGS) $< -o $@.out

sizes.o: sizes.c data.h
	gcc $(CFLAGS) -c $<

run: c
	./c.out

clear:
	@rm -f ./sizes.o ./c.out
