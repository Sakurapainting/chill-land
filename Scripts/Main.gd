extends Node2D

@onready var parallax_background = $ParallaxBackground
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var bullet_count_label = $CanvasLayer/BulletCountLabel
var player = null

var item_scenes = [
	preload("res://Scenes/ItemAdd.tscn"),
	preload("res://Scenes/ItemMultiply.tscn")
]

var score = 0
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	# Generate initial background
	_generate_background()
	# Random seed is automatically initialized in Godot 4
	# Ensure player reference is valid
	player = $Player

func _process(delta):
	# Update bullet count display only if player is valid
	if player:
		bullet_count_label.text = "Bullets: " + str(player.bullet_count)
	
	# Update parallax scrolling
	parallax_background.scroll_offset.y += 100 * delta

var enemy_scene = preload("res://Scenes/Enemy.tscn")

func _on_ItemTimer_timeout():
	# Spawn Item (50% chance)
	if randi() % 2 == 0:
		var item = item_scenes[randi() % item_scenes.size()].instantiate()
		add_child(item)
		item.position = Vector2(randf_range(50, screen_size.x - 50), -50)

	# Spawn Enemy
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(randf_range(50, screen_size.x - 50), -50)

func increase_score(amount):
	score += amount
	score_label.text = "Score: " + str(score)

func _generate_background():
	# Set up background layers with more visual interest
	
	# Layer 1 (farthest, slowest scroll)
	var layer1 = $ParallaxBackground/ParallaxLayer1
	layer1.motion_scale = Vector2(1, 0.2)
	
	# Create gradient background for layer 1
	var rect1 = ColorRect.new()
	rect1.size = Vector2(screen_size.x, screen_size.y * 3)
	rect1.color = Color(0.1, 0.1, 0.2, 1)
	layer1.add_child(rect1)
	
	# Add stars or distant objects to layer 1
	_add_stars(layer1, 50, 1)
	
	# Layer 2 (middle distance)
	var layer2 = $ParallaxBackground/ParallaxLayer2
	layer2.motion_scale = Vector2(1, 0.5)
	
	# Create gradient background for layer 2
	var rect2 = ColorRect.new()
	rect2.size = Vector2(screen_size.x, screen_size.y * 3)
	rect2.color = Color(0.2, 0.2, 0.3, 0.8)
	layer2.add_child(rect2)
	
	# Add clouds or midground objects to layer 2
	_add_clouds(layer2, 20)
	
	# Layer 3 (closest, fastest scroll)
	var layer3 = $ParallaxBackground/ParallaxLayer3
	layer3.motion_scale = Vector2(1, 0.8)
	
	# Create gradient background for layer 3
	var rect3 = ColorRect.new()
	rect3.size = Vector2(screen_size.x, screen_size.y * 3)
	rect3.color = Color(0.3, 0.3, 0.4, 0.6)
	layer3.add_child(rect3)
	
	# Add foreground elements to layer 3
	_add_foreground_elements(layer3, 15)

func _add_stars(layer, count, size):
	for i in range(count):
		var star = ColorRect.new()
		star.size = Vector2(size, size)
		star.color = Color(1, 1, 1, randf_range(0.3, 1.0))
		star.position = Vector2(
			randf_range(0, screen_size.x),
			randf_range(0, screen_size.y * 3)
		)
		layer.add_child(star)

func _add_clouds(layer, count):
	for i in range(count):
		var cloud = ColorRect.new()
		var cloud_size = Vector2(randf_range(30, 80), randf_range(15, 40))
		cloud.size = cloud_size
		cloud.color = Color(0.7, 0.7, 0.8, randf_range(0.3, 0.6))
		cloud.position = Vector2(
			randf_range(0, screen_size.x - cloud_size.x),
			randf_range(0, screen_size.y * 3 - cloud_size.y)
		)
		layer.add_child(cloud)

func _add_foreground_elements(layer, count):
	for i in range(count):
		var element = ColorRect.new()
		var element_size = Vector2(randf_range(20, 60), randf_range(20, 60))
		element.size = element_size
		element.color = Color(0.4, 0.4, 0.5, randf_range(0.5, 0.8))
		element.position = Vector2(
			randf_range(0, screen_size.x - element_size.x),
			randf_range(0, screen_size.y * 3 - element_size.y)
		)
		layer.add_child(element)

func _add_decorations(layer, count, color):
	for i in range(count):
		var decoration = ColorRect.new()
		var size = randf_range(10, 30)
		decoration.size = Vector2(size, size)
		decoration.color = color
		decoration.position = Vector2(
			randf_range(0, screen_size.x - size),
			randf_range(0, screen_size.y * 3 - size)
		)
		layer.add_child(decoration)
