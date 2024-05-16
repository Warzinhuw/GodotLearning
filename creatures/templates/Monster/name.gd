@tool extends Attribute

signal nameChanged(old, new)

@export var creatureName: String:
	set(newName):
		var oldName = creatureName
		creatureName = newName
		nameChanged.emit(oldName, newName)
	get:
		return creatureName

func _ready():
	self.Name = CREATURE_ATTRIBUTES.NAME

