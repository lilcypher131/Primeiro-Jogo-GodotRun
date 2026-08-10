extends Node2D

var score := 0.0
@onready var label: Label = $CanvasLayer/Label
@onready var game_over_layer: CanvasLayer = $GameOverLayer

#funcao que trabalha coisas relacionadas a logica do jogo
func _process(delta): 
	score += delta * 5
	label.text = "Score: " + str(int(score))

func _physics_process(delta):
	if GamaManager.obj_speed < GamaManager.max_obj_speed:
		GamaManager.obj_speed += GamaManager.obj_acceleration * delta
		
	if GamaManager.world_speed < GamaManager.max_world_speed:
		GamaManager.world_speed += GamaManager.world_acceleration * delta

func on_player_died():
	game_over_layer.show_game_over(int(score), int(GamaManager.high_score))
