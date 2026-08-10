extends Node2D

#vai gerenciar o spawn dos inimigos

#carregamento antecipado, (preload) das cenas
const ENEMY_GROUND = preload("uid://bdijx2ftavvb3")
const ENEMY_FLY = preload("uid://0fe5bfus2bv4")
const ITEM_COFFEE = preload("uid://dtqlqcsi4e54o")
const OBSTACLE_THORN = preload("uid://blklfkcusvrpx")

#constantes da posição Y
const GROUND_Y = 140
const FLYING_MIN_Y = 50
const FLYING_MAX_Y = 120
const COFFEE_Y = 140

func spawn_object():
	#sorteia um numero entre 0 e 99
	var random_number = randi() % 100
	var packed : PackedScene
	
	#escolhe o tipo de objeto baseado na chance
	if random_number < 6:
		packed = ITEM_COFFEE
	elif random_number < 36:
		packed = ENEMY_FLY
	elif random_number < 86:
		packed = ENEMY_GROUND
	else:
		packed = OBSTACLE_THORN
		
	#cria uma instancia da cena escolhida
	var inst = packed.instantiate()
	
	#define posição inicial da cena instanciada (fora da tela à direita)
	inst.position.x = get_viewport_rect().size.x + 20
	
	#define posição Y com base no tipo de objeto 
	if packed == ENEMY_FLY:
		inst.position.y = randf_range(FLYING_MIN_Y,FLYING_MAX_Y) #posição aleatoria entre o minimo e o máximo
	elif packed == ENEMY_GROUND:
		inst.position.y = GROUND_Y
	elif packed == OBSTACLE_THORN:
		inst.position.y = GROUND_Y
	else:
		inst.position.y = COFFEE_Y
		
	#adiciona objeto criado (inst) à cena main
	get_parent().add_child(inst)

func _on_spawn_timer_timeout():
	spawn_object()
