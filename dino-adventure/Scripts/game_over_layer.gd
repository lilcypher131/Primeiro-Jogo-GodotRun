extends CanvasLayer

@onready var label_score: Label = $LabelScore
@onready var label_recorde: Label = $LabelRecorde

#define a visibilidade dessa cena de game over
func _ready():
	visible = false #comeca oculta
	
#funcao que exibe tela no jogo
func show_game_over(current_score: int, high_score: int):
	#atualizar os textos
	
	set_high_score(current_score)
	
	label_score.text = "Score: " + str(current_score)
	label_recorde.text = "Score: " + str(high_score)
	visible = true
	get_tree().paused = true #pausa o jogo
	
func _unhandled_input(event):
	if visible and event.is_action_pressed("jump"):
		get_tree().paused = false #despausa o game 
		get_tree().reload_current_scene() #reseta a cena
		
func set_high_score(current_score: int):
	if GamaManager.high_score < current_score:
		GamaManager.high_score = current_score
