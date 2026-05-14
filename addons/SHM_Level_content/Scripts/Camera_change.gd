extends Area2D

@export var set_top_and_left_limit_by_pos : bool = false
@export var limit_top : int = -1
@export var limit_right : int = -1
@export var limit_bottom : int = -1
@export var limit_left : int = -1

func _on_body_entered(body: Node2D) -> void:
	if "type" in body:
		if body.type == 0:
			var player_camera : Camera2D = body.get_node("Camera2D")
			if set_top_and_left_limit_by_pos:
				player_camera.limit_top = global_position.y
				player_camera.limit_left = global_position.x
			else:
				if limit_top != -1:
					player_camera.limit_top = limit_top
				if limit_left != -1:
					player_camera.limit_left = limit_left
			if limit_right != -1:
				player_camera.limit_right = limit_right
			if limit_bottom != -1:
				player_camera.limit_bottom = limit_bottom
