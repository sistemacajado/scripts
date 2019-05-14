#!/bin/sh
#==========================HEADER=====================================|
#AUTOR
# Jefferson 'Slackjeff' Rocha <root@slackjeff.com.br>
#
#LICENÇA
# MIT
#
#DESCRIÇÃO
# Configuração de Teclado ABNT2 para LIVE-CD Cajado
#=====================================================================|

echo "Configurando Teclado ABNT2..."
if tar xzOf /etc/keymaps.tar.gz br-abnt2.bmap | loadkmap; then
    echo "Teclado ABNT2 Configurado."
else
    echo "Não foi possivel configurar o teclado para ABNT2"
    echo "Comando: tar xzOf /etc/keymaps.tar.gz br-abnt2.bmap | loadkmap"
    echo "Falhou..."
fi
