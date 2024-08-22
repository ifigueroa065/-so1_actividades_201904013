# Servicio de Ejemplo con Systemd

Este archivo explica cómo crear e instalar un servicio de Systemd en Ubuntu, el cual ejecuta un script que imprime un saludo y la fecha actual de manera infinita, con una pausa de un segundo entre cada iteración.

## Requisitos previos

- Ubuntu 24.04 o superior.
- Acceso como usuario con privilegios de `sudo`.
- Un editor de texto como `nano` o `vim`.

## Instalación del Servicio

### 1. Crear el Script del Servicio

Primero, crea un script que contenga la lógica que se ejecutará de forma infinita. Puedes crear el archivo `saludo.sh` con el siguiente contenido:

```bash
#!/bin/bash

while true
do
    echo "Hola, soy el usuario figueroa. La fecha actual es: $(date)"
    sleep 1
done
```

Haz el script ejecutable con el siguiente comando:

```bash
chmod +x /home/figueroa/saludo.sh
```

Crea un archivo en /etc/systemd/system/saludo.service con el siguiente contenido:

```ini
[Unit]
Description=Servicio que imprime un saludo y la fecha actual
After=network.target

[Service]
ExecStart=/home/figueroa/saludo.sh
Restart=always
User=figueroa

[Install]
WantedBy=multi-user.target
```

Recarga Systemd, inicia y habilita el servicio con los siguientes comandos:

```bash
sudo systemctl daemon-reload
sudo systemctl start saludo.service
sudo systemctl enable saludo.service
```

### Verificación de Logs
Verifica el estado y los logs del servicio con los siguientes comandos:

#### Estado del Servicio
```bash
sudo systemctl status saludo.service
```
#### Ver Logs
```bash
journalctl -u saludo.service -f
```

#### Detener y Deshabilitar el Servicio
Para detener o deshabilitar el servicio, utiliza los siguientes comandos:
```bash
sudo systemctl stop saludo.service
sudo systemctl disable saludo.service
```