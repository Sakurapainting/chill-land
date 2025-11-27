extends "res://Scripts/Item.gd"

func apply_effect(player):
	if player:
		player.bullet_count += 2
