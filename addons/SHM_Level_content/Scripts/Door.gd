extends Marker2D

@export var id : int # shouldn't be 0, otherwise doesn't count as a proper id
@export var can_door_open : bool = true
@export var door_top_and_bottom_texture : Texture2D
@export var door_center_texture : Texture2D
