#!/usr/bin/env bash
#=====================HEADER=========================================|
#AUTOR
# Jefferson 'Slackjeff' Rocha <root@slackjeff.com.br
#
#LICENÇA
# mit
#
# Gerador de ISO para o Cajado, execute no diretório raiz de onde
# está o sistema.
#====================================================================|

#==============================| Variáveis
SYSTEM='Cajado'
VERSION='1.0'

#==============================| TESTES
# Existe?
type mkisofs &>/dev/null || { echo "mkisofs Não foi encontrado."; exit 1;}


#==============================| INICIO

echo "Executando mkisofs..."
sleep 2s
mkisofs -o /tmp/cajado-workstation-1.0-x86_64.iso          \
  -R -J -A "$SYSTEM"                                       \
  -hide-rr-moved                                           \
  -v -d -N                                                 \
  -no-emul-boot -boot-load-size 4 -boot-info-table         \
  -sort isolinux/iso.sort                                  \
  -b isolinux/isolinux.bin                                 \
  -c isolinux/isolinux.boot                                \
  -eltorito-alt-boot -no-emul-boot -eltorito-platform 0xEF \
  -eltorito-boot isolinux/efiboot.img                      \
  -m 'source' \
  -V "${SYSTEM}${VERSION}" .
