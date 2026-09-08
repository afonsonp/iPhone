# Reels sobre Claude Code, MCP, skills e plugins: inventário completo

25 links pela ordem em que foram enviados. Para cada um: autor, o que diz a
legenda, o que diz o áudio, o que aparece no ecrã, e os repositórios ou sites
de cada ferramenta.

Material bruto (legenda integral, transcrição integral e uma imagem por segundo)
em `TUDO.md` e nas pastas com o código de cada reel.

Falharam 2 (15 e 20): são publicações de imagens, não vídeos.

---

## 1. Screenshot to Code
- Link: https://www.instagram.com/reel/DdAXNtQiT_w/
- Autor: Valeri Sabev
- Conteúdo: repositório open-source com 78.000 estrelas que transforma um screenshot num site funcional. Lê layout, espaçamento, tipografia e cores, gera o código, dá pré-visualização ao vivo e permite iterar na mesma janela. Suporta vários modelos de visão (Gemini 3 Pro, GPT 5.5, Claude Opus 4.8). Gera imagens de substituição com Flux. Pode ser alojado localmente com as tuas chaves de API.
- Repositório: https://github.com/abi/screenshot-to-code

## 2. 10 conceitos de IA agêntica
- Link: https://www.instagram.com/reel/DbLZq8zMSbN/
- Autor: Danica Simic
- Conteúdo (sem áudio, slides no ecrã):
  1. Harness engineering: o ambiente onde o agente actua (sandbox, sistema de ficheiros, runtime).
  2. Loop engineering: ciclo raciocinar, agir, observar; condições de paragem; limite de iterações; detectar loops infinitos.
  3. Context engineering: o que entra na janela vs o que é recuperado; compressão do histórico; degradação em contextos longos; recência vs relevância.
  4. Tool design: nomes e descrições claras; schemas de input estritos; mensagens de erro que ajudam o agente a corrigir-se; poucas ferramentas boas em vez de muitas sobrepostas.
  5. Memory architecture: curto prazo (contexto) vs longo prazo (armazenado); o que persistir entre sessões; estratégias de recuperação (pesquisa, embeddings, ficheiros); quando o agente actualiza as próprias notas.
  6. Orchestration patterns: agente único vs orquestrador com trabalhadores; handoffs; paralelo vs sequencial; quando um bom agente bate um sistema multi-agente.
  7. Guardrails e permissões: acesso a ferramentas por tarefa; ler vs escrever vs executar; filtragem de input e output; limitar o raio de dano de uma falha.
  8. Evals para agentes: avaliar trajectórias vs resultados; conjuntos de teste a partir de falhas reais; LLM como juiz; regressão após cada mudança de prompt.
  9. Human-in-the-loop: portas de aprovação para acções irreversíveis; limiares de confiança para escalar; revisão assíncrona vs bloqueante; interrupções que não matam a autonomia.
  10. Observabilidade e tracing: registar cada passo, chamada e token; visualização de traces; custo e latência por execução; alimentar evals com falhas de produção.
- Repositório: nenhum.

## 3. Cinco sites (versão 1)
- Link: https://www.instagram.com/reel/DdATYsXuH_J/
- Autor: Sachi (AI Education)
- Conteúdo (áudio): cinco sites.
  1. skills.sh: directório de skills prontas para Claude, Codex, Cursor e outros agentes. https://skills.sh
  2. mcp.so: marketplace de conectores MCP (browsers, bases de dados, ficheiros, ferramentas de negócio). https://mcp.so
  3. 21st.dev: mais de 12.000 componentes UI, templates, temas, shaders e gradientes. https://21st.dev
  4. LottieFiles: ícones animados, fundos, transições e motion graphics gratuitos. https://lottiefiles.com
  5. Mixkit: templates de vídeo gratuitos para Premiere, After Effects, Final Cut e DaVinci. https://mixkit.co

## 4. Cinco sites (versão 2, mesmo conteúdo)
- Link: https://www.instagram.com/reel/DdAAEC-Sybw/
- Autor: Sachi (AI Education)
- Conteúdo: idêntico ao reel 3. Mesmos cinco sites.

