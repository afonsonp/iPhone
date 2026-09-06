# Obras de Casa (versão web)

App para registar arranjos de casa por divisão e preparar a lista de compras.
É esta a versão em uso, publicada como Artifact da Claude e adicionada ao ecrã
principal do iPhone.

## Como funciona

- Cada divisão é uma **Área** com uma letra automática (Cozinha = A, Sala = B, ...).
- Cada problema registado numa área recebe um código sequencial: A1, A2, B1, ...
- Cada item tem **especialidade** (quem arranja) e **tipo de defeito** dentro
  dela, mais foto, notas, prioridade e estado. Não há campo de descrição livre:
  o defeito já diz o que é, e o que sobra escreve-se nas notas.
- Os materiais escolhem-se de uma **lista fechada** (`MATERIAIS`, cerca de 100
  materiais com a unidade de cada um), filtrada pela especialidade do item, com
  procura para chegar aos restantes. Cada um leva uma quantidade em passos de 1.
- Os materiais alimentam a **lista de compras**, onde o mesmo material apontado
  em vários arranjos aparece numa linha só, com as quantidades somadas
  ("Massa de reparação · 4 kg · A1, A3, A4").
- O separador **Resumo** agrupa o trabalho pendente por especialidade, com barras,
  progresso por divisão e miniaturas das fotos.

## Separador Plano

A app tem um quarto separador com o plano de execução da obra: a semana em que
a casa está disponível dia a dia, os fins de semana seguintes, e sete tarefas
expansíveis com os passos de cada tipo de trabalho e o erro típico de cada um.

Os dias marcam-se como feitos e o progresso fica guardado no documento
`plano/estado` da base de dados, num mapa de identificadores. É a única
colecção que não é uma lista: um documento só, com um campo `feitos`.

O conteúdo vem do documento completo em [`../PlanoDeObras/`](../PlanoDeObras/),
que tem as contas da tinta, a planta e o material. Aqui está a versão de
bolso, a que se consulta em cima do escadote.

## Partilha

Tanto o Resumo como a Lista de compras podem ser partilhados de duas formas:

- **Imagem**: um cartaz PNG desenhado em canvas, pronto para WhatsApp ou email.
- **Texto**: formatado para WhatsApp (negrito, emoji por especialidade e barras
  em blocos), com opção de copiar apenas a lista de uma especialidade, para
  enviar a cada profissional só o que lhe diz respeito.

## Onde ficam os dados

Na base de dados do Artifact, ligada à conta Claude do utilizador, através da
capacidade `db` (`claude.use("db")`). Coleções: `areas`, `items`, `shopping`,
mais um documento `meta/init` que marca a primeira inicialização.

Se a conta não responder (sem sessão iniciada, ou pedido de permissão que não
chega a aparecer), a app espera alguns segundos e passa sozinha a guardar em
`localStorage`, avisando no cabeçalho. Existe também exportação e importação
manual de cópia de segurança em JSON.

## Notas de implementação

Ficheiro único, sem dependências externas além dos tipos de letra IBM Plex.

- Ao ler documentos da base de dados é preciso **copiar** o objeto devolvido por
  `snapshot.data()` antes de lhe acrescentar campos: vem congelado, e escrever
  nele lança `TypeError` que rebenta o `onSnapshot` silenciosamente.
- `alert()` e `confirm()` nativos não aparecem em apps adicionadas ao ecrã
  principal do iPhone, por isso a app usa caixas próprias (`showAlert`,
  `showConfirm`).
- Dentro da app Claude a barra do topo ocupa cerca de 60px, e o fundo do ecrã
  fica fora da área visível. Por isso a navegação está no cabeçalho e não numa
  barra inferior, e o botão + está levantado do fundo.
- As escritas na base de dados têm limite de tempo (`withTimeout`); ao falhar por
  ligação, a alteração é aplicada localmente para não se perder a ação.
- Os materiais eram texto livre, e o resultado eram variantes do mesmo produto
  ("silicone", "Silicone branco", "silicone wc") que a lista de compras não
  conseguia juntar. Passaram a lista fechada: cada linha guarda `matId` e
  `unit`, e a agregação é feita por `matId`, não por comparação de nomes. As
  linhas antigas, escritas à mão, continuam a aparecer pelo nome.

## Publicar

O ficheiro é publicado como Artifact com a capacidade `db` declarada. Abrir o
`.html` diretamente no browser também funciona, mas nesse caso guarda apenas em
`localStorage`.
