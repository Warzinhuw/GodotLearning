class_name CreatureCondition extends Node2D

signal conditionApplied(condition: CreatureCondition)
signal conditionExpired(condition: CreatureCondition)

@export var conditionName = ''
@export var iconRef: Sprite2D
@export var buffIconRef: Sprite2D
@export var debuffIconRef: Sprite2D
@export var duration: Timer
@export var isActive: bool
@export var isImmune: bool = false
@export var cummulative: bool = false
@export var cummulativeFromTile: bool = false

func isConditionActive(creature: Creature, condition) -> bool:
	return condition in creature.activeConditions
