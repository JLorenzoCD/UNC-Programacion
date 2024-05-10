CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

TARGET = clone

SRC = $(TARGET).c
SRC_OBJS = $(SRC:.c=.o)


all: $(TARGET)

clear:
	rm -f $(SRC_OBJS) ./$(TARGET)

$(TARGET): $(SRC_OBJS)
	gcc $(CFLAGS) $? -o $@

$(TARGET).o: $(TARGET).c ansicolors.h
	gcc -c $(CFLAGS) $< -o $@

run: $(TARGET)
	./$(TARGET)

show_config:
	@echo "My flags: "$(CFLAGS)
	@echo "My files: "$(SRC)
