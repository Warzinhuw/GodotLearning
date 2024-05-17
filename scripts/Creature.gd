class_name Creature extends CreatureStateManager

var Name = ""

var rotationData: Dictionary = {}

func getAttribute(name) -> Attribute:
	for attribute in $Attributes.get_children():
		if attribute.Name == name:
			return attribute
	return null
