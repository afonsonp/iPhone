# HomeFixNotes

App nativa para iPhone (SwiftUI + SwiftData) para registar obras/arranjos de
casa por área e gerar a lista de compras automaticamente.

## Como funciona

- Cada divisão da casa é uma **Área**, identificada automaticamente por letra
  (Cozinha = Área A, Sala = Área B, ...).
- Cada problema registado numa área recebe um código sequencial dentro dessa
  área (A1, A2, A3... na Cozinha; B1, B2... na Sala).
- Por item podes tirar/escolher uma foto, escolher o tipo de problema
  (Buraco, Fechadura, Fios/Elétrico, Acabamento, Pintura, Canalização,
  Carpintaria, Outro), escrever notas e indicar os materiais necessários.
- O resumo no topo da lista de áreas mostra contagens por tipo (ex.: "10
  buracos", "3 fechaduras") para teres a visão geral rápida.
- Os materiais indicados em cada item alimentam automaticamente a **Lista de
  compras**, onde também podes adicionar itens manuais e marcar o que já
  compraste.

Os dados ficam guardados localmente no iPhone (SwiftData/CoreData), sem
necessidade de conta ou internet.

## Abrir e correr no Xcode

1. Precisas de um Mac com **Xcode 15+** e iOS 17 SDK.
2. Abre `HomeFixNotes.xcodeproj`.
3. Seleciona um simulador de iPhone (ou o teu dispositivo) e corre com
   `Cmd+R`.
4. Para testar a câmara tens de correr num iPhone físico (o simulador não
   tem câmara real).

### Nota sobre o bundle identifier

O projeto vem com `PRODUCT_BUNDLE_IDENTIFIER = com.conkord.homefixnotes` e
`CODE_SIGN_STYLE = Automatic`. Para instalar num iPhone físico, muda o
bundle identifier para algo único teu e seleciona a tua equipa de
assinatura (Signing & Capabilities no Xcode).

## Estado deste projeto

Este projeto foi gerado num ambiente Linux sem Xcode disponível, por isso o
código e o `project.pbxproj` foram escritos e revistos manualmente mas
**não foram compilados nem testados em simulador/dispositivo**. Ao abrir no
Xcode, se houver algum erro de compilação (raro para SwiftUI/SwiftData
simples), é normalmente uma correção pontual — diz-me o erro e eu corrijo.

## Possíveis extensões futuras

- Exportar a lista de compras em PDF/texto para partilhar.
- Filtrar itens por estado (Pendente / Em curso / Concluído).
- Sincronização entre dispositivos via iCloud (SwiftData + CloudKit).
