CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g

SRC = $(wildcard *.c)
SRC_OBJS = $(SRC:.c=.o)

TARGET = checkpal

all: $(TARGET)

clear:
	rm -f $(SRC_OBJS) ./$(TARGET)

$(TARGET): $(SRC_OBJS)
	gcc $(CFLAGS) $? -o $@

%.o: %.c
	gcc -c $(CFLAGS) $< -o $@

run_input: $(TARGET)
	./$(TARGET)

run_nopal: $(TARGET)
	./$(TARGET) < nopal1.in
	./$(TARGET) < nopal2.in
	./$(TARGET) < nopal3.in

run_pal: $(TARGET)
	./$(TARGET) < pal1.in
	./$(TARGET) < pal2.in
	./$(TARGET) < pal3.in
	./$(TARGET) < pal4.in
	./$(TARGET) < pal5.in

show_config:
	@echo "My flags: "$(CFLAGS)
	@echo "My files: "$(SRC)
