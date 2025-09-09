#!/bin/bash

BACKUP_FROM="home/valcann/backupsFrom"
BACKUP_TO="home/valcann/backupsTo"
LOG_FROM="home/valcann/backupsFrom.log"
LOG_TO="home/valcann/backupsTo.log"

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$2"
}

if [ ! -d "$BACKUP_FROM" ]; then
    echo "Erro: Diretório $BACKUP_FROM não existe!"
    exit 1
fi

if [ ! -d "$BACKUP_TO" ]; then
    echo "Criando diretório $BACKUP_TO..."
    mkdir -p "$BACKUP_TO"
fi

> "$LOG_FROM"
> "$LOG_TO"

echo "=== LISTAGEM DE ARQUIVOS EM $BACKUP_FROM ===" > "$LOG_FROM"
echo "Arquivo|Tamanho|Data_Criação|Data_Modificação" >> "$LOG_FROM"
echo "----------------------------------------------" >> "$LOG_FROM"

for file in "$BACKUP_FROM"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        size=$(du -h "$file" | cut -f1)
        creation_date=$(stat -c %w "$file" 2>/dev/null || stat -c %y "$file")
        modification_date=$(stat -c %y "$file")
        
        echo "$filename|$size|$creation_date|$modification_date" >> "$LOG_FROM"
        
        file_epoch=$(stat -c %W "$file" 2>/dev/null || stat -c %Y "$file")
        three_days_ago=$(date -d "3 days ago" +%s)
        
        if [ "$file_epoch" -le "$three_days_ago" ]; then
            log_message "REMOVENDO: $filename (criado em: $(date -d @$file_epoch))" "$LOG_FROM"
            rm -f "$file"
        else
            log_message "COPIANDO: $filename para $BACKUP_TO" "$LOG_TO"
            cp "$file" "$BACKUP_TO/"
            echo "$filename|$size|$creation_date|$modification_date" >> "$LOG_TO"
        fi
    fi
done

log_message "Processamento concluído com sucesso!" "$LOG_FROM"
log_message "Processamento concluído com sucesso!" "$LOG_TO"

echo "Script executado com sucesso!"
echo "Logs disponíveis em: $LOG_FROM e $LOG_TO"
