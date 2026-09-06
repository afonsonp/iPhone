# Plano de Obras

Plano de execução feito a partir dos itens registados na app
[`ObrasDeCasa/`](../ObrasDeCasa/): 31 itens em 7 divisões, lidos da base de
dados do artifact.

Artifact publicado: https://claude.ai/code/artifact/17e005dc-cd74-4756-9646-864b04593018

## O que diz

Cinco fases por ordem obrigatória, não por preferência: eletricidade, alvenaria
e estuque, carpintaria e revestimentos, pintura, pavimento do corredor. Cada
fase leva os códigos dos itens que lhe pertencem e uma linha a dizer porque é
que está naquele lugar da sequência (a eletricidade abre parede, a alvenaria
fecha-a, a pintura estraga-se com tudo o que vier depois).

Antes das fases há um aviso: a fissura da chaminé (B1) tem de ser vista antes
de se fechar seja o que for na cozinha, porque uma fissura estrutural tapada
volta a abrir com a parede já pintada.

Fecha com a lista de material estimado, o que falta medir para pedir orçamentos
(metros quadrados por divisão, metros de rodapé, que pavimento é o do corredor)
e como pedir esses orçamentos.

## Nota sobre os números

Os totais vêm das notas dos itens, onde as quantidades foram escritas à mão
("16 buracos parede", "13", "4"). O total de ~59 buracos é a soma dessas notas,
não uma contagem verificada no local. As quantidades de material são ordens de
grandeza declaradas como tal, e o que depende de medição está marcado como
"por medir" em vez de inventado.

## Página estática

Sem capacidades declaradas: o plano não guarda nada nem lê a base de dados em
tempo real. Os dados foram lidos uma vez, na altura em que foi escrito.
