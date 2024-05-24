CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

SRC = $(wildcard *.c)
SRC_OBJS = $(SRC:.c=.o)

TARGET = load_characters

all: $(TARGET)

clean:
	rm -f $(SRC_OBJS) ./$(TARGET)

$(TARGET): $(SRC_OBJS)
	gcc $(CFLAGS) $? -o $@

%.o: %.c
	gcc -c $(CFLAGS) $< -o $@

run: $(TARGET)
	@echo "Archivo valido 1:"
	./$(TARGET) ./inputs/valid.in
	@echo "\n\n"
	@echo "Archivo valido 2:"
	./$(TARGET) ./inputs/valid_2.in

show_config:
	@echo "My flags: "$(CFLAGS)
	@echo "My files: "$(SRC)
