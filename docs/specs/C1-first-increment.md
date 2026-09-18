# Spec: Primeiro Incremento Jogável (C1)

## Objetivo
Descrever o menor incremento jogável que demonstra a proposta do jogo.

## Decisões

- Nome do incremento: 
- Escopo mínimo: 
 - Nome do incremento: Protótipo de Combate Mínimo
 - Escopo mínimo: Cena única com jogador controlável (movimento, pulo), ataque corpo a corpo simples, um inimigo que recebe dano, e mecânica de rolada (dash/evade) com cooldown

- Papel do jogador: Jogador controla um homem cujo objetivo é derrotar criaturas folclóricas (confirmado)
- Tom do jogo: Sério

## Requisitos

<!-- Requisitos serão adicionados aqui seguindo o formato em references/formato-requisitos.md -->

- R-001 Movimento e Pulo (Prioridade: Alta, Status: PRONTO)
	- Descrição: O jogador pode mover-se lateralmente e pular.
	- Critério de aceitação (Dado/Quando/Então):
		- Dado que o protótipo está rodando,
		- Quando o jogador pressiona `A` ou `D`,
		- Então o personagem se move horizontalmente com velocidade inicial configurada.
		- Dado que o jogador está no chão,
		- Quando o jogador pressiona `W`,
		- Então o personagem executa um pulo observável.

- R-002 Ataque básico (Prioridade: Alta, Status: PRONTO)
	- Descrição: O jogador pode atacar e infligir dano a um inimigo próximo.
	- Critério de aceitação:
		- Dado que um inimigo está dentro do alcance de ataque,
		- Quando o jogador pressiona `K`,
		- Então o inimigo recebe `1` de dano e perde vida; se a vida do inimigo chegar a 0, ele é removido da cena.

- R-003 Rolada / Dodge (Prioridade: Alta, Status: PRONTO)
	- Descrição: O jogador executa uma rolada curta que o desloca rapidamente e concede invulnerabilidade temporária.
	- Parâmetros implementados: duração = 0.25s, distância ≈150px, invulnerabilidade = 0.25s, cooldown = 0.8s.
	- Critério de aceitação:
		- Dado que a rolada não está em cooldown,
		- Quando o jogador pressiona `Shift (esquerdo)`,
		- Então o jogador realiza uma rolada curta (dash) e fica imune a danos durante a duração, e não pode rolard novamente até o cooldown terminar.


## Perguntas em aberto

- 

