/*
  @file character.c
  @brief Implements character structure and methods
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "character.h"

static const int AMOUNT_OF_ATTRIBUTES = 3;

// Converts a name_t value into a string for visualization or comparation.
char *NAMES[] = {
    [alice] = "Alice",[mario] = "Mario",[lenny] = "Lenny",[eliza] = "Eliza",
    [eddie] = "Eddie",[frank] = "Frank",[nadia] = "Nadia",[oscar] = "Oscar",
    [bella] = "Bella",[yoshi] = "Yoshi" };

Character character_from_file_line(FILE *file, name_t name, alignment_t alignment) {
  // placeholders
  unsigned int life;
  unsigned int strength;
  unsigned int agility;
  int res = fscanf(file, EXPECTED_ATTRIBUTE_FORMAT, &life, &strength, &agility);
  if (res != AMOUNT_OF_ATTRIBUTES) {
    fprintf(stderr, "Invalid attribute format.\n");
    fclose(file);

    exit(EXIT_FAILURE);
  }

  // Validating range of the aributes
  if (100u < life) {
    fprintf(stderr,
      "Invalid attribute life, expected in range [0-100], but gets %u.\n",
      life);
    fclose(file);

    exit(EXIT_FAILURE);
  }
  if (10u < strength || strength == 0u) {
    fprintf(stderr,
      "Invalid attribute strength, expected in range [1-10], but gets "
      "%u.\n",
      strength);
    fclose(file);

    exit(EXIT_FAILURE);
  }
  if (10u < agility || agility == 0u) {
    fprintf(
      stderr,
      "Invalid attribute agility, expected in range [1-10], but gets %u.\n",
      agility);
    fclose(file);

    exit(EXIT_FAILURE);
  }

  Character character;

  character.name = name;
  character.alignment = alignment;
  character.life = life;
  character.strength = strength;
  character.agility = agility;

  character.alive = character.life != 0u;

  return character;
}

name_t read_character_name(FILE *file) {
  char str_name[CHARACTER_NAME_LENGTH];

  for (int i = 0; i < CHARACTER_NAME_LENGTH; i++) {
    int res = fscanf(file, "%c", &str_name[i]);
    if (res != 1) {
      fprintf(stderr, "Bad character name.");
      fclose(file);

      exit(EXIT_FAILURE);
    }
  }

  str_name[CHARACTER_NAME_LENGTH] = '\0';
  printf("read_character_name: str_name -> '%s'\n", str_name);

  name_t name = alice;
  while (name < CHARACTER_COUNT && strcmp(NAMES[name], str_name) != 0) {
    name++;
  }
  if (name == CHARACTER_COUNT) {
    fprintf(stderr, "Character name unknown.");
    fclose(file);

    exit(EXIT_FAILURE);
  }

  return name;
}
