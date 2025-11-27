extends Area2D

var speed = 200

func _ready():
	# 确保碰撞检测正常工作
	monitoring = true
	monitorable = true
	collision_layer = 1
	collision_mask = 1
	
	# 连接碰撞信号
	body_entered.connect(_on_body_entered)

func _process(delta):
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _on_body_entered(body):
	if body and body.is_in_group("player"):
		apply_effect(body)
		var parent = get_parent()
		if parent:
			parent.increase_score(10)
		queue_free()

func apply_effect(_player):
	# 这个方法将被子类重写
	if not _player:
		return
	pass
