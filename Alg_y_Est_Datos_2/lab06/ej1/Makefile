CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g
SOURCES = abb.c main.c
OBJECTS = $(SOURCES:.c=.o)
TARGET = readtree

.PHONY: clean run_easy

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)

run_easy: $(TARGET)
	./$(TARGET) input/abb_example.in
