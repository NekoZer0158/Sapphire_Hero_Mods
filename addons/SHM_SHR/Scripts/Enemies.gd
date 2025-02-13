class_name SHM_SHR_Enemies
extends RefCounted

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_GMR_27_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("GMR-27")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_GMR_28_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("GMR-28")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_GMR_29_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("GMR-29")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_BMR_62_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("BMR-62")

## For variables look up "StaticBody2D.txt" in folder "Text files"
static func get_all_turret_three_shot_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Turret_three_shot")
