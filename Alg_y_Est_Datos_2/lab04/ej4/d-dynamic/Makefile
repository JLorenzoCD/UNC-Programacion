CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

PATH_STATIC = ./static
PATH_DYNAMIC = ./dynamic

SRC_STATIC = $(wildcard $(PATH_STATIC)/*.c)
SRC_DYNAMIC = $(wildcard $(PATH_DYNAMIC)/*.c)

SRC_OBJS_STATIC = $(SRC_STATIC:.c=.o)
SRC_OBJS_DYNAMIC = $(SRC_DYNAMIC:.c=.o)

all: static dynamic

static: $(SRC_OBJS_STATIC)
	gcc $(CFLAGS) $? -o $(PATH_STATIC)/$@

dynamic: $(SRC_OBJS_DYNAMIC)
	gcc $(CFLAGS) $? -o $(PATH_DYNAMIC)/$@

$(PATH_STATIC)/%.o: $(PATH_STATIC)/%.c
	gcc $(CFLAGS) $? -c -o $@

$(PATH_DYNAMIC)/%.o: $(PATH_DYNAMIC)/%.c
	gcc $(CFLAGS) $? -c -o $@

clear:
	rm -f $(SRC_OBJS_STATIC) $(PATH_STATIC)/static
	rm -f $(SRC_OBJS_DYNAMIC) $(PATH_DYNAMIC)/dynamic

info:
	@echo $(SRC_OBJS_STATIC)
	@echo $(SRC_OBJS_DYNAMIC)

run_easy: static dynamic
	@echo "Ahora se ejecuta el static:\n"
	$(PATH_STATIC)/static ./input/example-sorted.in
	@echo "\n\nAhora se ejecuta el dynamic:\n"
	$(PATH_DYNAMIC)/dynamic ./input/example-sorted.in

run_unsorted_200000: dynamic
	@echo "El archivo static no soporta este archivo: unsorted-200000.in"
	$(PATH_DYNAMIC)/dynamic ./input/unsorted-200000.in

run_unsorted_100000: static dynamic
	@echo "Ahora se ejecuta el static:\n"
	$(PATH_STATIC)/static ./input/unsorted-100000.in
	@echo "\n\nAhora se ejecuta el dynamic:\n"
	$(PATH_DYNAMIC)/dynamic ./input/unsorted-100000.in