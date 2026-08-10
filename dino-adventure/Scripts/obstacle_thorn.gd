extends Area2D

var offScreen_x := -50.0 #posiçao fora da tela onde o ininimigo some

func _physics_process(delta):
	#movimento do inimigo
	position.x -= GamaManager.world_speed * delta
	
	#remover inimigo ao sair da tela
	if (position.x < offScreen_x):
		queue_free()
