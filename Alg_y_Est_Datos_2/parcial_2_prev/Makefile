CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g

SOURCES = pqueue.c main.c
OBJECTS = $(SOURCES:.c=.o)

TARGET = dispatch_patients

.PHONY: clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)

run_all: $(TARGET)
	./$(TARGET) input/hospital_a.in
	@echo "\n"
	./$(TARGET) input/hospital_b.in
	@echo "\n"
	./$(TARGET) input/hospital_c.in
	@echo "\n"
	./$(TARGET) input/hospital_ordered.in

valgrind: $(TARGET)
	valgrind --leak-check=full ./$(TARGET) input/hospital_a.in
	@echo "\n\n"
	valgrind --leak-check=full ./$(TARGET) input/hospital_b.in
	@echo "\n\n"
	valgrind --leak-check=full ./$(TARGET) input/hospital_c.in
	@echo "\n\n"
	valgrind --leak-check=full ./$(TARGET) input/hospital_ordered.in