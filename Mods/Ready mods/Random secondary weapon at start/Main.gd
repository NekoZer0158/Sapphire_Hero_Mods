extends Node

func _ready() -> void:
	var random_weapon_index : int = [30,31,35,36,205].pick_random()
	SHM_SH2R.give_player_a_secondary_weapon(get_tree(),random_weapon_index)
	queue_free()
