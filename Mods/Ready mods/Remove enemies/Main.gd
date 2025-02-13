extends Node

func _ready() -> void:
	var tree := get_tree()
	var most_enemies : Array
	var level := SHM_Base.get_level(tree)
	if level.level_name != "Level_Unknown":
		level.level_music = null
	most_enemies.append_array(SHM_Enemies.get_all_unique_enemy_bodies(tree))
	most_enemies.append_array(SHM_Enemies.get_all_turrets_bodies(tree))
	most_enemies.append_array(SHM_Enemies.get_all_flying_enemies_bodies(tree))
	most_enemies.append_array(SHM_Enemies.get_all_moving_enemies_bodies(tree))
	for i in most_enemies:
		i.queue_free()
	queue_free()
