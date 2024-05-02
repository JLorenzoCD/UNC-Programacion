CFLAGS = -Wall -Wextra -pedantic -Werror -std=c99

SRC_C = $(wildcard *.c)
SRC_O = $(SRC_C:.c=.o)

all: a

a: $(SRC_O)
	gcc $(CFLAGS) $? -o $@

%.o : %.c
	gcc $(CFLAGS) -c $< -o $@

run: a
	./a

clear:
	rm -f ./a $(SRC_O)

info:
	$(info $(SRC_C))
	$(info $(SRC_O))