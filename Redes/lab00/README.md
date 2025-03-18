# Punto estrella (Encoding)
Los dominios con caracteres especiales como **http://中文.tw/** o **https://💩.la2** funcionan gracias a un mecanismo estándar llamado **Internationalized Domain Name (IDN)**, que permite representar nombres de dominio en caracteres Unicode dentro de un sistema basado en ASCII.

Esto se debe a que:
- **ASCII** es un sistema de codificación que solo admite **128 caracteres**, lo que lo hace insuficiente para soportar alfabetos no latinos, como el chino, el árabe, el cirílico, entre otros, o símbolos especiales como **emojis** (😜).
- **Unicode** expande esta capacidad, permitiendo representar **más de 1.1 millones de caracteres**, incluyendo **emojis, alfabetos no latinos y otros símbolos**.

El problema es que el sistema de nombres de dominio (**DNS**, que se encarga de mapear nombres de dominio a direcciones IP válidas para facilitar la navegación en la web) **solo admite ASCII**. Esto genera una incompatibilidad con caracteres Unicode en los nombres de dominio.

Tengo entendido de que no se realizó una transición de ASCII a Unicode en el DNS, ya que esto habría significado un cambio en la infraestructura de Internet. En su lugar, se creó un mecanismo estándar (**IDN**) para permitir el uso de otros caracteres y facilitar que personas que no hablan inglés puedan recordar los nombres de dominio en sus propios idiomas (cosa que se buscaba al crear las **DNS**). Este mecanismo **solo se implementa en aplicaciones que lo necesiten**, sin modificar la infraestructura de Internet, lo que lo hace muy conveniente.

## ¿Cómo funciona el IDN?
El siguiente proceso se explica usando un navegador, ya que es un ejemplo conocido y porque implementa IDN:
1. **El usuario escribe un dominio con caracteres Unicode en el navegador**, por ejemplo: `http://中文.tw/` o `https://💩.la2`.
2. **El navegador convierte automáticamente el dominio a Punycode** (Punycode es un formato ASCII que representa Unicode).
   - `http://中文.tw/` → `http://xn--fiq228c.tw/`
   - `http://💩.la/` → `https://xn--ls8h.la2/`
   > Pagina para convertir [Unicode a Punicode y viceversa](https://www.punycoder.com/)
3. **El navegador consulta el DNS con el dominio en Punycode**.
4. **El servidor DNS responde con la IP del sitio web**, permitiendo la conexión.
5. **El navegador traduce nuevamente el dominio a Unicode y lo muestra en la barra de direcciones**.

Este mecanismo permite que los usuarios usen dominios con caracteres de cualquier idioma, sin que los sistemas de red basados en ASCII necesiten cambios.

> **Consideraciones:** Como se explica muy bien en los videos en referencias, no todos los TLD (ej: .com, .ts, .ia, .io, etc) permiten los mismos caracteres Unicode, ya que ciertos caracteres Unicode pueden ser muy similares visualmente a caracteres ASCII (en nuestro caso) o puede ser que cierto caracteres sean muy similares y esto da problemas de seguridad a los usuario (suplantación de pagina web). Ej: los .com no permite emojis en su nombre de dominio

---

## Ejemplos de ejecución del programa hget con dominio Unicode:
- Dominio = http://موقع.شبكة
- Dominio en Punycode = xn--4gbrim.xn--ngbc5azd
```console
$ py hget.py http://موقع.شبكة
Contactando servidor 'موقع.شبكة'...
Contactando al servidor en 165.160.15.20...
Enviando pedido...
Esperando respuesta...
```

- Dominio = http://www.ñandú.cl
- Dominio en Punycode = www.xn--and-6ma2c.cl
```console
$ py hget.py http://www.ñandú.cl
Contactando servidor 'www.ñandú.cl'...
Contactando al servidor en 200.1.123.10...
Enviando pedido...
Esperando respuesta...
```

---

## Referencias
- [DNS](https://en.wikipedia.org/wiki/Domain_Name_System)
- [Unicode](https://es.wikipedia.org/wiki/Unicode)
- [Punycode](https://en.wikipedia.org/wiki/Punycode)
- [Internationalized domain name](https://en.wikipedia.org/wiki/Internationalized_domain_name)

- [Punycode converter (IDN converter), Punycode to Unicode 🧰](https://www.punycoder.com/)

- [Why You Can't Visit 💀🎺.com](https://www.youtube.com/watch?v=y4393bPetoU) (Video de YT muy bueno sobre el tema, aunque en ingles)
- [Unicode Domains Are An Absolute Hack](https://www.youtube.com/watch?v=zRekXAeJAsQ) (Video de YT en español, en el cual el autor critica la forma en la cual se ha implementado Unicode en los dominios. Eso si, da una explicación bastante buena sobre DNS, Unicode, Punycode, IDN)
