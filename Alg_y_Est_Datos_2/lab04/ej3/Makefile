# Vars of Makefile
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99
OUT_DIR = ./build

# La funcion wildcard me permiete el comportamiento similar a un *.c en el directorio actual
SRC = $(wildcard *.c)
# Se esta creando una variable "SRC_OBJS", a la cual se le añade el "OUT_DIR" al comienzo, y se le reemplaza el *.c por *.o
SRC_OBJS = $(SRC:%.c=$(OUT_DIR)/%.o)

# Make commands
all: mysort

clear:
	rm -rf $(OUT_DIR)

# Programa
mysort: $(SRC_OBJS)
	gcc $(CFLAGS) $? -o $(OUT_DIR)/$@

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.o : %.c $(OUT_DIR)
	gcc $(CFLAGS) -c $< -o $@
# El simbolo $< me toma la primera dependencia, y la pega en el lugar donde esta en simbolo; tambien esta el $?, pero esta no me toma solo la primera dependencia, sino que toma todas las dependencias y la pega donde se coloque el simbolo. ( esta $^ que tiene una funcion similar)

# Extra
run: mysort
	$(OUT_DIR)/mysort ./input/atp-players2022.in

info:
	$(info $(SRC))
	$(info $(SRC_OBJS))

show_input:
	@find ./input -type f -printf "%f\n"

show_config:
	@echo "My flags: "$(CFLAGS)
