# Claude Code, MCP, skills e plugins: informação dos 25 reels organizada por tema

Cada entrada: o que faz (segundo os reels), link, e em que reels aparece.
Detalhe por reel em `README.md`; legendas e transcrições integrais em `TUDO.md`.

---

## 1. Frameworks completos (agentes + skills + regras)

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| Everything Claude Code (ECC) | 63 a 68 agentes, 249 a 286 skills, hooks, memória, red team do próprio código. "Plan this feature", "Build it", "Test it" (80% cobertura), "Secure it". Claude Code, Cursor, Codex. Instalar: `/plugin marketplace add affaan-m/everything-claude-code` e `/plugin install everything-claude-code@everything-claude-code` | https://github.com/affaan-m/everything-claude-code | 6 |
| Agent Skills (Addy Osmani) | 24 skills do ciclo completo: interview-me, idea-refine, spec-driven-development, planning-and-task-breakdown, incremental-implementation, test-driven-development, context-engineering. Activa a skill certa em cada fase, revisão sénior e checklist pré-lançamento. 80k estrelas | https://github.com/addyosmani/agent-skills | 21 |
| Superpowers | Transforma o Claude numa equipa: brainstorm, planeamento, testes, revisão do próprio código antes de mexer no projecto | https://github.com/obra/superpowers | 12, 23 |
| agency-agents | 280 personas especializadas (engenheiros, designers, marketing, vendas, jurídico), cada uma com ferramentas próprias. App de instalação separada | https://github.com/msitarzewski/agency-agents e https://github.com/msitarzewski/agency-agents-app | 13 |
| OpenHands | Agente de código autónomo: escreve, testa e publica | https://github.com/All-Hands-AI/OpenHands | 20 |

## 2. Skills de prompting e comportamento

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| Prompt Master | Reescreve um prompt vago num prompt completo (o que produzir, que ficheiros tocar, quando parar). 35 padrões de desperdício. Também ChatGPT e Cursor | https://github.com/nidhinjs/prompt-master | 11 |
| CLAUDE.md (Karpathy) | Ficheiro que diz ao Claude o que NÃO fazer: sem over-engineering, sem assumir quando confuso, sem alterações aleatórias, verificar antes de dizer "feito". 196k estrelas | https://github.com/forrestchang/andrej-karpathy-skills | 9 |
| Caveman | Respostas sem enchimento nem cortesias, mesmo código com menos tokens | https://github.com/juliusbrussee/caveman | 12 |
| I Have ADHD | Respostas directas, trabalho em passos, sem padding | https://github.com/ayghri/i-have-adhd | 15 |
| Task Observer | Observa como trabalhas e melhora as outras skills em background | https://github.com/rebelytics/one-skill-to-rule-them-all | 23 |
| Find Skills / skills.sh | Directório de skills; dizes o que constróis e instala as certas | https://skills.sh | 3, 4, 23 |
| Book to Skill | Transforma livros em skills, carrega só o capítulo relevante | https://github.com/virgiliojr94/book-to-skill | 15 |

## 3. Skills de escrita

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| Humanizer | Remove os 33 sinais de escrita de IA e estuda o teu estilo | https://github.com/blader/humanizer | 14 |
| No AI Slop | Remove mais de 20 padrões de escrita de IA e mostra onde aparecem | https://github.com/petergyang/no-ai-slop | 15 |

## 4. Design e front-end

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| Taste Skill | Gosto de design a partir de referências premium; UI deixa de parecer vibe-coded. Instalar: `npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"` | https://github.com/Leonxlnx/taste-skill | 22 |
| Impeccable | Mesmo objectivo, outro autor. Instalar: `npx impeccable install`, usar `/impeccable` | https://github.com/pbakaus/impeccable | 14, 23 |
| Awesome DESIGN.md | Mais de 2.000 sites de marcas (Tesla, Apple, Ferrari, Anthropic) convertidos em ficheiros DESIGN.md com cores, fontes, espaçamento, layouts e regras | https://github.com/VoltAgent/awesome-design-md | 19, 22 |
| Web Design Guidelines (Vercel) | Audita o código contra as regras de design da Vercel, incluindo acessibilidade | https://github.com/vercel-labs/agent-skills | 22 |
| 21st.dev / Magic MCP | 10.000 a 12.000 componentes UI, templates, temas, shaders; copiar código ou prompt | https://21st.dev e https://github.com/21st-dev/magic-mcp | 3, 4, 14, 22, 25 |
| Screenshot to Code | Screenshot para site funcional; Gemini 3 Pro, GPT 5.5, Claude Opus 4.8; imagens com Flux; self-hosted. 78k estrelas | https://github.com/abi/screenshot-to-code | 1, 22 |
| open-design | Alternativa open-source ao Claude Design; o agente de código vira motor de design | https://github.com/nexu-io/open-design | 20 |
| React Doctor | 400 regras de React, da equipa do benchmark ReactBench | https://github.com/millionco/react-doctor | 10 |
| React Scan | Detecta re-renderizações e dependências que tornam o projecto lento | https://github.com/aidenybai/react-scan | 10 |
| shadcn/ui | Base de componentes: menus, tabelas, formulários, botões | https://ui.shadcn.com | 25 |
| Cult UI | Extensão do shadcn para animações | https://www.cult-ui.com | 25 |
| Motion.dev | Hover, drag e transições | https://motion.dev | 24 |
| LottieFiles | Ícones animados, fundos, transições | https://lottiefiles.com | 3, 4 |
| Dribbble | Referências de design | https://dribbble.com | 25 |
| Variant | Descreves e gera exemplos exportáveis em HTML ou React | https://variant.ai | 25 |
| Mixkit | Templates de vídeo gratuitos | https://mixkit.co | 3, 4 |

