CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g

SOURCES = $(wildcard ./*.c)
OBJECTS = $(SOURCES:.c=.o)

TARGET = queue

.PHONY: clean valgrind

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

run_easy: $(TARGET)
	./$(TARGET) ../input/example-easy.in

run_all: $(TARGET)
	@echo "\n"
	./$(TARGET) ../input/empty.in
	@echo "\n"
	./$(TARGET) ../input/example-easy.in
	@echo "\n"
	./$(TARGET) ../input/example-sorted.in
	@echo "\n"
	./$(TARGET) ../input/example-unsorted.in
	@echo "\n"
	./$(TARGET) ../input/sorted-asc-10000.in
	@echo "\n"
	./$(TARGET) ../input/sorted-asc-100.in
	@echo "\n"
	./$(TARGET) ../input/sorted-desc-100.in
#   ./$(TARGET) ../input/unsorted-100000.in
#   ./$(TARGET) ../input/unsorted-200000.in

clean:
	$(RM) $(OBJECTS) $(TARGET)

valgrind: $(TARGET)
	valgrind --leak-check=full ./$(TARGET) ../input/example-easy.in