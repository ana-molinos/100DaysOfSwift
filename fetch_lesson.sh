#!/usr/bin/env bash
# Busca o conteudo de um dia do 100 Days of Swift e seus subtopicos
# Uso: ./fetch_lesson.sh <numero_do_dia>
# Exemplo: ./fetch_lesson.sh 16

set -euo pipefail

DAY="${1:-}"
PROJECT="${2:-}"
if [[ -z "$DAY" || -z "$PROJECT" ]]; then
    echo "Uso: ./fetch_lesson.sh <numero_do_dia> <numero_do_projeto>"
    echo "Exemplo: ./fetch_lesson.sh 16 1"
    exit 1
fi

BASE_URL="https://www.hackingwithswift.com"
DAY_URL="${BASE_URL}/100/${DAY}"
LESSONS_DIR="$(dirname "$0")/project${PROJECT}/lessons"
mkdir -p "$LESSONS_DIR"
OUTPUT_FILE="${LESSONS_DIR}/lesson_day${DAY}.md"

USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

echo "Buscando dia ${DAY}: ${DAY_URL}"

# Busca a pagina do dia
DAY_HTML=$(curl -s -L -A "$USER_AGENT" "$DAY_URL")

if [[ -z "$DAY_HTML" ]]; then
    echo "Erro: nao foi possivel buscar a pagina do dia ${DAY}"
    exit 1
fi

# Extrai links de subtopicos — padroes comuns no HWS: /read/1/1, /articles/..., /swift/...
SUBTOPIC_PATHS=$(echo "$DAY_HTML" \
    | grep -oE 'href="(/read/[^"]+|/articles/[^"]+|/swift/[^"]+|/example-code/[^"]+)"' \
    | sed 's/href="//;s/"//' \
    | sort -u)

# Inicia o arquivo de saida
{
    echo "# 100 Days of Swift — Dia ${DAY}"
    echo ""
    echo "Fonte: ${DAY_URL}"
    echo ""
    echo "---"
    echo ""
    echo "## Pagina do dia"
    echo ""
    # Converte o HTML da pagina principal para texto legivel
    echo "$DAY_HTML" \
        | sed 's/<[^>]*>//g' \
        | sed '/^[[:space:]]*$/d' \
        | sed 's/&amp;/\&/g; s/&lt;/</g; s/&gt;/>/g; s/&quot;/"/g; s/&#39;/'"'"'/g; s/&nbsp;/ /g'
    echo ""
} > "$OUTPUT_FILE"

# Busca cada subtopico encontrado
if [[ -z "$SUBTOPIC_PATHS" ]]; then
    echo "Aviso: nenhum subtopico encontrado na pagina do dia ${DAY}."
    echo "O conteudo da pagina principal foi salvo mesmo assim."
else
    COUNT=0
    while IFS= read -r path; do
        [[ -z "$path" ]] && continue
        FULL_URL="${BASE_URL}${path}"
        COUNT=$((COUNT + 1))
        echo "  Buscando subtopico ${COUNT}: ${FULL_URL}"

        SUB_HTML=$(curl -s -L -A "$USER_AGENT" "$FULL_URL" 2>/dev/null || true)

        {
            echo ""
            echo "---"
            echo ""
            echo "## Subtopico: ${path}"
            echo ""
            echo "Fonte: ${FULL_URL}"
            echo ""
            if [[ -z "$SUB_HTML" ]]; then
                echo "(Sem conteudo retornado)"
            else
                echo "$SUB_HTML" \
                    | sed 's/<[^>]*>//g' \
                    | sed '/^[[:space:]]*$/d' \
                    | sed 's/&amp;/\&/g; s/&lt;/</g; s/&gt;/>/g; s/&quot;/"/g; s/&#39;/'"'"'/g; s/&nbsp;/ /g'
            fi
            echo ""
        } >> "$OUTPUT_FILE"
    done <<< "$SUBTOPIC_PATHS"
fi

echo ""
echo "Conteudo salvo em: ${OUTPUT_FILE}"
echo "Total de subtopicos encontrados: $(echo "$SUBTOPIC_PATHS" | grep -c . || echo 0)"
