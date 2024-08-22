# Servicio de Ejemplo con Systemd

Este archivo explica cómo crear e instalar un servicio de Systemd en Ubuntu, el cual ejecuta un script que imprime un saludo y la fecha actual de manera infinita, con una pausa de un segundo entre cada iteración.

## Requisitos previos

- Ubuntu 24.04 o superior.
- Acceso como usuario con privilegios de `sudo`.
- Un editor de texto como `nano` o `vim`.

## Instalación del Servicio

### 1. Crear el Script del Servicio

Primero, crea un script que contenga la lógica que se ejecutará de forma infinita. Puedes crear el archivo `mi_servicio.sh` con el siguiente contenido:

```bash
#!/bin/bash

while true
do
    echo "Hola, soy el usuario figueroa. La fecha actual es: $(date)"
    sleep 1
done
