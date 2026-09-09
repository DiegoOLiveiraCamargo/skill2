# Formato de Requisito

Um requisito deve conter:

- `id`: identificador único (ex: C1-R001)
- `titulo`: curta descrição
- `prioridade`: ALTA | MÉDIA | BAIXA
- `status`: PROPOSTO | PRONTO | EM ANDAMENTO | CONCLUÍDO
- `origem`: justificativa curta (quem decidiu e por quê)
- `criterios-de-aceitacao`: pelo menos um critério no formato Dado / Quando / Então

Exemplo:

- id: C1-R001
- titulo: Jogador pode pular
- prioridade: ALTA
- status: PROPOSTO
- origem: Decisão do aluno — pular necessário para atravessar obstáculos
- criterios-de-aceitacao:
  - Dado: o jogador está no chão
    Quando: o jogador pressiona a tecla de pulo
    Então: o avatar sobe 2 unidades e não atravessa o chão
