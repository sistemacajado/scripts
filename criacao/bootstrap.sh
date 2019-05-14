#!/bin/sh
#==========================HEADER=====================================|
#AUTOR
# Jefferson 'Slackjeff' Rocha <root@slackjeff.com.br>
#
#LICENÇA
# MIT
#
#DESCRIÇÃO
# Instalação dos pacotes para o sistema Cajado
#=====================================================================|

PRG='Sistema Cajado Bootstrap'

select_menu=$(
      dialog --stdout                                                    \
      --backtitle "$PRG"                                                 \
      --title "Categorias"                                               \
      --separate-output                                                  \
      --checklist "Selecione as Categorias para Instalação.

      As opções que já estão marcadas são as RECOMENDADAS. Se você desmarcar
      uma destas opções, seu sistema não funcionará da maneira correta.
      Isto causará BUGS e talvez seu sistema não fique FUNCIONAL...
      "                                                                  \
      0 0 0                                                              \
      base            'Base do Sistema, [RECOMENDADO]' on                \
      bibliotecas     'Bibliotecas de programas [RECOMENDADO]' on        \
      cli-apps        'Aplicativos que funcionam via CLI' on             \
      desenvolvimento 'Compiladores, linguagens etc... [RECOMENDADO]' on \
      internet        'Aplicativos para rede e serviços de rede' on      \
      xorg            'Sistema X [RECOMENDADO]' on                       \
      xfce            'Interface Gráfica XFCE' off                       \
      x-apps          'Aplicativos que rodam no X' off
)

# Começando a instalação
while IFS= read linha; do
    installpkg 
done <<< "$select_menu"