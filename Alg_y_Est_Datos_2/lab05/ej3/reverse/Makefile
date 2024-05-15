CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g

SOURCES = ../stack.c reverse.c array_helpers.c
OBJECTS = $(SOURCES:.c=.o)

TARGET = reverse

.PHONY: clean run_all

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@


run_all: $(TARGET)
	@echo "Con un arreglo vacio:"
	./$(TARGET) ./input/empty.in
	@echo "\n\nCon un arreglo simple:"
	./$(TARGET) ./input/example-easy.in
	@echo "\nCon un arreglo ordenado:"
	./$(TARGET) ./input/example-sorted.in
	@echo "\nCon un arreglo desordenado:"
	./$(TARGET) ./input/example-unsorted.in

clean:
	$(RM) $(OBJECTS) $(TARGET)
