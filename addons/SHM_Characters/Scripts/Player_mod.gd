class_name SHM_Characters_player_body
extends Node2D

@export_enum("9:9","15:15") var hp : int = 15
@export var def : int = 0
@export var speed : float = 300.0
@export var jump_velocity : float = -550.0
@export var amount_of_jumps : int = 1
@export var reload_time : float
@export var markers : Array[Marker2D]
@export var body_sprite : Sprite2D
@export var death_effect_marker : Marker2D
@export_color_no_alpha var default_color : Color = Color("2766cc")
@export_group("Ammo Regeneration")
@export var ammo_regeneration : bool = false
@export var time_for_ammo_regeneration : float
@export_group("Extra")
@export var infinite_ammo : bool = false
@export var immortality_frames : bool = false
@export var mirror_sprite : bool = true
@export var can_change_color : bool = false
@export var immortal : bool = false
@export var has_death_effect : bool = true
@export var unique_death_effect_path : String
@export var can_change_weapon : bool = false
@export_group("Nodes")
@export var collision_shape_2d: CollisionShape2D
@export var player_other_nodes : Array[Node]
@export var player_body_other_nodes : Dictionary[String,Node]
@export var player_UI_other_nodes : Dictionary[String,Node]
@export_group("Other")
@export var hide_body_sprite : bool = false
@export var animation_speed_scale : float = 1.0
@export_group("UI")
@export_color_no_alpha var active_color : Color = Color("479ce6")
@export_color_no_alpha var progress_bar_HP_color : Color = Color("477bff")
@export_color_no_alpha var label_shadow_color : Color = Color("4562d6")
@export_color_no_alpha var progress_bar_bg_color : Color = Color("3baaff")
