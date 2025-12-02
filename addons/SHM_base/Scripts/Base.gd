class_name SHM_Base
extends RefCounted

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_player(tree:SceneTree) -> CharacterBody2D:
	var players := tree.get_nodes_in_group("Player")
	if players.size() >= 1:
		return players.back()
	push_error("No player was found")
	return null

## Player UI
## active_color : Color - color used for selected weapon
## mod_nodes_and_resources : Dictionary - add here resource or any node you add as child to player_UI
static func get_player_UI(tree:SceneTree) -> Control:
	var players := tree.get_nodes_in_group("Player")
	if players.size() >= 1:
		return players.back().get_parent().player_UI
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

## Returns a dictionary[br]
## name: game name [br]
## part: the part of the game (from 1 to 4)  [br]
## version: game version [br]
## minigame: minigame type from the game (for example,"planes" from SHR and SH2R)
static func get_game_info(tree:SceneTree) -> Dictionary:
	return tree.get_nodes_in_group("GlobalSapphire").back().get_game_info()

## Important functions:[br]
## add_projectile_to_database(projectile_scene_path:String) -> void: - use to add a projectile to a projectile database [br]
## play_music(cur_music:AudioStream) -> void - plays cur_music [br]
## continue_music() -> void - continues paused music [br]
## stop_music() -> void - stops the music  [br]
## remove_music() -> void - removes music from the level
static func get_main_singleton(tree:SceneTree) -> Node:
	return tree.get_nodes_in_group("GlobalSapphire").back()

## For variables look up "Objects.txt" in folder "Text files"
static func get_all_computers(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Computers")

## For variables look up "Objects.txt" in folder "Text files"
static func get_all_doors(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Doors")

## Body is Robot_body or Static_Robot_body
static func add_node_to_a_body(key:Variant,node:Node,body:PhysicsBody2D) -> void:
	body.add_child(node)
	body.mod_nodes_and_resources[key] = node

## Body is Robot_body or Static_Robot_body
static func add_resource_to_a_body(key:Variant,resource:Resource,body:PhysicsBody2D) -> void:
	body.mod_nodes_and_resources[key] = resource

static func change_door_textures(door:Node2D,door_top_and_bottom_texture:Texture2D,door_center_texture:Texture2D) -> void:
	if is_instance_valid(door):
		door.get_node("Door_up/Sprite").texture = door_top_and_bottom_texture
		door.get_node("Door_down/Sprite").texture = door_top_and_bottom_texture
		door.get_node("Door_up/Door_center").texture = door_center_texture
		return
	push_error("Door instance isn't valid")
