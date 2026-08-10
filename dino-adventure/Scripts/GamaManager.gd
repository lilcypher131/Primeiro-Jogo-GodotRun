extends Node

#Variaveis para armazenar a velocidade do mundo do jogo
var world_speed := 50.0
var max_world_speed := 400.0
var world_acceleration := 2.0

#Variaveis para armazenar a velocidade dos objetos 
var obj_speed := 70.0
var max_obj_speed := 500.0
var obj_acceleration := 2.0

var high_score = 0

#aqui ficam as variáveis globais que nunca irão mudar no jogo
#estão aqui para eu não ter que criá-las sempre, são valores permanentes que vão ficar aqui mesmo que eu desligue o jogo
#aqui ficam as variáveis como: velocidade dos objetos, velocidade do cenário, core, pontos de vida etc..
