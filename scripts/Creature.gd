class_name Creature extends CreatureStateManager

signal conditionChanged(creautre: Creature, condition: CreatureCondition)

@onready var conditionsPanel: HBoxContainer = $Conditions/ConditionsPanel/ConditionsHBox
var activeConditions: Dictionary = {}

var Name = ""

var rotationData: Dictionary = {}

func getAttribute(name) -> Attribute:
	for attribute in $Attributes.get_children():
		if attribute.Name == name:
			return attribute
	return null
	
func getCurrentAttributeValue(attribute):
	return getAttribute(attribute).currentValue

func setCurrentAttributeValue(attribute, value):
	getAttribute(attribute).setCurrentValue(value)

func addCondition(condition: CreatureCondition) -> bool:
	if !condition.conditionName in CREATURE_CONDITIONS.LIST:
		print("CONDITION ", condition.conditionName, " NOT FOUND")
		return false
	activeConditions[condition.conditionName] = condition
	conditionChanged.emit(self, condition)
	return true

func removeCondition(conditionName):
	if conditionName in activeConditions:
		conditionChanged.emit(self, activeConditions[conditionName])
		activeConditions.erase(conditionName)

func addConditionToPanel(condition: CreatureCondition):
	pass #add to panel

func isSlowed():
	return CREATURE_CONDITIONS.LIST.SLOW in activeConditions
