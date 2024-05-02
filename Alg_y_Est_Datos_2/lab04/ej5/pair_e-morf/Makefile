CFLAGS = -Wall -Wextra -pedantic -Werror -std=c99

SRC_C = $(wildcard *.c)
SRC_O = $(SRC_C:.c=.o)

all: e

e: $(SRC_O)
	gcc $(CFLAGS) $? -o $@

%.o : %.c
	gcc $(CFLAGS) -c $< -o $@

run: e
	./e

clear:
	rm -f ./e $(SRC_O)

info:
	$(info $(SRC_C))
	$(info $(SRC_O))