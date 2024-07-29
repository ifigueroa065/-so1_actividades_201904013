# ACTIVIDAD 2 - 201904013

Para Hacer ejecutable el script
> Darle permisos de ejecución al script:
```sh
chmod +x /tmp/github_user_info.sh

```


Tener jq instalado para poder procesar el JSON
```sh
sudo apt-get install jq 
```
Ejecutar el Script Manualmente
> Para probar el script manualmente:
```sh
/tmp/github_user_info.sh <github_user>
```

Para crear un cronjob que ejecute el script cada 5 minutos:
> Abrir el crontab:
```sh
crontab -e
```

Añadir la línea para el cronjob:
> Añadir la siguiente línea al final del archivo:
```sh
*/5 * * * * /tmp/github_user_info.sh <github_user>
```

Guardar y cerrar el crontab
> El cronjob ahora está configurado para ejecutar el script cada 5 minutos.