## 5. System prompt do Claude Fable 5.1
- Link: https://www.instagram.com/reel/Dc_eVJ8s-ug/
- Autor: Nathan Hodgson
- Conteúdo: ficheiro partilhado como system prompt do Claude Fable 5.1, com mais de 270.000 caracteres. Mostra instruções sobre planeamento, uso de ferramentas, tarefas de várias horas e quando parar para confirmar. A legenda avisa que é um upload da comunidade, não uma publicação oficial da Anthropic. Link entregue por DM.
- Repositório: não indicado. Fonte oficial dos system prompts publicados: https://docs.anthropic.com/en/release-notes/system-prompts

## 6. Everything Claude Code (ECC)
- Link: https://www.instagram.com/reel/Dc_iv4YKCAh/
- Autor: Kayvon Jafarzadeh
- Conteúdo: 63 agentes, 249 skills, red team do próprio código. Um programador, dez meses, 240.000 estrelas. Instalação: `/plugin marketplace add` com o repositório ECC, depois `/plugin install`. Comandos em linguagem natural: "Plan this feature" (um agente desenha a arquitectura), "Build it", "Test it" (corre testes até 80% de cobertura), "Secure it" (red team e correcção de falhas). Funciona em Claude Code, Cursor e Codex.
- Repositório: https://github.com/affaan-m/everything-claude-code
- Instalação: `/plugin marketplace add affaan-m/everything-claude-code` e `/plugin install everything-claude-code@everything-claude-code`, ou `npx ecc-universal setup`

## 7. Reset de contexto em sessões longas
- Link: https://www.instagram.com/reel/Dc9do-az5La/
- Autor: Kunaal
- Conteúdo (sem áudio, texto na legenda): ao fim de 40 prompts o Claude esquece restrições, reabre problemas resolvidos, toca em ficheiros irrelevantes. Não é o modelo que piora, é o contexto. A cada 30 minutos, repor cinco coisas:
  1. Objectivo actual.
  2. Decisões já tomadas (arquitectura, bibliotecas, abordagens).
  3. Ficheiros que importam (não arrastar meio projecto quando só 4 ficheiros contam).
  4. Restrições conhecidas (o que não pode mudar).
  5. Definição de concluído (que evidência prova que a tarefa está feita).
  Depois uma instrução: "Continue from this state. Don't reconsider completed decisions unless new evidence requires it."
- Repositório: nenhum.

## 8. 20 conectores MCP para o Claude
- Link: https://www.instagram.com/reel/Dc9ozo1BKnd/
- Autor: Sachi (AI Education)
- Conteúdo (áudio, só 4 dos 20 são nomeados):
  1. Perplexity: pesquisa actual com fontes. https://github.com/perplexityai/modelcontextprotocol
  2. Firecrawl: lê um site e devolve os dados em texto limpo. https://github.com/firecrawl/firecrawl-mcp-server
  3. Playwright: o Claude usa um browser, abre páginas, preenche formulários, tira screenshots, testa sites. https://github.com/microsoft/playwright-mcp
  4. Composio: liga o Claude a Gmail, Notion, Slack, GitHub. https://composio.dev
  Os restantes 16 são entregues por DM.

## 9. CLAUDE.md que diz ao Claude o que NÃO fazer
- Link: https://www.instagram.com/reel/DcOwUcySo8w/
- Autor: Jack Roberts
- Conteúdo: um ficheiro no GitHub com quase 200.000 estrelas. Em vez de dizer o que fazer, diz o que não fazer. Quatro regras: sem over-engineering em tarefas simples; sem assunções quando está confuso; sem alterações aleatórias; verificar sempre o trabalho antes de dizer que está feito. Ecrã mostra: "CLAUDE.md file to improve Claude Code behavior, derived from Karpathy's observations on coding pitfalls", com 196k estrelas.
- Repositório: https://github.com/forrestchang/andrej-karpathy-skills (ficheiro CLAUDE.md)

## 10. Três skills para React
- Link: https://www.instagram.com/reel/Dci1jHJhoAg/
- Autor: Gabriel Miranda (PT-BR)
- Conteúdo: o benchmark ReactBench testou 50 modelos a escrever React; todos erram em hooks e renderização de listas. Três skills que resolvem:
  1. React Doctor: 400 regras de React, feita pela equipa do benchmark. Instalar como skill. https://github.com/millionco/react-doctor
  2. React Scan: encontra dependências e re-renderizações que tornam o projecto lento. https://github.com/aidenybai/react-scan
  3. Playwright MCP: browser que a IA abre para ver o site que está a fazer e corrigir bugs. https://github.com/microsoft/playwright-mcp

