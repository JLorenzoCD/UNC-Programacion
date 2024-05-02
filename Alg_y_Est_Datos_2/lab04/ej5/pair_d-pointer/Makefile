CFLAGS = -Wall -Wextra -pedantic -Werror -std=c99

SRC_C = $(wildcard *.c)
SRC_O = $(SRC_C:.c=.o)

all: d

d: $(SRC_O)
	gcc $(CFLAGS) $? -o $@

%.o : %.c
	gcc $(CFLAGS) -c $< -o $@

run: d
	./d

clear:
	rm -f ./d $(SRC_O)

info:
	$(info $(SRC_C))
	$(info $(SRC_O))