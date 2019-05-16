#!/bin/sh
#==========================HEADER=====================================|
#AUTOR
# Jefferson 'Slackjeff' Rocha <root@slackjeff.com.br>
#
#LICENÇA
# MIT
#
#DESCRIÇÃO
# Instalação dos pacotes do Cajado.
#=====================================================================|


#===============================| VARIÁVEIS
PRG='Sistema Cajado'
ISO="$(blkid | grep "iso9660" | cut -d ':' -f 1)" # Achando a ISO
POINT='cdrom'                                     # Ponto de montagem
ARCHIVE='/etc/categorias.conf'

#===============================| TESTES
if [[ -n "$ISO" ]]; then
    umount "$ISO" &>/dev/null
    mount "$ISO" 'cdrom' || { echo "Não foi possivel montar a ISO."; exit 1 ;}
fi

[[ ! -e "$ARCHIVE" ]] && { echo "Impossivel encontrar arquivo $ARCHIVE"; exit 1 ;}

#===============================| INICIO
pushd "/${POINT}/pacotes" &>/dev/null


echo -e '\033[32;1m' # Cor verde para instalação ;)

# Iniciando a instalação das categorias selecionadas...
while IFS= read line; do
    line="$(cut -d ' ' -f 1 <<< $line)" #Pegando primeiro campo.
    if [[ "$line" =~ ^(#|[[:space:]]+$) ]] || [[ -z "$line" ]]; then
        continue
    fi
    line="${line// /}" # Tirando espaço se houver.
    pushd "$line" &>/dev/null
    cat <<EOF

########################################################
#     CATEGORIA:     $line
########################################################

EOF
    sleep 4s
    installpkg --root /mnt *.t?z
    popd &>/dev/null
done < "$ARCHIVE"

echo -e '\033[m' # Voltando a cor normal.

cat <<EOF
############## Instalacao das categorias Instaladas com Sucesso!
EOF

