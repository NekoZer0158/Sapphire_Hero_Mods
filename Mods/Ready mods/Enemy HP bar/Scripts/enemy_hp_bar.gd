class_name Enemy_hp_bar
extends Node2D

@onready var progress_bar: ProgressBar = $ProgressBar

var parent : Node2D

func _ready() -> void:
	parent = get_parent()
	progress_bar.max_value = parent.hp
	progress_bar.value = parent.hp
	progress_bar.size.x = 8*parent.hp
	progress_bar.position.x = -progress_bar.size.x/2

func _update_progress_bar(new_hp:int) -> void:
	progress_bar.set_value_no_signal(new_hp)

func _physics_process(_delta: float) -> void:
	scale.y = parent.scale.y
	rotation_degrees = parent.rotation_degrees
