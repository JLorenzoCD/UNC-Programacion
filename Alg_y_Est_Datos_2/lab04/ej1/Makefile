CFLAGS = -Wall -Wextra -pedantic -Werror -std=c99

SRC_C = $(wildcard *.c)
SRC_O = $(SRC_C:.c=.o)

all: main

main: $(SRC_O)
	gcc $(CFLAGS) $? -o $@

%.o : %.c
	gcc $(CFLAGS) -c $< -o $@

run: main
	./main

clear:
	rm -f ./main $(SRC_O)

info:
	$(info $(SRC_C))
	$(info $(SRC_O))