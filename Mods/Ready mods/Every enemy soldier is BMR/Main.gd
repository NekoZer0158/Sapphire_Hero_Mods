extends Node

func _ready() -> void:
	var soldiers : Array
	var tree := get_tree()
	soldiers.append_array(SHM_SHR_Enemies.get_all_GMR_27_soldiers_bodies(tree))
	soldiers.append_array(SHM_SHR_Enemies.get_all_GMR_28_soldiers_bodies(tree))
	soldiers.append_array(SHM_SHR_Enemies.get_all_GMR_29_soldiers_bodies(tree))
	for i in soldiers:
		SHM_Enemies.change_soldier_textures(i,"res://Mods/Ready mods/Every enemy soldier is BMR/BMR/")
		i.hp = 2
		i.speed = 190
		i.reload_time = 1.4
	queue_free()
