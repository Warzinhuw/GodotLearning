@tool extends Attribute

@export var movement_speed: int:
	set(newValue):
		self.setCurrentValue(newValue)
	get:
		return self.currentValue
		
@export var max_movement_speed: int:
	set(newValue):
		self.setMaxValue(newValue)
	get:
		return self.maxValue

func _ready():
	self.Name = CREATURE_ATTRIBUTES.MOVEMENT_SPEED

