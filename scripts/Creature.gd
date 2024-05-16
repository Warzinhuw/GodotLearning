class_name Creature extends CreatureStateManager

var Name = ""
var movementScript: CharacterBody2D

func _ready():
	movementScript = preload("res://scripts/creatures/Player/Movement.gd").new(self)
	print("LOADED, max health: ", getAttribute(CREATURE_ATTRIBUTES.HEALTH).currentValue)
	#getAttribute(CREATURE_ATTRIBUTES.HEALTH).maxValue = 100
	#getAttribute(CREATURE_ATTRIBUTES.HEALTH).currentValue = 100
	
func _physics_process(_delta):
	movementScript.doMoving()

func getAttribute(name):
	for attribute in $Attributes.get_children():
		if attribute.Name == name:
			print("attribute {name} found".format({
				"name": name
			}))
			return attribute
	return "attribute not found"
