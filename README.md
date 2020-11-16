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

`pecl ext1.pl`

### Ejercicio 2

