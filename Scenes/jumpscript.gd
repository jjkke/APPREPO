extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var jump_multiplier = -10
var velocity : Vector2
var jump = false
var sliding = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(16777232) && sliding:
		jump = true
		sliding = false
		print("keypress")
	#	self.move_and_slide(velocity * jump_multiplier)
	if self.move_and_collide(velocity):
		sliding = true
	if jump:
		print("jumptriggered")
		velocity = Vector2(0,jump_multiplier)
		sliding = false
		jump = false
	if sliding:
		print("sliding")
		velocity = Vector2(0,0)
	else:
		print("falling")
		if Input.is_key_pressed(16777232):
			velocity += Vector2(0,0.2)
		else:
			velocity += Vector2(0,0.4)
		
	self.move_and_slide(velocity)
	pass
