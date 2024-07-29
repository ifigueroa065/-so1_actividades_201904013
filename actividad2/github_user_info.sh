#!/bin/bash

# Lee la variable GITHUB_USER
GITHUB_USER=$1

# Verifica que la variable GITHUB_USER no esté vacía
if [ -z "$GITHUB_USER" ]; then
  echo "Error: Debes proporcionar un nombre de usuario de GitHub."
  exit 1
fi

# Consulta la API de GitHub para obtener los datos del usuario
USER_DATA=$(curl -s https://api.github.com/users/$GITHUB_USER)

# Extrae los datos necesarios del JSON
USER_ID=$(echo $USER_DATA | jq -r '.id')
CREATED_AT=$(echo $USER_DATA | jq -r '.created_at')

# Verifica que los datos sean válidos
if [ "$USER_ID" == "null" ] || [ "$CREATED_AT" == "null" ]; then
  echo "Error: No se pudo obtener los datos del usuario $GITHUB_USER."
  exit 1
fi

# Imprimiendo mensaje
MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
echo $MESSAGE

# Crea el archivo de log con la fecha del día
DATE=$(date +%Y-%m-%d)
LOG_DIR="/tmp/$DATE"
LOG_FILE="$LOG_DIR/saludos.log"

# Crea el directorio si no existe
mkdir -p $LOG_DIR

# Escribe el mensaje en el archivo de log
echo $MESSAGE >> $LOG_FILE
