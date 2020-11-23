# Bioinformatica

## Requisitos

Tener instalador:
 - [Docker](https://docs.docker.com/get-docker/)
 - [Docker Compose](https://docs.docker.com/compose/install/)

## Como levantar el entorno
1) Buildeamos la imagen: `docker-compose build app`
2) Corremos el contenedor: `docker-compose up -d`
3) Ingresamos al contenedor: `docker exec -it tp-bioinformatica bash`

Al ingresar al contendor, van a estar logeados con el usuario `root`. 
Al ejecutar los archivos, van a quedar con permisos de root, y por lo tanto el volumen va a mapear el usuario root a la pc Host.
Asi que, luego de ejecutar archivos o editar, correr el siguiente comando: `chown -R 1000:1000 /opt/Ejercicios/`

## Ejercicios

### Ejercicio 1

`pecl Ex1.pl`

### Ejercicio 2

Para realizar este ejercicio, es necesario descargar el archivo [Swissprot](ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/swissprot.gz).
Luego, en la carpeta input se deben guardar los archivos fasta a procesar, y ejecutar:

`pecl Ex2.pl`

### Ejercicio 3

`pecl Ex3.pl`

### Ejercicio 4

`pecl Ex4.pl Pantoea`

### Ejercicio 5

`perl Ex5.pl` 