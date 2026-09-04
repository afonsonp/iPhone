# Ubuntu

## Obras de Casa

App para registar arranjos de casa por divisão (Cozinha = Área A, Sala = Área B),
com itens numerados automaticamente (A1, A2, B1...), fotos, especialidade e tipo
de defeito, prioridade, resumo por especialidade e lista de compras automática.

Existem duas versões neste repositório:

| Pasta | O que é | Estado |
|---|---|---|
| [`ObrasDeCasa/`](ObrasDeCasa/) | Versão web, ficheiro HTML único | **Em uso.** Publicada como Artifact e adicionada ao ecrã principal do iPhone |
| [`HomeFixNotes/`](HomeFixNotes/) | Versão nativa iOS (SwiftUI + SwiftData) | Escrita primeiro, nunca compilada: exige um Mac com Xcode |

A versão web ganhou porque funciona a partir do iPhone sozinho, sem Mac, sem
Xcode e sem conta de programador, e guarda os dados na conta Claude em vez de
depender do armazenamento local do Safari.
