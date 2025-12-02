extends RichTextLabel

@export var speed_mode_1 : int = 250
@export var speed_mode_2 : int = 500
@export var speed_mode_3 : int = 750
@export var speed_mode_4 : int = 1000

var player_body
var cur_speed_mode : int = 1:
	set(value):
		cur_speed_mode = clamp(value,1,4)
		match cur_speed_mode:
			1:
				player_body.speed = speed_mode_1
				player_body.set_speed()
				label_speed.text = "[color=ORANGE]1[/color] 2 3 4"
			2:
				player_body.speed = speed_mode_2
				player_body.set_speed()
				label_speed.text = "1 [color=ORANGE]2[/color] 3 4"
			3:
				player_body.speed = speed_mode_3
				player_body.set_speed()
				label_speed.text = "1 2 [color=ORANGE]3[/color] 4"
			4:
				player_body.speed = speed_mode_4
				player_body.set_speed()
				label_speed.text = "1 2 3 [color=ORANGE]4[/color]"

@onready var label_speed: RichTextLabel = $"../Label_speed"

func _ready() -> void:
	if !InputMap.has_action("decrease_speed_mode"):
		var new_event_key := InputEventKey.new()
		# Speed change
		InputMap.add_action("decrease_speed_mode")
		InputMap.add_action("increase_speed_mode")
		new_event_key = InputEventKey.new()
		new_event_key.keycode = KEY_Y
		InputMap.action_add_event("decrease_speed_mode",new_event_key)
		new_event_key = InputEventKey.new()
		new_event_key.keycode = KEY_I
		InputMap.action_add_event("increase_speed_mode",new_event_key)
	player_body = SHM_Base.get_player(get_tree())
	cur_speed_mode = 1

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("decrease_speed_mode"):
		cur_speed_mode -= 1
	elif Input.is_action_just_pressed("increase_speed_mode"):
		cur_speed_mode += 1
