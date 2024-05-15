extends CharacterBody2D
const Helpers = preload("res://scripts/Helpers.gd")

signal enemy

var health = 100
var playerInAttackZone = false

var speed = 50
var chasingPlayer = false
var player = null
var mainCardinalDirection = "south"
var creatureStateManager: CreatureStateManager
@onready var sprite = $AnimatedSprite2D


func _ready():
	creatureStateManager = get_parent()
	creatureStateManager.setSprite(sprite)
	sprite.play("idle_south")

func _physics_process(delta):
	if chasingPlayer:
		var direction = (player.global_position  - global_position).normalized()
		velocity = direction * speed
		if velocity.x != 0 or velocity.y != 0:
			var rotationData = Helpers.getSpriteRotationData(direction)
			mainCardinalDirection = rotationData.mainCardinalDirection
			creatureStateManager.setState(creatureStateManager.Action.WALKING, mainCardinalDirection)
			sprite.flip_h = rotationData.flip
			sprite.rotation_degrees = rotationData.rotateByDegrees
			move_and_slide()
	else:
		creatureStateManager.setState(creatureStateManager.Action.IDLE, mainCardinalDirection)


# When player enter in enemies vision, target it
func _on_detection_area_body_entered(body):
	player = body
	chasingPlayer = true
	print("enemy detected!")


func _on_detection_area_body_exited(body):
	player = null
	chasingPlayer = false


func _on_hitbox_body_entered(body):
	if body.has_signal("player"):
		playerInAttackZone = true


func _on_hitbox_body_exited(body):
	if body.has_signal("player"):
		playerInAttackZone = false

func dealWithDamage():
	if playerInAttackZone and Player.playerCurrentAttacking:
		health -= 20
		print("slime health: ", health)
		if health <= 0:
			self.queue_free()
