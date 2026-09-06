# Plano de Obras

Plano de execução feito a partir dos itens registados na app
[`ObrasDeCasa/`](../ObrasDeCasa/): 31 itens em 7 divisões, lidos da base de
dados do artifact.

Artifact publicado: https://claude.ai/code/artifact/17e005dc-cd74-4756-9646-864b04593018

## O que diz

A obra é feita pelo próprio, não por empreiteiros, e por isso o plano é um
manual e não um caderno de encargos.

Abre com o que não é para fazer sozinho: a fissura da chaminé (B1), que tem de
ser vista por alguém antes de se fechar o que quer que seja na cozinha, e o
limite da eletricidade (mudar uma tomada sim, mexer no quadro ou em qualquer
coisa que precise de certificado não).

Depois: como organizar o trabalho de uma pessoa só (uma divisão de cada vez,
começar pelo Escritório e acabar na Sala), o calendário de uma divisão fim de
semana a fim de semana, e a ordem dentro de cada divisão, que é sempre
eletricidade, alvenaria, carpintaria e revestimentos, pintura.

O corpo é o manual: oito tarefas com os passos numerados, os códigos dos itens
a que se aplicam, o tempo por unidade e o erro que se paga em cada uma. Fecha
com ferramentas, material e o que falta medir.

A ordem tem razões técnicas, não estéticas: a eletricidade abre parede, a
alvenaria fecha-a, a pintura estraga-se com tudo o que vier depois dela.

## As divisões

A planta do 1.º andar está em [`planta-1-andar.jpg`](planta-1-andar.jpg) e é de
lá que saem as áreas.

| Código na app | Na planta | Chão |
|---|---|---|
| A · Sala | Sala comum | 34,02 m² |
| B · Cozinha | Cozinha | 16,15 m² |
| C · Quarto AM | Quarto 2 | 12,07 m² |
| D · Quarto D | Quarto 1 | 12,24 m² |
| E · Escritório | Quarto 3 | 10,40 m² |
| F · Casa de banho | I.S. | 5,75 m² |
| G · Corredor | Corredor | 11,23 m² |

## Nota sobre os números

Os totais vêm das notas dos itens, onde as quantidades foram escritas à mão
("16 buracos parede", "13", "4"). O total de ~59 buracos é a soma dessas notas,
não uma contagem verificada no local.

As áreas de pintura são calculadas, não medidas: a planta dá áreas de chão mas
não perímetros, por isso o perímetro de cada divisão foi estimado pela sua
forma, multiplicado por um pé-direito assumido de 2,60 m, somado ao tecto e
descontado das portas e janelas. Dá 294 m² por demão, 589 m² nas duas, 60 L de
tinta. O erro esperado fica abaixo dos 10%, que é menos do que a folga de um
balde, mas o pé-direito continua por medir e é o que pode mexer no total.

O que depende de medição está marcado como tal na página em vez de inventado.

## Também dentro da app

A app [`ObrasDeCasa/`](../ObrasDeCasa/) tem um separador Plano com a versão de
bolso disto: a semana dia a dia com os dias a marcar como feitos, e as tarefas
com os passos. Esta página fica com o que não cabe num telemóvel em cima de um
escadote: as contas da tinta, a planta, o material e as decisões.

## Página estática

Sem capacidades declaradas: o plano não guarda nada nem lê a base de dados em
tempo real. Os dados foram lidos uma vez, na altura em que foi escrito.
