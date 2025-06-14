# Orfeu no Submundo – Simulador de Jornada no Hades

Este projeto simula a jornada de Orfeu pelo submundo grego para resgatar Eurídice, usando um sistema de salas com transições probabilísticas, pontuação temática (poder místico) e regras inspiradas na mitologia.

## Descrição

- O jogo percorre 12 salas do submundo, sorteando a sala inicial e cada passo seguinte conforme uma matriz de probabilidades.
- O jogador (Orfeu) ganha ou perde pontos de "poder místico" conforme os tipos de salas visitadas.
- A pontuação é controlada por uma pilha, representando os altos e baixos da jornada.
- Se ao final da 12ª sala o poder místico for 150 ou mais, Orfeu resgata Eurídice!
- O código gera gráficos de frequência de visitas e evolução do poder místico.

## Pré-requisitos

- [Julia] (https://julialang.org/) (A versão utilizada foi a 1.10.9)
- As bibliotecas: `Distributions`, `Plots` e `StatsBase`

## Instalação

1. Clone este repositório:
    ```sh
    git clone https://github.com/LucasSantiago257/AV3-Markov-Julia.git
    cd AV3-Markov-Julia
    ```
2. Abra o terminal nesta pasta e ative o ambiente do projeto:
    ```sh
    julia --project=.
    ```
3. No REPL do Julia, pressione `]` (para modo pacote) e digite:
    ```
    instantiate
    ```
    Isso irá instalar todas as dependências necessárias.

3.1. Se o comando acima não tiver instalado as dependencias, rode em seu terminal os seguintes comandos
```
Pkg.add('Distributions')
Pkg.add('Plots')
Pkg.add('StatsBase')
```
4. No modo pacote, pressione Backspace para voltar ao REPL, e depois CTRL-D para voltar ao terminal convencional

   

## Como rodar
Pelo Terminal - Execute o script principal:
```sh
julia markov_julia.jl
```
Com IDE ou Editor de Código - Rode o código em uma IDE ou Editor de Código compatível com Julia (e.g. Visual Studio Code)
