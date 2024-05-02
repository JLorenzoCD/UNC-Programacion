CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

SRC = $(wildcard *.c)
SRC_OBJS = $(SRC:.c=.o)

all: average

clear:
	rm -f $(SRC_OBJS) ./average

average: $(SRC_OBJS)
	gcc $(CFLAGS) $? -o $@

%.o: %.c
	gcc $(CFLAGS) $< -c

run: average
	./average ./input/all-positive-100.in

show_inputs:
	@find ./input -type f -printf "%f\n"

show_config:
	@echo "My flags: "$(CFLAGS)
	@echo "My files: "$(SRC)
