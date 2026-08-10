extends ParallaxBackground

func _physics_process(delta):
	scroll_offset.x -= GamaManager.world_speed * delta
	
	
