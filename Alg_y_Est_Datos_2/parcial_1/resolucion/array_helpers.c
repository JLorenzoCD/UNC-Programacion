/*
@file array_helpers.c
@brief Array Helpers method implementation
*/
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "array_helpers.h"
#include "character.h"

void array_dump(CharacterList array) {
  for (alignment_t alignment = good; alignment < CHARACTER_ALIGNMENTS; ++alignment) {
    for (charttype_t charttype = physical; charttype < CHARACTER_TYPES; ++charttype) {
      Character character = array[charttype][alignment];

      char *str_alignment = (character.alignment == good) ? "Good" : "Evil";
      char *str_alive = (character.alive) ? "Yes" : "Nope";

      fprintf(
        stdout,
        "Character '%s': Life=%u/100, Strength=%u/10, Agility=%u/10, "
        "alignment='%s', Alive='%s'\n",
        NAMES[character.name],
        character.life,
        character.strength,
        character.agility,
        str_alignment, str_alive
      );
    }
  }
}

float array_alive_mean_life(CharacterList array) {
  unsigned int sum = 0u;
  unsigned int count = 0u;

  for (alignment_t alignment = good; alignment < CHARACTER_ALIGNMENTS; ++alignment) {
    for (charttype_t charttype = physical; charttype < CHARACTER_TYPES; ++charttype) {
      Character character = array[charttype][alignment];

      if (character.alive) {
        sum += character.life;
        count += 1u;
      }
    }
  }

  return (count == 0u ? 0u : (float)sum / count);
}

unsigned int array_from_file(CharacterList array, const char *filepath) {
  FILE *file = NULL;

  // check if file exists
  file = fopen(filepath, "r");
  if (file == NULL) {
    fprintf(stderr, "File does not exist.\n");
    fclose(file);

    exit(EXIT_FAILURE);
  }

  // read the file
  unsigned int readed = 0;
  while (readed < CHARACTER_COUNT && !feof(file)) {
    charttype_t charttype;
    alignment_t alignment;

    char s_charttype, s_alignment;
    int res = fscanf(file, EXPECTED_TYPE_AND_ALIGNMENT_FORMAT, &s_charttype,
      &s_alignment);
    if (res != 2) {
      fprintf(stderr, "Error reading type and alignment.\n");
      fclose(file);

      exit(EXIT_FAILURE);
    }

    // convertir la letra de `s_charttype` en un valor `charttype_t` y asignarlo
    switch (s_charttype) {
    case 'a':
      charttype = agile;
      break;
    case 'p':
      charttype = physical;
      break;
    case 't':
      charttype = tank;
      break;
    case 'm':
      charttype = magic;
      break;

    default:
      fprintf(stderr, "Invalid character type.\n");
      fclose(file);

      exit(EXIT_FAILURE);
      break;
    }

    // convertir la letra de `s_alignment` en un valor `aligment_t` y asignarlo
    switch (s_alignment) {
    case 'g':
      alignment = good;
      break;
    case 'e':
      alignment = evil;
      break;
    default:
      fprintf(stderr, "Invalid character alignment.\n");
      fclose(file);

      exit(EXIT_FAILURE);
      break;
    }

    // Reads the name and obtains an name_t value
    name_t name = read_character_name(file);

    Character character = character_from_file_line(file, name, alignment);

    /* Almacenar en la tabla*/
    array[charttype][alignment] = character;
    ++readed;
  }

  if (readed != 8u) {
    fprintf(
      stderr,
      "Invalid number of records, expected 8 but gets %u.\n",
      readed);
    fclose(file);

    exit(EXIT_FAILURE);
  }

  // close the file
  fclose(file);

  return readed;
}
