extends Area2D

var speed = 200

func _ready():
	body_entered.connect(_on_Item_body_entered)

func _process(delta):
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _on_Item_body_entered(body):
	if body and body.is_in_group("player"):
		apply_effect(body)
		var parent = get_parent()
		if parent:
			parent.increase_score(10)
		queue_free()

func apply_effect(_player):
	# This method will be overridden by specific item scripts
	# Add null check in the base method as a safety measure
	if not _player:
		return
	pass
