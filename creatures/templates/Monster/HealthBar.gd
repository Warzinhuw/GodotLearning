@tool extends TextureProgressBar

var attributes: Attribute = null

# Called when the node enters the scene tree for the first time.
func _ready():
	attributes = get_parent().get_node("Attributes").get_node(CREATURE_ATTRIBUTES.HEALTH)
	self.max_value = attributes.maxValue
	self.value = attributes.currentValue


func _on_health_max_value_changed(old, new):
	print("max health changed")
	self.max_value = new


func _on_health_value_changed(old, new):
	print("current health changed")
	self.value = new