## 11. Prompt Master
- Link: https://www.instagram.com/reel/Dc6dINIT27E/
- Autor: Tessa Fairbrook
- Conteúdo: skill com 11.000 estrelas. Escreves uma frase desleixada e devolve um prompt acabado com o que produzir, que ficheiros tocar e quando parar. Passa o prompt por 35 padrões que desperdiçam créditos e lembra-se do que já foi decidido. Setup: descarregar o repositório, ir a Claude, Customize, Skills, upload. Funciona também em ChatGPT e Cursor.
- Repositório: https://github.com/nidhinjs/prompt-master

## 12. Top 5 plugins para Claude Code
- Link: https://www.instagram.com/reel/Dc7G9Pxu_1O/
- Autor: Sachi (AI Education)
- Conteúdo (áudio e ecrã):
  1. OmniRoute: liga o Claude Code a mais de 300 fornecedores de API; quando o limite acaba muda para o próximo modelo; até 1,6 mil milhões de tokens gratuitos por mês. https://github.com/diegosouzapw/OmniRoute
  2. Superpowers: transforma o Claude numa equipa; faz brainstorm, planeia, escreve testes e revê o próprio código. https://github.com/obra/superpowers
  3. Caveman: o Claude responde sem palavras de enchimento nem cortesias, mesmo código com menos tokens. https://github.com/juliusbrussee/caveman
  4. Claude Code Setup: plugin oficial da Anthropic; analisa o código e recomenda hooks, skills, sub-agentes e MCP servers. `/plugin install claude-code-setup`
  5. Claude Security: scanner de segurança oficial da Anthropic; procura vulnerabilidades no código. https://github.com/anthropics/claude-code-security-review

## 13. agency-agents
- Link: https://www.instagram.com/reel/Dc8fKPEgN92/
- Autor: Jack Roberts
- Conteúdo: 280 especialistas numa pasta: engenheiros, designers, marketers, vendedores, advogados. Cada um com a sua forma de trabalhar, ferramentas e capacidades. Uma instalação coloca os 280 no portátil. Gratuito no GitHub.
- Repositórios: https://github.com/msitarzewski/agency-agents e a app de instalação https://github.com/msitarzewski/agency-agents-app

## 14. 4 plugins contra AI slop
- Link: https://www.instagram.com/reel/Dc8ojRUvOrL/
- Autor: Nick Saraev
- Conteúdo:
  1. Impeccable (design): gosto de design real a partir de referências premium. https://github.com/pbakaus/impeccable (site: https://impeccable.style). Instalação: `npx impeccable install`, depois `/impeccable`
  2. 21st Dev MCP: mais de 10.000 componentes e templates UI. https://21st.dev (Magic MCP: https://github.com/21st-dev/magic-mcp)
  3. Humanizer (escrita): remove os 33 sinais de escrita de IA e estuda o teu estilo. https://github.com/blader/humanizer
  4. Claude Code Setup (código): plugin oficial Anthropic; configura hooks, skills, MCPs e sub-agentes para o projecto. `/plugin install claude-code-setup`

## 15. 9 projectos open-source
- Link: https://www.instagram.com/p/DcRCbwwgBCJ/
- Estado: download falhou (publicação de imagens). Da pesquisa anterior: o primeiro é Open Notebook, alternativa open-source ao NotebookLM. https://github.com/lfnovo/open-notebook. Os outros 8 não foram recuperados.

## 16. DeepSeek Harness e Martty
- Link: https://www.instagram.com/reel/Dc7WMh0JwWl/
- Autor: racoonman84
- Conteúdo: para inferência local de LLMs. "DeepSeek Harness" é uma interface open-source concorrente da que Cursor e Codex partilham, corre localmente num site. "Martty" é um TUI para terminal feito para ele. O autor fez fork dos dois e removeu a telemetria. Menciona também opencode, pi e crush.
- Repositórios: não indicados no vídeo.

## 17. Sistemas para agências (marketing)
- Link: https://www.instagram.com/reel/Dcy173UgAVR/
- Autor: Austin Schneider (Agency U)
- Conteúdo: lista de sistemas para escalar uma agência: sistema operativo de clientes, framework de vendas, motor de leads, onboarding, funil de entrega, "AI employee", pipeline de contratação, reporting, tracker de resultados, NPS. Promoção do programa Agency U.
- Repositório: nenhum. Fora do tema.

