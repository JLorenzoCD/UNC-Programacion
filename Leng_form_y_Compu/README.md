# Materia: Lenguajes formales y computación
### 4to año - 1er cuatrimestre

En este directorio se encuentra lo necesario para rendir el final de esta materia para el año 2026, primera mesa de julio (04/07/26).

- [lista de combos para definiciones y teoremas](./2026_1_mesa_lista%20de%20combos%20de%20definiciones%20y%20teoremas%20de%20lenguajes.pdf)
- [pdf de todas las definiciones solicitadas](./definiciones/definiciones.pdf)
- [pdf de todas los teoremas solicitados](./teoremas/teoremas.pdf)

En el directorio `definiciones` se encuentran todos los combos en archivos `combo_{n in natural}.md` y el archivo `definiciones.md`, el cual, es el resultado de ejecutar el script `unir_combos.py` (hay que comentar y descomentar las variables globales en mayúscula según sea necesario). Este ultimo agarra todos los archivos `combo_{n in natural}.md` y los une en el archivo `definiciones.md`.

Análogamente, en el directorio `teoremas` se encuentran los combos en archivos `combo_{n in natural}.md` y el archivo `teoremas.md`.

### Creación de los archivos "definiciones.pdf" y "teoremas.pdf"
Los archivos `*.pdf` fueron generados mediante una extension de VScode llamada **[Markdown PDF](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf)**, el cual transforma archivos `*.md` en `*.pdf`. Se recomienda utilizar dicha extension ya que probando con convertidores online de `*.md` a `*.pdf` no procesan adecuadamente los **$ y $$** los cuales son necesarios para visualizar en los archivos `*.md` el latex.

> En caso de que no este andando la extension por algún problema en la descarga de un chromium (me paso a mi), se puede solucionar utilizando un navegador basado en chromium que se tenga instalado en la computadora. Para ello se debe buscar la configuración de la extension la siguiente propiedad `executablePath` y añadir la ruta a dicho navegador (en mi caso con `/usr/bin/brave-browser`).
