# Vars of Makefile
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99
SRC = list.c array_helpers.c main.c
SRC_OBJS = $(SRC:.c=.o)

# Make commands
all: average

clear:
	rm -f $(SRC_OBJS) ./average

object:
	gcc $(CFLAGS) -c ${SRC}

average: object
	gcc $(CFLAGS) $(SRC_OBJS) -o $@
# $@ es el nombre de la regla, en este caso es "average", por lo que el binario creado va a ser ./average

test: average
	./average ./input/all-positive-100.in

show_input:
	@find ./input -type f -printf "%f\n"

show_config:
	@echo "My flags: "$(CFLAGS)
	@echo "My files: "$(SRC)
