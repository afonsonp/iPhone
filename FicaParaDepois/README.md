# Fica para Depois

Tudo o que te recomendaram e queres experimentar um dia: restaurantes, sítios,
séries, livros, podcasts. Resolve o problema de a recomendação morrer num
WhatsApp e não te lembrares dela quando chega a altura de decidir.

Artifact publicado: https://claude.ai/code/artifact/02c1191b-afd8-453f-be16-32e9c6532a50

## O que faz

- **Registo em dez segundos**: o que é, categoria (Comer, Ir, Ver, Ler, Ouvir),
  quem recomendou, onde, uma nota e uma foto ou captura de ecrã.
- **Perguntar ao Claude**: pela capacidade `sample`, a página pede ao Claude que
  identifique o que é a partir do nome, ou da foto quando existe, e preenche o
  resumo e a zona. Tudo fica editável à mão.
- **Sugestões**: nomes de quem recomenda e zonas já usadas aparecem como chips,
  para não se voltar a escrever.
- **Escolhe por mim**: sorteia entre os itens em aberto, respeitando o filtro de
  categoria activo.
- **Fechar o ciclo**: marca-se como feito com um veredicto (Gostei, Assim-assim,
  Não gostei) e uma linha.
- **Quem**: taxa de acerto por pessoa, contando apenas o que já foi feito e
  classificado.

## Onde ficam os dados

Coleção `entries` na base de dados do artifact, ligada à conta Claude
(capacidade `db`), com recuo automático para `localStorage` quando a conta não
responde. Exportação e importação manual em JSON incluídas.

## Notas de implementação

- `sample.json()` com `modelTier: "quick"` para identificação por texto e
  `"default"` quando envia imagem. A imagem vai como Blob produzido pelo canvas,
  e só quando `sample.limits()` reporta suporte a imagens.
- Erros de `sample` com código `not_granted`, `sampling_disabled` ou
  `not_declared` escondem a funcionalidade em vez de insistir.
- O objecto devolvido por `snapshot.data()` vem congelado: copiar antes de lhe
  acrescentar o id.
- `alert()` e `confirm()` nativos não aparecem em apps adicionadas ao ecrã
  principal do iPhone; a app usa caixas próprias.
