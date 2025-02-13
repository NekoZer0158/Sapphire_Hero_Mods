class_name SHM_Enemies
extends RefCounted

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_enemy_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Enemy_soldier")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_moving_enemies_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Moving_enemy_body")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_flying_enemies_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Flying_enemy_body")

## For variables look up "StaticBody2D.txt" in folder "Text files"
static func get_all_turrets_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Turret_body")

## For variables look up "StaticBody2D.txt" in folder "Text files"
static func get_all_default_turrets_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Default_turret")

static func get_all_unique_enemy_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Unique_enemies")

static func change_turret_texture(turret:StaticBody2D,new_texture:Texture2D) -> void:
	if is_instance_valid(turret):
		turret.get_node("Sprite").texture = new_texture
		return
	push_error("turret isn't valid")

static func change_soldier_textures(enemy:CharacterBody2D,folder_path_with_textures:String) -> void:
	var textures := DirAccess.get_files_at(folder_path_with_textures)
	if textures.size() != 0:
		if "Body.png.import" in textures:
			enemy.get_node("Body").texture = load(folder_path_with_textures+"/Body.png")
		if "Head.png.import" in textures:
			enemy.get_node("Body/Head").texture = load(folder_path_with_textures+"/Head.png")
		if "Arm.png.import" in textures:
			enemy.get_node("Body/Arm_left").texture = load(folder_path_with_textures+"/Arm.png")
			enemy.get_node("Body/Arm_right").texture = load(folder_path_with_textures+"/Arm.png")
		if "Hand.png.import" in textures:
			enemy.get_node("Body/Arm_right/Hand").texture = load(folder_path_with_textures+"/Hand.png")
		if "Hand_shoot.png.import" in textures:
			enemy.get_node("Body/Arm_left/Hand_shoot").texture = load(folder_path_with_textures+"/Hand_shoot.png")
		if "Leg_up.png.import" in textures:
			enemy.get_node("Body/Leg_left").texture = load(folder_path_with_textures+"/Leg_up.png")
			enemy.get_node("Body/Leg_right").texture = load(folder_path_with_textures+"/Leg_up.png")
		elif "Leg_top.png.import" in textures:
			enemy.get_node("Body/Leg_left").texture = load(folder_path_with_textures+"/Leg_top.png")
			enemy.get_node("Body/Leg_right").texture = load(folder_path_with_textures+"/Leg_top.png")
		if "Leg_down.png.import" in textures:
			enemy.get_node("Body/Leg_left/Leg_down").texture = load(folder_path_with_textures+"/Leg_down.png")
			enemy.get_node("Body/Leg_right/Leg_down").texture = load(folder_path_with_textures+"/Leg_down.png")
		elif "Leg_bottom.png.import" in textures:
			enemy.get_node("Body/Leg_left/Leg_down").texture = load(folder_path_with_textures+"/Leg_bottom.png")
			enemy.get_node("Body/Leg_right/Leg_down").texture = load(folder_path_with_textures+"/Leg_bottom.png")
		return
	push_error("No textures")
