# Consola de Bolso

Jogo para aprender Git, GitHub, GitLab e Docker no telemóvel. Os comandos são
reais, mas montam-se tocando em peças em vez de se escreverem, porque escrever
`docker run -d -p 8080:80 nginx` num iPhone é um castigo.

Artifact publicado: https://claude.ai/code/artifact/664a18a5-1b2b-4753-9ac3-e07fded549cc

## Como está organizado

32 missões em nove trilhos, desbloqueadas por ordem dentro de cada trilho. Na
lista, os trilhos abrem e fecham, e abre sozinho o primeiro que ainda tenha
missões por fazer.

| Trilho | Missões |
|---|---|
| Terminal | onde estou, ler ficheiros de registo, copiar e apagar, entrar noutra máquina por ssh |
| Git e GitHub | primeiro commit, enviar para o GitHub, ramos, pull request, resolver conflito |
| GitLab | vocabulário (merge request, group), primeiro `.gitlab-ci.yml`, pipeline vermelho |
| Docker | imagem vs contentor, parar e limpar, construir imagem própria, compose |
| Kubernetes | do contentor ao cluster, um pod que não arranca |
| Bases de dados | consultar, alterar sem estragar, a cópia que salva o negócio |
| Redes e DNS | o site não abre, portas e certificados, muita gente ao mesmo tempo |
| Segurança | quem entra e como, menor privilégio, o dia em que corre mal |
| Ciclo de vida | do computador ao ar, ambientes, produção em baixo, o que uma app precisa para durar, um pedido do princípio ao fim |

Os trilhos do terminal, Git, GitLab, Docker, Kubernetes e bases de dados usam
comandos reais. Os de redes, segurança e ciclo de vida usam decisões, porque o
que se aprende aí não é sintaxe: é a ordem de fazer as coisas e o que não
fazer.

Cada missão dá até três estrelas: perdem-se com enganos e com pistas pedidas.
Há ainda um glossário consultável fora do jogo.

## O que faz isto ensinar em vez de decorar

A visualização do estado. No Git são quatro zonas (Trabalho, Staging, Local,
servidor) e vêem-se os ficheiros a saltar de caixa em caixa conforme os
comandos, que é precisamente a parte que não se percebe a ler documentação.
Cada domínio tem as suas zonas: Imagens e Contentores no Docker, Deployments e
Pods no Kubernetes, Tabelas e Resultado nas bases de dados, DNS, Servidor e
Portas nas redes, e Computador, Repositório, Testes e Produção no ciclo de
vida.

Os enganos mais comuns têm resposta própria em vez de um erro genérico: `git
commit` sem `-m`, `docker ps` quando o contentor está parado, `docker build`
sem o ponto final, `docker rm` numa imagem. A explicação de um engano vale em
qualquer passo da missão, não só naquele onde está escrita.

Algumas armadilhas aparecem de propósito como opção errada, com explicação:
`push --force`, apagar um teste para o pipeline ficar verde, corrigir código
diretamente dentro do servidor, escrever chaves no código, copiar dados reais
de produção para o ambiente de testes.

## Estrutura do conteúdo

Cada missão é um objecto com `initial` (estado), `tokens` (as peças
disponíveis) e `steps`. Cada passo tem `accept` (comandos correctos), `hint`,
`explain`, `wrong` (mapa de engano para explicação) e `apply(state)`, que devolve
o texto da consola e altera o estado.

O `normalize()` compara comandos em minúsculas e com espaços colapsados, por isso
uma peça escrita `Dockerfile` casa com um `accept` escrito `dockerfile`.

## Auditoria antes de publicar

Existe um risco próprio deste formato: um passo cujo comando correcto não se
consegue montar com as peças disponíveis deixa a missão bloqueada. Foi o que
aconteceu na missão do Dockerfile, onde faltava a peça `f6e5d4`.

Por isso existe o `auditoria.js`: para cada passo, tenta segmentar cada comando
aceite na sequência de peças disponíveis, e avisa também quando um engano
listado em `wrong` não se consegue montar (nesse caso o feedback específico
nunca chegaria a aparecer). Correr sempre que se acrescentem missões:

```
node auditoria.js
```

## Onde fica o progresso

Documento `progress/main` na base de dados do artifact (capacidade `db`), com
recuo para `localStorage`.
