#!/usr/bin/env bash
#==========================HEADER=====================================|
#AUTOR
# Jefferson 'Slackjeff' Rocha <root@slackjeff.com.br>
#
#LICENÇA
# MIT
#
#DESCRIÇÃO
# Criação de hash md5, utilizado para os diretórios packages.
#=====================================================================|

#============================| VARIÁVEIS

DIRS=(*) # Imprimindo todos diretórios
MAIN="$PWD" # Pegando diretório inicial.
ARCHIVE='estrutura.md5'

#============================| TESTES

# Excluindo arquivo estrutura.md5
[[ -e "$ARCHIVE" ]] && rm "$ARCHIVE" &>/dev/null

#============================| FUNÇÕES
_PRINT()
{
    local dir="$1"

    cat >> "${MAIN}/${ARCHIVE}" << EOF

#############################
# DIRETÓRIO: $dir
#############################

EOF
    return 0
}

echo "=============> Gerando ${ARCHIVE}, aguarde."
echo -e "# Gerado: $(date)\n" >> "${ARCHIVE}" 

for enter in ${DIRS[@]}; do
    if [[ "$enter" = "estrutura.md5" ]] || [[ "$enter" = 'md5generate.sh' ]]; then
        continue
    fi
    pushd $enter &>/dev/null
    _PRINT "$enter"
    md5sum * >> "${MAIN}/${ARCHIVE}"
    popd &>/dev/null
done