class_name SHM_boss_activation_zone
extends Area2D

var boss : Node2D

func _on_body_entered(body: Node2D) -> void:
	if "type" in body:
		if body.type == 0:
			boss.activate_boss()
			queue_free()
