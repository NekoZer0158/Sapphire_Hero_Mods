class_name Level_settings
extends Node2D

@export var level_name : String
@export var cur_checkpoint : int = 0
@export var upgraded_player : bool = false
@export var hp_refills : int = 0
@export var sliding : bool = false
@export var level_music : AudioStream
@export var level_path : String
@export var end_level_transition_time : float = 4.5

var global_sapphire : Node
var level_loader : Node

# Don't touch this, the only point of those variables is to not break scripts, that change level variables
var boss_name : String
var boss_music : AudioStream

const MODS : int = 8

func _restart_a_level() -> void:
	for i in get_tree().get_nodes_in_group("Projectile"):
		i.queue_free()
	level_loader.cur_checkpoint = global_sapphire.cur_checkpoint
	level_loader.load_level(level_path)

func _back_to_menu() -> void:
	global_sapphire.stop_music()
	global_sapphire.remove_music()
	var main_menu = load("res://Scenes/UI/Main_menu.tscn").instantiate()
	for i in get_tree().get_nodes_in_group("Projectile"):
		i.queue_free()
	get_parent().add_child(main_menu)
	level_loader.enable_transition_for_a_main_menu()
	main_menu.cur_main_menu_option = MODS
	main_menu.set_color_for_cur_option(MODS)
	main_menu.activate_option(MODS)
	main_menu.mods_menu.tab_container.current_tab = clamp(main_menu.mods_menu.tab_container.current_tab+1,0,1)
	main_menu.mods_menu.reset_current_mod_index()
	queue_free()

func _end_level() -> void:
	if is_instance_valid(global_sapphire.player):
		if is_instance_valid(global_sapphire.player.player_body):
			global_sapphire.player.player_body.immortal = true
	await global_sapphire.player.use_teleport_transition(1,end_level_transition_time)
	global_sapphire.remove_music()
	_back_to_menu()
