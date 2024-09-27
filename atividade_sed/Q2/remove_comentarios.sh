#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <caminho_do_arquivo>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Arquivo não encontrado!"
    exit 1
fi

sed -i -e 's/\s*#.*//g' -e '/^\s*$/d' "$FILE"

echo "Comentários e linhas em branco removidos!"

