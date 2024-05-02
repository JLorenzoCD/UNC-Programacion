CFLAGS = -Wall -Wextra -pedantic -Werror -std=c99

SRC_C = $(wildcard *.c)
SRC_O = $(SRC_C:.c=.o)

all: counter

counter: $(SRC_O)
	gcc $(CFLAGS) $? -o $@

%.o : %.c
	gcc $(CFLAGS) -c $< -o $@

run_balanced: counter
	./counter ./input/balanced.in

run_moreopen: counter
	./counter ./input/moreopen.in

run_onlyopen: counter
	./counter ./input/onlyopen.in

run_all: counter
	@echo "Balanceado: "
	./counter ./input/balanced.in
	@echo "\nMas parantesis abiertos: "
	./counter ./input/moreopen.in
	@echo "\nSolo parentesis abiertos: "
	./counter ./input/onlyopen.in

clear:
	rm -f ./counter $(SRC_O)

info:
	$(info $(SRC_C))
	$(info $(SRC_O))