## 5. MCP e conectores

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| Playwright MCP | O Claude abre um browser, preenche formulários, tira screenshots, testa o que construiu | https://github.com/microsoft/playwright-mcp | 8, 10 |
| Playwright CLI | Mesma ideia em linha de comandos; screenshot do que acabou de construir | https://github.com/microsoft/playwright-cli | 22 |
| Perplexity MCP | Pesquisa actual com fontes | https://github.com/perplexityai/modelcontextprotocol | 8 |
| Firecrawl MCP | Lê um site e devolve texto limpo | https://github.com/firecrawl/firecrawl-mcp-server | 8 |
| Composio | Liga o Claude a Gmail, Notion, Slack, GitHub | https://composio.dev | 8 |
| mcp.so | Marketplace de conectores MCP | https://mcp.so | 3, 4 |
| awesome-mcp-servers | Milhares de servidores MCP listados | https://github.com/punkpeye/awesome-mcp-servers | 20 |
| OpenSEO | Alternativa a Semrush e Ahrefs com suporte MCP | https://github.com/every-app/open-seo | 15 |
| 16 conectores restantes do reel 8 | Só por DM da autora | https://www.instagram.com/reel/Dc9ozo1BKnd/ | 8 |

## 6. Memória, contexto e limites

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| claude-mem | Memória persistente entre sessões; lembra projectos e ficheiros. Instalar: `npx claude-mem install` ou `/plugin marketplace add thedotmack/claude-mem` | https://github.com/thedotmack/claude-mem | 23 |
| OmniRoute | Gateway para mais de 300 fornecedores; quando o limite acaba muda de modelo; até 1,6 mil milhões de tokens gratuitos por mês | https://github.com/diegosouzapw/OmniRoute | 12, 15 |
| Reset de contexto (técnica) | A cada 30 minutos repor: objectivo actual, decisões tomadas, ficheiros que importam, restrições, definição de concluído. Depois: "Continue from this state. Don't reconsider completed decisions unless new evidence requires it." | sem repositório | 7 |
| Ollama | Corre Llama, Mistral e DeepSeek localmente | https://github.com/ollama/ollama | 20 |
| DeepSeek Harness | Harness open-source (MIT) para agentes com LLMs locais, interface web | https://github.com/deepseek-ai/deepseek-harness | 16 |
| Martty | TUI em Rust para o DeepSeek Harness | https://github.com/openma-ai/Martty | 16 |

## 7. Plugins oficiais Anthropic e segurança

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| Claude Code Setup | Analisa o projecto e configura hooks, skills, MCPs e sub-agentes adequados; remove o que sobra | `/plugin install claude-code-setup` | 12, 14 |
| Claude Security | Scanner de segurança oficial; procura vulnerabilidades no código | https://github.com/anthropics/claude-code-security-review | 12 |
| Strix | Agentes que testam vulnerabilidades e devolvem provas de conceito e correcções | https://github.com/usestrix/strix | 15 |
| Trivy | Scanner de vulnerabilidades e segredos em código e containers | https://github.com/aquasecurity/trivy | 18 |
| System prompt do Claude Fable 5.1 | Ficheiro de 270.000 caracteres partilhado pela comunidade, não oficial | https://docs.anthropic.com/en/release-notes/system-prompts (oficial) | 5 |

## 8. Conceitos (sem ferramenta)

| Tema | Conteúdo | Reels |
|---|---|---|
| 10 conceitos de IA agêntica | Harness engineering, loop engineering, context engineering, tool design, memory architecture, orchestration patterns, guardrails e permissões, evals, human-in-the-loop, observabilidade. Detalhe de cada um no README, reel 2 | 2 |
| Prompts com restrições | Metade do prompt é o que não queres; corrige a "ansiedade" do modelo removendo em vez de acrescentar | 9 |
| Manter contexto em sessões longas | Ver secção 6, reset de contexto | 7 |

## 9. Automação, IA local e outros repositórios

