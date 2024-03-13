# Craker de Contraseñas
Este proyecto consiste en el desarrollo de un cracker de contraseñas. La primera fase implica la creación de un programa que genere hash de contraseñas mediante **SHA-256**. En futuras iteraciones, se planea implementar un cracker capaz de descifrar contraseñas a partir de estos hash.

## Estructura del proyecto
```
.
├── README.md
├── Makefile
├── .gitignore
├── out
│   └── hasher
└── src
    ├── hash.c
    ├── utils.c
    └── utils.h
```

- **Makefile**: Este archivo contiene las reglas y comandos necesarios para compilar el proyecto.
- **README.md**: Este archivo, que estás leyendo ahora mismo, proporciona información sobre el proyecto, su estructura y cómo utilizarlo.
- **out**: Directorio donde se almacena el binario generado del programa.
- **src**: Contiene el código fuente del proyecto.
    - **hash.c**: main para el lanzamiento del hasher desde consola.
    - **utils.c**: Funciones de utilidad para el proyecto
    - **utils.h**: Archivo de cabecera que declara las funciones definidas en utils.c.

## Uso y compilacion
Para compilar el proyecto, ejecuta el comando `make compile` en la terminal desde el directorio raíz del proyecto. Esto generará el ejecutable dentro del directorio **out**.

Una vez compilado, puedes ejecutar el programa utilizando el binario generado. O utilizar `make hash-hola` para un sencillo ejemplo.

```sh
./out/hasher hola
```
