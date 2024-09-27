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

TITLE=$(basename "$FILE" | sed 's/\(.*\)\..*/\1/')

{
    echo "<!DOCTYPE html>"
    echo "<html lang=\"pt-br\">"
    echo "<head>"
    echo "    <meta charset=\"UTF-8\">"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
    echo "    <title>$TITLE</title>"
    echo "</head>"
    echo "<body>"
    echo "    <h1>$TITLE</h1>"
    echo "    <pre>"

    sed 's/\(amor\)/<a href="https:\/\/pt.wikipedia.org\/wiki\/Amor">\1<\/a>/g' "$FILE"

    echo "    </pre>"
    echo "    <footer>"
    echo "        <p>Data e hora de criação: $(date)</p>"
    echo "    </footer>"
    echo "</body>"
    echo "</html>"
} > "${TITLE}.html"

echo "Página HTML criada: ${TITLE}.html"

