extends Area2D

signal end_level()

func _on_body_entered(body: Node2D) -> void:
	if "type" in body:
		if body.type == 0:
			end_level.emit()
