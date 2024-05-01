# Vars of Makefile
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

all: b

b: main.o
	gcc $(CFLAGS) $< -o $@.out

main.o: main.c data.h
	gcc $(CFLAGS) -c $<

run: b
	./b.out

clear:
	@rm -f ./main.o ./b.out
