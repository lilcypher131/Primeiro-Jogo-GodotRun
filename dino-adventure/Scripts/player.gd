extends CharacterBody2D

@export var gravity := 800.0
@export var jump_force := 350.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

#canvas layer como no serve para separar coisas da cena, exemplo, um placar, coisas que não se movem
#label eh para escrever coisas na tela

func _physics_process(delta): #atualizado a cada frame do jogo, parte da fisica
	#1. gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	#2. pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		
	#3. animacoes
	if not is_on_floor():
		anim.play("Jump")
	else:
		anim.play("Run")
			
		
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("dangerous"):
		#get_tree().paused = true #pega a referencia da arvore da cena e pausa ela
		var main = get_tree().get_current_scene()
		main.on_player_died()
		
	elif area.is_in_group("colectable"):
		area.queue_free()
		
		
		
		
