# Como Isto se Liga

Mapa das peças de uma aplicação a correr no ar. Não é um jogo nem um teste:
não há perguntas, respostas certas nem pontuação. Serve para responder a uma
pergunta só: quando uma aplicação está no ar, o que é que existe, como é que
as partes falam umas com as outras, e quem trata de quê.

Artifact publicado: https://claude.ai/code/artifact/698934d0-973c-4352-abfd-91126600392d

## Porque é que substitui o jogo

A Consola de Bolso ensina a montar comandos. Isso serve para quem vai escrever
os comandos. Para quem manda fazer a aplicação e precisa de perceber onde é
que o dinheiro vai, o que pára quando alguma coisa falha e a quem se pergunta
o quê, adivinhar o comando certo não ensina nada: o que falta é o mapa, não a
sintaxe.

## O que tem

Três coisas, na mesma página:

1. **O mapa.** Onze peças em SVG. O código desce, do portátil até ao servidor.
   Os pedidos de quem usa sobem, até ao mesmo servidor. A base de dados fica ao
   lado, e o cofre de segredos, as cópias de segurança e a monitorização ficam
   em baixo, ligados a tracejado porque trabalham em pano de fundo. Cada seta
   tem o nome do que ali acontece: `git push`, `dispara`, `imagem`, `deploy`,
   `abre a app`, `encaminha`, `lê e escreve`, `chaves`, `copia`, `vigia`.

2. **Toca numa peça.** Abre um painel com o que ela é, a quem se liga, quem
   trata dela, quanto custa por mês, como se chama nas ferramentas reais
   (GitHub, Docker Hub, AWS, PostgreSQL) e o que acontece exactamente se ela
   falhar.

3. **Seguir uma alteração.** Oito passos, do pedido feito nesta conversa até
   alguém estar a usar o resultado. Cada passo acende no mapa as peças e as
   setas de que fala, e apaga o resto.

No fim, seis sintomas do género "o site não abre para ninguém" ou "quanto
custa isto por mês", cada um com a resposta em duas linhas.

## Decisões de desenho

- **Sem base de dados.** A app não guarda nada de ninguém, por isso não declara
  capacidades nenhumas. Abre e funciona.
- **Sem biblioteca de diagramas.** O SVG é escrito à mão, com uma grelha fixa
  em `CAIXAS` e caminhos explícitos em `seta()`. Mudar o mapa é mexer nesses
  dois sítios.
- **As linhas de apoio andam pelas margens.** A primeira versão levava as três
  setas tracejadas a direito do fundo até ao servidor, e cruzavam por cima das
  caixas todas. Passaram a subir pelas margens, em cotovelo.
- **Tocar numa peça rola até ao painel.** No telemóvel o painel fica abaixo do
  mapa, fora do ecrã: sem isto, tocar numa peça parecia não fazer nada.
