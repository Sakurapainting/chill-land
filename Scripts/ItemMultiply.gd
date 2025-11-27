extends "res://Scripts/Item.gd"

func _ready():
	# 调用父类的_ready方法
	super._ready()

func apply_effect(player):
	if player:
		player.bullet_count *= 3
		print("Multiplied bullet count by 3. New count: ", player.bullet_count)
