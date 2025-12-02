extends Node

func _ready() -> void:
	var player_UI = SHM_Base.get_player_UI(get_tree())
	if not "teleport" in player_UI.mod_nodes_and_resources.keys():
		var teleport_UI = load("res://Mods/Libraries/Teleport_library/Scenes/Teleport_UI.tscn").instantiate()
		var timer := Timer.new()
		player_UI.add_child(teleport_UI)
		teleport_UI.add_child(timer)
		timer.timeout.connect(teleport_UI._on_timer_teleport_timeout)
		teleport_UI.timer_teleport = timer
		player_UI.mod_nodes_and_resources["teleport"] = teleport_UI
		teleport_UI.self_modulate = player_UI.active_color
	queue_free()