## 18. 5 repositórios GitHub
- Link: https://www.instagram.com/reel/Dc6yNsduOfK/
- Autor: James (AI Startup & Founder)
- Conteúdo:
  1. Manim: animações matemáticas a partir de Python. https://github.com/3b1b/manim
  2. Trivy: scanner de vulnerabilidades e segredos em código e containers. https://github.com/aquasecurity/trivy
  3. RustDesk: remote desktop open-source. https://github.com/rustdesk/rustdesk
  4. n8n: liga IA, apps, APIs e bases de dados em automações. https://github.com/n8n-io/n8n
  5. ComfyUI: workflows de imagem e vídeo por IA em nós. https://github.com/comfyanonymous/ComfyUI
  Nota: a legenda indexada mencionava "GitHub MCP", mas o vídeo é sobre estes 5 repositórios.

## 19. Biblioteca Design.MD (2000+ design systems)
- Link: https://www.instagram.com/reel/Dc3zXkXSxpH/
- Autor: Nick Saraev
- Conteúdo: mais de 2.000 sites de marcas (Tesla, Apple, Ferrari, Anthropic) convertidos em ficheiros que o Claude Code lê. Cada ficheiro tem cores, fontes, espaçamento, layouts e regras do que usar e evitar. Escolhes o que serve, colocas no agente, e ele constrói a UI nesse estilo.
- Repositório: https://github.com/VoltAgent/awesome-design-md

## 20. 10 repositórios com 1,9M estrelas
- Link: https://www.instagram.com/p/Db9cMOwjkAL/
- Estado: download falhou (publicação de imagens, PT-BR). Conteúdo não recuperado.

## 21. Agent Skills (24 skills)
- Link: https://www.instagram.com/reel/Db_H8ScP5y-/
- Autor: Nick Saraev
- Conteúdo: pack de 24 skills feito por um antigo director de engenharia de IA da Google. Ecrã mostra 80.3k estrelas, 6.5k forks. Skills para planeamento, código, testes e publicação, activadas sozinhas na fase certa. Ecrã mostra nomes das skills: using-agent-skills, interview-me, idea-refine, spec-driven-development, planning-and-task-breakdown, incremental-implementation, test-driven-development, context-engineering. Corre revisão sénior e checklist pré-lançamento. Funciona em mais de 70 ferramentas.
- Repositório: https://github.com/addyosmani/agent-skills

## 22. 5 plugins para front-end
- Link: https://www.instagram.com/reel/DcEFABnvBuH/
- Autor: Nick Saraev
- Conteúdo (legenda e áudio divergem no 4.º; ambos listados):
  1. Taste Skill: gosto de design a partir de referências premium. https://github.com/Leonxlnx/taste-skill
  2. Web Design Guidelines: audita o código contra as regras de design da Vercel, incluindo acessibilidade. https://github.com/vercel-labs/agent-skills (skill web-design-guidelines)
  3. Awesome Design (design system completo): cores, tipografia, espaçamento, botões. https://github.com/VoltAgent/awesome-design-md
  4. Legenda: 21st Dev MCP (10.000 componentes). https://21st.dev. Áudio: Image to Code (transforma referência de design em código). Provável https://github.com/abi/screenshot-to-code
  5. Playwright CLI: o Claude abre um browser, faz screenshot do que construiu e apanha erros. https://github.com/microsoft/playwright-cli

## 23. 5 skills (PT-BR)
- Link: https://www.instagram.com/reel/DaTBmojEz7j/
- Autor: Maximiliano Carrau
- Conteúdo:
  1. Find Skills: dizes o que estás a construir, procura na biblioteca e instala. https://skills.sh
  2. Superpowers: obriga o Claude a planear e conferir o próprio trabalho antes de mexer. https://github.com/obra/superpowers
  3. claude-mem: memória entre sessões; ecrã mostra thedotmack/claude-mem. https://github.com/thedotmack/claude-mem
  4. Impeccable: gosto de design no front-end; ecrã mostra `npx impeccable install` e `/impeccable`. https://github.com/pbakaus/impeccable
  5. Task Observer: observa como trabalhas e melhora as outras skills em background. Repositório não indicado.

