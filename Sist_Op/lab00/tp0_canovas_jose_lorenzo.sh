# EJ 1
grep "model name" /proc/cpuinfo
# cat /proc/cpuinfo | grep "model name"


# EJ 2
grep "model name" /proc/cpuinfo | wc -l

# EJ 3
curl -s https://raw.githubusercontent.com/dariomalchiodi/superhero-datascience/master/content/data/heroes.csv | awk -F ';' '{print tolower($2)}'| grep . | tr -d ' '

# tr -d ' ' se podría reemplazar con tr ' ' '_' si lo que se quiere es reemplazar los espacios y no eliminarlos
