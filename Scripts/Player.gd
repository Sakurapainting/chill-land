extends CharacterBody2D

@export var speed = 400
@export var shoot_delay = 0.5  # seconds between shots

var bullet_scene = preload("res://Scenes/Bullet.tscn")
var bullet_count = 1
var screen_size = Vector2.ZERO
var player_half_size = 64  # Assuming default icon size is 128x128

func _ready():
	# Get screen size
	screen_size = get_viewport_rect().size
	# Set up shoot timer
	$ShootTimer.wait_time = shoot_delay
	$ShootTimer.autostart = true
	# Add player to group
	add_to_group("player")

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()

	# Restrict movement to the bottom 1/3 of the screen
	var min_y = screen_size.y * 2 / 3
	var max_y = screen_size.y - player_half_size
	
	# Clamp position
	position.x = clamp(position.x, player_half_size, screen_size.x - player_half_size)
	position.y = clamp(position.y, min_y, max_y)

	# Racing game effect: When moving forward, screen scrolls faster
	if direction.y < -0.5:  # Player moving up (forward)
		var parallax = get_parent().get_node("ParallaxBackground")
		parallax.scroll_offset.y += 50 * delta  # Extra scroll speed when moving forward

func _unhandled_input(event):
	# Allow shooting with spacebar
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("shoot"):
		_shoot()

func _shoot():
	# Fire multiple bullets based on bullet count
	for i in range(bullet_count):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		# Calculate spread pattern
		var offset = (i - (bullet_count - 1) / 2.0) * 20
		bullet.position = position + Vector2(offset, -player_half_size/2)

func _on_ShootTimer_timeout():
	# Auto-shoot if bullets are available
	if bullet_count > 0:
		_shoot()
