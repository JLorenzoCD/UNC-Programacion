CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g
SOURCES = abb.c main.c
OBJECTS = $(SOURCES:.c=.o)

TARGET = readtree

TESTFILES = $(shell ls ./input)

.PHONY: clean test

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)


test: $(TARGET) $(TESTFILES)

%.in:
	./$(TARGET) ./input/$*.in
#	valgrind ./$(TARGET) ./input/$*.in
