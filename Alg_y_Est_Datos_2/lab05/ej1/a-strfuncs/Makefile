CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

SRC = $(wildcard *.c)
SRC_OBJS = $(SRC:.c=.o)

TARGET = main

all: $(TARGET)

clear:
	rm -f $(SRC_OBJS) ./$(TARGET)

$(TARGET): $(SRC_OBJS)
	gcc $(CFLAGS) $? -o $@

%.o: %.c
	gcc -c $(CFLAGS) $< -o $@

run: $(TARGET)
	./$(TARGET)

show_config:
	@echo "My flags: "$(CFLAGS)
	@echo "My files: "$(SRC)
