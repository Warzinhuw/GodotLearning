extends CharacterBody2D

var enemyInAttackRange = false
var enemyAttackCooldown = true
var playerAlive = true
var attackInProgress = false

@export var speed = 400
@export var rotationSpeed = 90.0
var mainCardinalDirection = "south"
@onready var sprite = $AnimatedSprite2D
var creatureStateManager: CreatureStateManager

func _ready():
	creatureStateManager = get_parent()
	creatureStateManager.setSprite(sprite)

func _physics_process(delta):
	enemyAttack()
	if health <= 0:
		playerAlive = false
		health = 0
		print("player has been killed")
	
	if !attackInProgress:
		doMoving()

func doMoving():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if velocity.x != 0 or velocity.y != 0:
		var rotationData = Helpers.getSpriteRotationData(input_direction)
		mainCardinalDirection = rotationData.mainCardinalDirection
		creatureStateManager.setState(creatureStateManager.Action.WALKING, mainCardinalDirection)
		sprite.flip_h = rotationData.flip
		sprite.rotation_degrees = rotationData.rotateByDegrees
	else:
		creatureStateManager.setState(creatureStateManager.Action.IDLE, mainCardinalDirection)
	move_and_slide()
	
func _on_hitbox_body_entered(body):
	if body.has_signal("enemy"):
		enemyInAttackRange = true


func _on_hitbox_body_exited(body):
	if body.has_signal("enemy"):
		enemyInAttackRange = false

func enemyAttack():
	if enemyInAttackRange and enemyAttackCooldown == true:
		health -= 20
		enemyAttackCooldown = false
		$BasicAttackCooldown.start()
		print("player took damage, current health: ", health)


func _on_basic_attack_cooldown_timeout():
	enemyAttackCooldown = true
