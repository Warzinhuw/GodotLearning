@tool extends Sprite2D

func _ready():
	update_scale()

func _process(delta):
	update_scale()

func update_scale():
	var parent = get_parent()
	if! parent is BoxContainer:
		return
		
	var parent_size = get_parent().get_size()
	var sprite_size = texture.get_size()
	
	var scale_x = parent_size.x / sprite_size.x
	var scale_y = parent_size.y / sprite_size.y
	
	scale = Vector2(scale_x, scale_y)
