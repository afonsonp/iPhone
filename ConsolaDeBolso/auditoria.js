// Verifica que todas as missoes sao jogaveis.
//
// O risco proprio deste jogo e um passo cujo comando correcto nao se consegue
// montar com as pecas disponiveis: a missao fica bloqueada e o jogador nao tem
// como saber porque. Este script apanha isso antes de publicar.
//
// Correr com:  node auditoria.js
//
// Verifica duas coisas por passo:
//   1. pelo menos um comando de accept monta-se com as pecas da missao
//   2. cada engano listado em wrong tambem se monta (senao o feedback
//      especifico nunca chega a aparecer, e o jogador leva a mensagem generica)

const fs = require("fs");
const path = require("path");

const HTML = path.join(__dirname, "consola-de-bolso.html");

function extrairMissoes(){
  const src = fs.readFileSync(HTML, "utf8");
  const inicio = src.indexOf("function gitState");
  const fim = src.indexOf("var GLOSSARY");
  if (inicio < 0 || fim < 0) throw new Error("nao encontrei o bloco das missoes no HTML");
  const bloco = src.slice(inicio, fim);
  const modulo = { exports: {} };
  new Function("module", bloco + "\nmodule.exports = MISSIONS;")(modulo);
  return modulo.exports;
}

const norm = (x) => String(x).toLowerCase().replace(/\s+/g, " ").trim();

// Um comando so e montavel se puder ser partido exactamente nas pecas
// disponiveis, pela mesma ordem com que o jogador as toca.
function montavel(comando, pecas){
  const alvo = norm(comando);
  const toks = pecas.map(norm);
  const vistos = new Set();
  function anda(resto){
    if (resto === "") return true;
    if (vistos.has(resto)) return false;
    vistos.add(resto);
    for (const t of toks){
      if (resto === t) return true;
      if (resto.startsWith(t + " ") && anda(resto.slice(t.length + 1))) return true;
    }
    return false;
  }
  return anda(alvo);
}

const missoes = extrairMissoes();
let problemas = 0;

for (const m of missoes){
  const pecas = [];
  for (const grupo of m.tokens) for (const item of grupo.items) pecas.push(item.t);

  m.steps.forEach((passo, i) => {
    if (!passo.accept.some((a) => montavel(a, pecas))){
      problemas++;
      console.log(`BLOQUEADO   ${m.id} passo ${i + 1}: nenhum comando aceite se monta`);
      console.log(`            aceites: ${passo.accept.join(" | ")}`);
      console.log(`            pecas:   ${pecas.join(" , ")}`);
    }
    for (const engano of Object.keys(passo.wrong || {})){
      if (!montavel(engano, pecas)){
        problemas++;
        console.log(`FEEDBACK MORTO ${m.id} passo ${i + 1}: o engano "${engano}" nunca pode ser montado`);
      }
    }
  });
}

console.log(
  problemas
    ? `\n${problemas} problemas encontrados`
    : `\nAs ${missoes.length} missoes sao jogaveis`
);
process.exit(problemas ? 1 : 0);
