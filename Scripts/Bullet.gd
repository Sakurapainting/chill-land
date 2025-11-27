extends Area2D

@export var speed = 1000

func _ready():
	# Add bullet to player_bullet group for collision detection
	add_to_group("player_bullet")

func _process(delta):
	position.y -= speed * delta
	
	# Deletes the bullet when it goes off screen
	if position.y < -50:
		queue_free()
