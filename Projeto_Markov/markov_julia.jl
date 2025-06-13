using Distributions, Plots, StatsBase # Apenas necessário para PLOTAR, remover se não for querer ver os Plots

# Projeto: Orfeu no Submundo - O Resgate de Eurídice
# Descrição: Simulação de uma jornada de Orfeu pelo submundo grego, onde ele deve explorar salas e coletar poder místico para resgatar Eurídice, as salas são representadas por um modelo de Markov.
# Autores - Lucas Santiago e Felipe Silva.

salas = [
    "Tesouro de Hades",
    "Lagos de Lete",
    "Salão dos Juízes",
    "Campos Elísios",  
    "Tártaro"    
]

matriz_transicao = [
    0.1 0.3 0.2 0.3 0.1;
    0.2 0.1 0.2 0.1 0.4;
    0.3 0.2 0.1 0.3 0.1;
    0.2 0.3 0.3 0.1 0.1;
    0.1 0.4 0.1 0.2 0.2
]

pilha_poder_mistico = Int[]
historico_poder = Int[]

function atualizar_poder!(sala, pilha)
    if sala == "Tesouro de Hades"
        push!(pilha, 30)
    elseif sala == "Salão dos Juízes"
        push!(pilha, 15)
    elseif sala == "Campos Elísios"
        push!(pilha, 10)
    elseif sala == "Tártaro"
        push!(pilha, 30)
    elseif sala == "Lagos de Lete"
        if !isempty(pilha)
            pop!(pilha)
        end
    end
end

# Gera um estado inicial aleatório
estado_atual = rand(1:length(salas))
caminho = [salas[estado_atual]]

println("Orfeu no Submundo - Explorando o Inferno Grego (12 salas):")
println("Sala inicial: $(salas[estado_atual])\n")

# Adiciona o poder místico da sala inicial
atualizar_poder!(salas[estado_atual], pilha_poder_mistico)
push!(historico_poder, sum(pilha_poder_mistico))

# A cada iteração, Orfeu escolhe uma sala com base nas probabilidades de transição

for sala_num in 1:12
    probs = matriz_transicao[estado_atual, :]
    println("Probabilidades de transição a partir de '$(salas[estado_atual])':")
    for (i, prob) in enumerate(probs)
        println(" - Para $(salas[i]): $(round(prob * 100, digits=1))%")
    end

    global estado_atual = rand(Categorical(probs))
    println("➜ Sala $sala_num escolhida: $(salas[estado_atual])\n")
    push!(caminho, salas[estado_atual])
    atualizar_poder!(salas[estado_atual], pilha_poder_mistico)
    push!(historico_poder, sum(pilha_poder_mistico))
end

# Display do caminho percorrido e o poder místico final

println("Caminho percorrido:")
println(join(caminho, " → "))

println("\nPoder místico final: $(sum(pilha_poder_mistico))")
println("Evolução do poder místico (a cada sala): ", historico_poder)

# Se Orfeu obteve poder místico suficiente, ele resgata Eurídice
# Se não, ele falha na missão

if sum(pilha_poder_mistico) >= 150
    println("\n🏆 Parabéns! Orfeu obteve poder místico suficiente para resgatar Eurídice do submundo!")
else
    println("\n💀 Orfeu não reuniu poder místico suficiente para vencer Hades... Eurídice permanece no submundo.")
end

# Como Julia é uma linguagem de programação científica, vamos plotar os resultados do 

# Existem dois plots aqui, um para a Jornada de Orfeu e um para a evolução do poder místico.
# Por padrão, Julia só permite um Plot por vez, então decidi comentar o segundo plot para evitar conflitos.

# contagem = countmap(caminho)
labels = collect(keys(contagem))
valores = collect(values(contagem))

bar(
    labels, valores,
    legend=false,
    xlabel="Sala",
    ylabel="Visitas",
    title="Frequência de Visitas em Cada Sala"
)

# Linha do tempo das salas
caminho_indices = [findfirst(isequal(s), salas) for s in caminho]

plot(
    0:length(caminho)-1, caminho_indices,
    seriestype = :step,
    xlabel = "Passo",
    ylabel = "Sala",
    yticks = (1:length(salas), salas),
    title = "Jornada de Orfeu pelo Submundo",
    legend = false
)

# Gráfico da evolução do poder místico
#=plot(
    0:length(historico_poder)-1, historico_poder,
    seriestype = :steppost,
    xlabel = "Passo",
    ylabel = "Poder Místico",
    title = "Evolução do Poder Místico",
    legend = false
)
 =#