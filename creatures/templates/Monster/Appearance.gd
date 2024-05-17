extends AnimatedSprite2D

@export var creature: Creature

func _ready():
	call_deferred("calculateInitialFrameSpeed")

func calculateInitialFrameSpeed():
	updateAnimationsSpeed(creature.getAttribute(CREATURE_ATTRIBUTES.MOVEMENT_SPEED).currentValue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !creature:
		return
	if creature.rotationData and typeof(creature.rotationData) == TYPE_DICTIONARY and !creature.rotationData.is_empty():
		update_animation()

func update_animation():
	var rotationData = creature.rotationData
	var mainCardinalDirection = rotationData.mainCardinalDirection
	self.flip_h = rotationData.flip
	self.rotation_degrees = rotationData.rotateByDegrees
	var animationName = "{action}_{mainCardinalDirection}".format({
		"action": creature.currentAction,
		"mainCardinalDirection": mainCardinalDirection
	})
	self.play(animationName)

func _on_movement_speed_value_changed(old, new):
	updateAnimationsSpeed(new)

func updateAnimationsSpeed(newSpeed):
	for animation in self.sprite_frames.get_animation_names():
		var frameCount = sprite_frames.get_frame_count(animation)
		self.sprite_frames.set_animation_speed(animation, clamp(newSpeed/frameCount, ANIMATION_CONSTANTS.MIN_ANIMATION_FPS, ANIMATION_CONSTANTS.MAX_ANIMATION_FPS))
