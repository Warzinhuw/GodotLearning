extends Node

class_name Creature

var creatureId = -1
@export var creatureName: String = ""
@export var maxHealth: int = 100
@export var currentHealth: int = maxHealth
@export var movementSpeed: float = 50
@export var attackSpeed: int = 1
@export var attackRange: int = 1
@export var chaseTarget: bool = false
