extends ProgressBar

@export var teleport_distance : int = 250
@export var timer_teleport: Timer

var player_body

func _ready() -> void:
	if !InputMap.has_action("teleport"):
		# Teleport
		InputMap.add_action("teleport")
		var new_event_key := InputEventKey.new()
		new_event_key.keycode = KEY_V
		InputMap.action_add_event("teleport",new_event_key)
	player_body = SHM_Base.get_player(get_tree())

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("teleport") and value == max_value:
		_teleport_player()

func _teleport_player() -> void:
	if is_instance_valid(player_body):
		value = 0
		timer_teleport.start()
		player_body.position.x += teleport_distance*player_body.scale.y

func _on_timer_teleport_timeout() -> void:
	value += 1
	if value == max_value:
		timer_teleport.stop()
