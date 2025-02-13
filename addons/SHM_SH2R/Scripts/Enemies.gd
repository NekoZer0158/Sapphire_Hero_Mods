class_name SHM_SH2R_Enemies
extends RefCounted

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_NMR_05_enemy_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	var prologue_soldiers := tree.get_nodes_in_group("Prologue soldiers")
	var nmr_05 := tree.get_nodes_in_group("NMR-05")
	for i in prologue_soldiers:
		if i in nmr_05:
			nmr_05.erase(i)
	return nmr_05

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_NMR_07_enemy_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("NMR-07")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_snow_NMR_05_enemy_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("NMR-05 snow")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_snow_NMR_07_enemy_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("NMR-07 snow")

## For variables look up "Characters2D.txt" in folder "Text files"
static func get_all_prologue_soldiers_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Prologue soldiers")

## For variables look up "StaticBody2D.txt" in folder "Text files"
static func get_all_default_turret_minigun_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Default_turret_minigun")

## For variables look up "StaticBody2D.txt" in folder "Text files"
static func get_all_protected_turret_minigun_bodies(tree:SceneTree) -> Array[Node]:
	return tree.get_nodes_in_group("Protected_turret_minigun")
