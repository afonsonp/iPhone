# Ubuntu

Aplicações para iPhone construídas com o Claude Code, cada uma num ficheiro HTML
único, publicada como Artifact e adicionada ao ecrã principal do telemóvel. Os
dados de cada uma ficam guardados na conta Claude, com recuo automático para
armazenamento local quando a conta não responde.

| Pasta | O que é |
|---|---|
| [`ObrasDeCasa/`](ObrasDeCasa/) | Registo de arranjos de casa por divisão (Cozinha = Área A, itens A1, A2...), com fotos, especialidade e tipo de defeito, resumo por especialidade e lista de compras automática |
| [`FicaParaDepois/`](FicaParaDepois/) | Tudo o que te recomendaram e queres experimentar um dia, com quem recomendou e quem costuma acertar |
| [`ConsolaDeBolso/`](ConsolaDeBolso/) | Jogo de 32 missões em nove trilhos: terminal, Git, GitHub, GitLab, Docker, Kubernetes, bases de dados, redes e DNS, segurança e ciclo de vida de uma aplicação |
| [`HomeFixNotes/`](HomeFixNotes/) | Primeira tentativa da app das obras em SwiftUI nativo. Nunca compilada: exige um Mac com Xcode. Substituída pela versão web |

## Porquê web e não nativo

A primeira versão foi escrita em SwiftUI, e ficou impossível de usar: compilar
uma app iOS exige um Mac com Xcode e uma conta de programador. A versão web
resolve isso, funciona a partir do iPhone sozinha, e ainda ganha sincronização
entre dispositivos por ficar ligada à conta.

## Lições que se pagaram caro

Estão nos README de cada pasta, mas as que valem para todas:

- O objecto devolvido por `snapshot.data()` na base de dados vem congelado.
  Escrever nele lança `TypeError` e rebenta o `onSnapshot` sem aviso visível.
- `alert()` e `confirm()` nativos não aparecem em apps adicionadas ao ecrã
  principal do iPhone. Parece que o botão não faz nada. Usar caixas próprias.
- Dentro da app Claude, a barra do topo ocupa cerca de 60px e o fundo do ecrã
  fica fora da área visível. Navegação no cabeçalho, não numa barra inferior.
- Não gravar estado antes de o ter lido: o primeiro render escrevia por cima dos
  dados guardados antes sequer de os carregar.
- Toda a escrita para a conta leva limite de tempo. Sem isso, um pedido que fica
  pendurado deixa a app bloqueada sem erro nenhum.
