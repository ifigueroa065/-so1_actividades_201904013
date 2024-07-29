#ACTIVIDAD 2 - 201904013

Para Hacer ejecutable el script
> **Nota:**Dale permisos de ejecución al script:
```sh
chmod +x github_user_info.sh
```


Asegúrate de tener jq instalado para poder procesar el JSON. Puedes instalarlo usando:
```sh
sudo apt-get install jq 
```


Para crear un cronjob que ejecute el script cada 5 minutos, sigue estos pasos:
> **Paso 1:**Abre el archivo de crontab del usuario:
```sh
crontab -e
```


