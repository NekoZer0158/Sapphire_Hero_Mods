extends Node

const ENEMY_HP_BAR = preload("res://Mods/Ready mods/Enemy HP bar/Scenes/Enemy_HP_bar.tscn")

func _ready() -> void:
	var tree := get_tree()
	var soldiers := SHM_Enemies.get_all_enemy_soldiers_bodies(tree)
	var turrets := SHM_Enemies.get_all_turrets_bodies(tree)
	var flying_enemies := SHM_Enemies.get_all_flying_enemies_bodies(tree)
	var unique_enemies := SHM_Enemies.get_all_unique_enemy_bodies(tree)
	for i in soldiers:
		set_enemy_hp_bar(i,-50)
	for i in turrets:
		set_enemy_hp_bar(i,-40)
	for i in flying_enemies:
		set_enemy_hp_bar(i,-28)
	for i in unique_enemies:
		set_enemy_hp_bar(i,-30)
	queue_free()

func set_enemy_hp_bar(enemy:Node2D,position_y:int) -> void:
	var new_enemy_hp_bar := ENEMY_HP_BAR.instantiate()
	enemy.add_child(new_enemy_hp_bar)
	new_enemy_hp_bar.progress_bar.position.y = position_y
	enemy.got_hit.connect(new_enemy_hp_bar._update_progress_bar)