## 24. Ferramentas de vibe coding
- Link: https://www.instagram.com/reel/DcfUKjFhCMM/
- Autor: Rob (vibecode.rob), publicidade a Manus
- Conteúdo:
  1. Motion.dev: efeitos de hover, drag e transições. https://motion.dev
  2. "BKlayUI" (nome como soa no áudio): gráficos e visuais de dados. Não identificado.
  3. "CoconutUI" (nome como soa no áudio): componentes com animações. Não identificado.
  4. Manus: sites com back-end, publicação com um clique, analytics e SEO. https://manus.im
- Fora do tema Claude Code.

## 25. 5 sites para quem faz sites (PT)
- Link: https://www.instagram.com/reel/Dbgdd4fuH7q/
- Autor: Gabriel Rebelo
- Conteúdo:
  1. 21st.dev: biblioteca de componentes; copias o código ou o prompt. https://21st.dev
  2. Dribbble: referências de design. https://dribbble.com
  3. Variant: descreves e gera exemplos, exporta em HTML ou React. https://variant.ai
  4. shadcn/ui (dito "7CN"): menus, tabelas, formulários, botões. https://ui.shadcn.com
  5. Cult UI (dito "CultiY"): extensão do shadcn para animações. https://www.cult-ui.com
- Fora do tema Claude Code.

---

## Índice de repositórios e sites

| Ferramenta | Link | Reels |
|---|---|---|
| Everything Claude Code | https://github.com/affaan-m/everything-claude-code | 6 |
| agency-agents | https://github.com/msitarzewski/agency-agents | 13 |
| Agent Skills (Addy Osmani) | https://github.com/addyosmani/agent-skills | 21 |
| Superpowers | https://github.com/obra/superpowers | 12, 23 |
| Prompt Master | https://github.com/nidhinjs/prompt-master | 11 |
| CLAUDE.md (Karpathy) | https://github.com/forrestchang/andrej-karpathy-skills | 9 |
| Humanizer | https://github.com/blader/humanizer | 14 |
| Caveman | https://github.com/juliusbrussee/caveman | 12 |
| Taste Skill | https://github.com/Leonxlnx/taste-skill | 22 |
| Impeccable | https://github.com/pbakaus/impeccable | 14, 23 |
| Awesome DESIGN.md | https://github.com/VoltAgent/awesome-design-md | 19, 22 |
| Web Design Guidelines (Vercel) | https://github.com/vercel-labs/agent-skills | 22 |
| claude-mem | https://github.com/thedotmack/claude-mem | 23 |
| OmniRoute | https://github.com/diegosouzapw/OmniRoute | 12 |
| Claude Code Setup (oficial) | `/plugin install claude-code-setup` | 12, 14 |
| Claude Security (oficial) | https://github.com/anthropics/claude-code-security-review | 12 |
| Find Skills / skills.sh | https://skills.sh | 3, 4, 23 |
| mcp.so | https://mcp.so | 3, 4 |
| 21st.dev / Magic MCP | https://21st.dev | 3, 4, 14, 22, 25 |
| Playwright MCP | https://github.com/microsoft/playwright-mcp | 8, 10 |
| Playwright CLI | https://github.com/microsoft/playwright-cli | 22 |
| Perplexity MCP | https://github.com/perplexityai/modelcontextprotocol | 8 |
| Firecrawl MCP | https://github.com/firecrawl/firecrawl-mcp-server | 8 |
| Composio | https://composio.dev | 8 |
| React Doctor | https://github.com/millionco/react-doctor | 10 |
| React Scan | https://github.com/aidenybai/react-scan | 10 |
| Screenshot to Code | https://github.com/abi/screenshot-to-code | 1, 22 |
| Open Notebook | https://github.com/lfnovo/open-notebook | 15 |
| Manim, Trivy, RustDesk, n8n, ComfyUI | ver reel 18 | 18 |
| System prompts Anthropic | https://docs.anthropic.com/en/release-notes/system-prompts | 5 |

## Por identificar

- Reel 8: os 16 conectores restantes (só por DM).
- Reel 15 e 20: publicações de imagens, não descarregadas.
- Reel 16: repositórios de DeepSeek Harness e Martty.
- Reel 23: Task Observer.
- Reel 24: BKlayUI e CoconutUI (nomes por confirmar).
