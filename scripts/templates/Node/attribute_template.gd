@tool extends Attribute

@export var attributeX: int:
	set(newValue):
		self.setCurrentValue(newValue)
	get:
		return self.currentValue
		
@export var max_attributeX: int:
	set(newValue):
		self.setMaxValue(newValue)
	get:
		return self.maxValue

func _ready():
	self.Name = CREATURE_ATTRIBUTES.ATTRIBUTEX
