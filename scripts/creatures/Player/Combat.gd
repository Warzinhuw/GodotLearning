extends Node2D

var target: Creature = null
var targetIndicator: ColorRect

func _ready():
	targetIndicator = ColorRect.new()
	targetIndicator.color = Color.RED
	targetIndicator.visible = false
	add_child(targetIndicator)
#print("CLICK POS: {mouse_position}, tile_position: {tile_position}".format({
			#"mouse_position": mouse_position,
			#"tile_position": tile_position
		#}))
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		var mouse_position = get_global_mouse_position()
		var tile_position = get_tile_from_global_position(mouse_position)
		var monsters = get_monsters_on_tile(tile_position)
		if monsters.size() > 0:
			print("There's a monster here: ", monsters[0])
		else:
			print("No monster on this tile.")

func get_tile_from_global_position(global_position):
	var tile_size = Vector2(32, 32) # Size of your tiles
	var tile_position = global_position / tile_size
	return tile_position.floor() # Use floor to get the lower integer values

func get_monsters_on_tile(tile_position):
	var tile_size = Vector2(32, 32) # Size of your tiles
	var tile_rect = Rect2(tile_position * tile_size, tile_size)
	var monsters = []
	for node in get_tree().get_nodes_in_group(CREATURE_CONSTANTS.MONSTERS): # Assuming your monsters are in a group named "monsters"
		if tile_rect.has_point(node.global_position):
			monsters.append(node)
	return monsters
