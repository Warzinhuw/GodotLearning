@tool extends Attribute

@export var health: int:
	set(newValue):
		self.setCurrentValue(newValue)
	get:
		return self.currentValue
		
@export var max_health: int:
	set(newValue):
		self.setMaxValue(newValue)
	get:
		return self.maxValue

func _ready():
	self.Name = CREATURE_ATTRIBUTES.HEALTH
