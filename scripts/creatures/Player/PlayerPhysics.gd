extends Player

@onready var movementScript = preload("res://scripts/creatures/Player/Movement.gd").new()
@onready var combatScript = preload("res://scripts/creatures/Player/Combat.gd").new()
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.setSprite(sprite)
	add_child(movementScript)
	add_child(combatScript)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	move_and_slide()

func setHealth(value: int):
	currentHealth = value
	healthChanged.emit(currentHealth)
