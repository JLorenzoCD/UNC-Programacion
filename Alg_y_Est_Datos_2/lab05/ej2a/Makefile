CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g

SOURCES = stack.c test.c
OBJECTS = $(SOURCES:.c=.o)

TARGET = test

.PHONY: clean run_test

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

run_test: $(TARGET)
	./$(TARGET)

clean:
	$(RM) $(OBJECTS) $(TARGET)
