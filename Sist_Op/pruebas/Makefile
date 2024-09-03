CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g
SOURCES = dup2.c
OBJECTS = $(SOURCES:.c=.o)

TARGET = prueba
ARCHIVOS_BASURA = lala.txt

all: dup2

dup2: $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET) $(ARCHIVOS_BASURA)

run_dup2: dup2
	./$(TARGET)

.PHONY: clean run_dup2