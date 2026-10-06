# Sistema de Expansão Contínua de Fases (Brain Dots)

Este módulo foi criado para que você possa expandir o **Brain Dots: Traço Único** com quantas fases desejar (fases 41, 50, 100, 200...) no futuro com total facilidade e segurança matemática.

---

## 1. Validação Automática (`--validate`)
Para testar todas as fases já cadastradas e garantir que nenhuma fase possui arestas colidentes ou falhas matemáticas:
```bash
python add_new_level.py --validate
```
O script testará:
- **Teorema de Euler**: Garante que o quebra-cabeça é solucionável sem tirar o dedo da tela.
- **Conectividade**: Garante que nenhum nó ficou isolado.
- **Distância de Colisão (>12px)**: Garante que nenhuma reta passe por cima de pontos intermediários (impedindo o bug de toque acidental).

---

## 2. Geração Automática em Lote (`--generate N`)
Quer adicionar 10, 20 ou 50 novas fases com apenas um comando?
Execute:
```bash
python add_new_level.py --generate 10
```
O script irá:
1. Gerar 10 geometrias inéditas (mandalas estelares, polígonos radias, anéis concêntricos e fractais).
2. Validar a matemática euleriana de cada uma.
3. Inserir no banco de dados `levels_data.json`.
4. Atualizar automaticamente o jogo web (`index.html`) e o app Android (`assets/www/index.html`)!

---

## 3. Adicionar uma Fase Manualmente
Você pode criar suas próprias formas editando diretamente o arquivo `levels_data.json` ou passando a estrutura:
```json
{
  "id": 41,
  "title": "Nova Constelação",
  "subtitle": "Desafio Cósmico",
  "nodes": [
    [150, 60],
    [240, 150],
    [150, 240],
    [60, 150]
  ],
  "edges": [
    [0, 1], [1, 2], [2, 3], [3, 0], [0, 2], [1, 3]
  ],
  "chapter": 4
}
```
Depois de salvar, execute `python add_new_level.py --validate` para verificar e sincronizar!
