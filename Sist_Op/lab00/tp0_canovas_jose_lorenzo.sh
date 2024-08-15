# EJ 1
grep "model name" /proc/cpuinfo
# {cat /proc/cpuinfo | grep "model name"}




# EJ 2
grep "model name" /proc/cpuinfo | wc -l



# EJ 3
curl -s https://raw.githubusercontent.com/dariomalchiodi/superhero-datascience/master/content/data/heroes.csv | awk -F ';' '{print tolower($2)}'| tr -s '\n' | tr -d ' '

# {tr -d ' '} se podría reemplazar con {tr ' ' '_'} si lo que se quiere es reemplazar los espacios y no eliminarlos
# {tr -s '\n'} se podria reemplazar con {grep .}



# EJ 4
cat weather_cordoba.in | sort -k 6 -n | head -n 1 | awk  '{printf "Temp minima: %d, Fecha: %02d/%02d/%02d.\n", $6, $3, $2, $1}' & cat weather_cordoba.in | sort -k 5 -n -r | head -n 1 | awk '{printf "Temp maxima: %d, Fecha: %02d/%02d/%02d.\n", $5, $3, $2, $1}'
