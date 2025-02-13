class_name SHM_Base
extends RefCounted

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_player(tree:SceneTree) -> CharacterBody2D:
	var player := tree.get_nodes_in_group("Player")
	if player.size() == 1:
		return player.back()
	push_error("No player was found")
	return null

## (Only important) Level variables (Node2D) (Custom levels have different variables) [br]
## level_name : String          [br]
## boss_name : String           [br]
## cur_checkpoint : int         [br]
## level_path : String          [br]
## level_music : AudioStream    [br]
## boss_music : AudioStream     [br]
## sliding : bool = false       [br][br]
## (Only important) Functions:  [br]
## _restart_a_level() -> void   [br]
## _end_level() -> void         
static func get_level(tree:SceneTree) -> Node2D:
	var level := tree.get_nodes_in_group("Levels")
	if level.size() > 0:
		return level.back()
	push_error("No level was found")
	return null

static func get_all_doors(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Doors")

static func change_door_textures(door:Node2D,door_top_and_bottom_texture:Texture2D,door_center_texture:Texture2D) -> void:
	if is_instance_valid(door):
		door.get_node("Door_up/Sprite").texture = door_top_and_bottom_texture
		door.get_node("Door_down/Sprite").texture = door_top_and_bottom_texture
		door.get_node("Door_up/Door_center").texture = door_center_texture
		return
	push_error("Door instance isn't valid")
