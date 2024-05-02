CFLAGS = -std=c99

SRC_C = $(wildcard *.c)
SRC_O = $(SRC_C:.c=.o)

all: abs1 abs2 swap

abs1: abs1.o
	gcc $(CFLAGS) $? -o $@

abs2: abs2.o
	gcc $(CFLAGS) $? -o $@

swap: swap.o
	gcc $(CFLAGS) $? -o $@

%.o : %.c
	gcc $(CFLAGS) -c $< -o $@

run: abs1 abs2 swap
	@echo "Archivo 'abs1'"
	./abs1
	@echo "\n\nArchivo 'abs2'"
	./abs2
	@echo "\n\nArchivo 'swap'"
	./swap

clear:
	rm -f ./abs1 ./abs2 ./swap $(SRC_O)