| Ferramenta | O que faz | Link | Reels |
|---|---|---|---|
| n8n | Automações que ligam IA, apps, APIs e bases de dados | https://github.com/n8n-io/n8n | 18 |
| Langflow | Construtor visual de agentes e RAG; publica como API ou servidor MCP | https://github.com/langflow-ai/langflow | 20 |
| awesome-llm-apps | Mais de 100 agentes e apps RAG com código | https://github.com/Shubhamsaboo/awesome-llm-apps | 20 |
| ComfyUI | Imagem e vídeo local por grafo de nós | https://github.com/Comfy-Org/ComfyUI | 15, 18 |
| Open Notebook | Alternativa ao NotebookLM | https://github.com/lfnovo/open-notebook | 15 |
| AI Job Search | Claude Code para procura de emprego: CVs, cartas, entrevistas | https://github.com/MadsLorentzen/ai-job-search | 15 |
| Scrapling | Scraping com bypass de Cloudflare | https://github.com/D4Vinci/Scrapling | 20 |
| Manim | Animações matemáticas a partir de Python | https://github.com/3b1b/manim | 18 |
| RustDesk | Remote desktop open-source | https://github.com/rustdesk/rustdesk | 18 |
| awesome | Lista de todas as listas | https://github.com/sindresorhus/awesome | 20 |
| public-apis | Mais de 1.400 APIs gratuitas | https://github.com/public-apis/public-apis | 20 |
| free-for-dev | Serviços com tier gratuito permanente | https://github.com/ripienaar/free-for-dev | 20 |
| Manus | Sites com back-end, publicação com um clique | https://manus.im | 24 |

## 10. Fora do tema

| Reel | Conteúdo |
|---|---|
| 17 | Austin Schneider, sistemas para escalar agências de marketing (Agency U) |
| 24 | Rob, ferramentas de vibe coding, publicidade a Manus; BKlayUI e CoconutUI por confirmar |

---

## Índice reel a reel

| # | Link | Tema |
|---|---|---|
| 1 | https://www.instagram.com/reel/DdAXNtQiT_w/ | Screenshot to Code |
| 2 | https://www.instagram.com/reel/DbLZq8zMSbN/ | 10 conceitos de IA agêntica |
| 3 | https://www.instagram.com/reel/DdATYsXuH_J/ | 5 sites: skills.sh, mcp.so, 21st.dev, LottieFiles, Mixkit |
| 4 | https://www.instagram.com/reel/DdAAEC-Sybw/ | Igual ao 3 |
| 5 | https://www.instagram.com/reel/Dc_eVJ8s-ug/ | System prompt do Claude |
| 6 | https://www.instagram.com/reel/Dc_iv4YKCAh/ | Everything Claude Code |
| 7 | https://www.instagram.com/reel/Dc9do-az5La/ | Reset de contexto |
| 8 | https://www.instagram.com/reel/Dc9ozo1BKnd/ | 20 conectores MCP |
| 9 | https://www.instagram.com/reel/DcOwUcySo8w/ | CLAUDE.md Karpathy |
| 10 | https://www.instagram.com/reel/Dci1jHJhoAg/ | React Doctor, React Scan, Playwright MCP |
| 11 | https://www.instagram.com/reel/Dc6dINIT27E/ | Prompt Master |
| 12 | https://www.instagram.com/reel/Dc7G9Pxu_1O/ | OmniRoute, Superpowers, Caveman, Claude Code Setup, Claude Security |
| 13 | https://www.instagram.com/reel/Dc8fKPEgN92/ | agency-agents |
| 14 | https://www.instagram.com/reel/Dc8ojRUvOrL/ | Impeccable, 21st Dev MCP, Humanizer, Claude Code Setup |
| 15 | https://www.instagram.com/p/DcRCbwwgBCJ/ | 9 projectos open-source |
| 16 | https://www.instagram.com/reel/Dc7WMh0JwWl/ | DeepSeek Harness, Martty |
| 17 | https://www.instagram.com/reel/Dcy173UgAVR/ | Marketing de agências |
| 18 | https://www.instagram.com/reel/Dc6yNsduOfK/ | Manim, Trivy, RustDesk, n8n, ComfyUI |
| 19 | https://www.instagram.com/reel/Dc3zXkXSxpH/ | Awesome DESIGN.md |
| 20 | https://www.instagram.com/p/Db9cMOwjkAL/ | 10 repositórios com 1,9M estrelas |
| 21 | https://www.instagram.com/reel/Db_H8ScP5y-/ | Agent Skills (Addy Osmani) |
| 22 | https://www.instagram.com/reel/DcEFABnvBuH/ | Taste Skill, Web Design Guidelines, Awesome DESIGN.md, 21st Dev / Image to Code, Playwright CLI |
| 23 | https://www.instagram.com/reel/DaTBmojEz7j/ | Find Skills, Superpowers, claude-mem, Impeccable, Task Observer |
| 24 | https://www.instagram.com/reel/DcfUKjFhCMM/ | Motion.dev, Manus, outros |
| 25 | https://www.instagram.com/reel/Dbgdd4fuH7q/ | 21st.dev, Dribbble, Variant, shadcn/ui, Cult UI |
