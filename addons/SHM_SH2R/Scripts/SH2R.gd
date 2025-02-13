class_name SHM_SH2R
extends RefCounted

## Doesn't work with non secondary weapon id
static func give_player_a_secondary_weapon(tree:SceneTree,weapon_id:int) -> void:
	var all_weapons_node := tree.get_nodes_in_group("All_weapons_node")
	if all_weapons_node.size() == 0:
		push_error("No node with all weapons")
	else:
		var player_group := tree.get_nodes_in_group("Player")
		var cur_weapon = all_weapons_node[0].weapons[weapon_id]
		if player_group.size() == 0:
			push_error("No player was found")
			return
		var player = player_group.back()
		var player_parent = player.get_parent()
		if (player_parent.amount_of_boss_weapons > 0 and player.shooting_module.weapons[1] != null) or (( player_parent.amount_of_boss_weapons == 0 and player.ammo.size() > 1)):
			player_parent.replace_secondary_weapon(cur_weapon)
		else:
			player_parent.add_new_weapon("",cur_weapon)
