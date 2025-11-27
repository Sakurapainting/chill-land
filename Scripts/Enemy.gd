extends Area2D

var speed = 150

func _ready():
	# Connect to both signals to detect collision with Areas (bullets) and Bodies (player)
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)

func _process(delta):
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

# For collisions with other Areas (like bullets)
func _on_area_entered(area):
	if area.is_in_group("player_bullet"):
		var parent = get_parent()
		if parent:
			parent.increase_score(50)
		area.queue_free() # Destroy the bullet
		queue_free() # Destroy the enemy

# For collisions with PhysicsBodies (like the player)
func _on_body_entered(body):
	if body.is_in_group("player"):
		# For now, just destroy the enemy. Later we can add player damage.
		queue_free()
