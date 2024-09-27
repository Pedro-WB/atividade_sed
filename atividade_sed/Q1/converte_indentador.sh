#!/bin/bash

# Verifica se um arquivo foi passado como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <caminho_do_arquivo>"
    exit 1
fi

FILE="$1"

# Verifica se o arquivo existe
if [ ! -f "$FILE" ]; then
    echo "Arquivo não encontrado!"
    exit 1
fi

# Converte tabs para '>' e espaços para '.'
sed -i -e 's/\t/>/g' -e 's/ /./g' "$FILE"

echo "Conversão concluída!"

