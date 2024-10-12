extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print($marker.position.x )


var rotation_speed = 1.0  # Adjust the rotation speed as needed

var radius = 385  # Adjust the radius of the circle as needed
var speed = 1.5  # Adjust the speed of rotation as needed
var angle = 0.0
var dir = 1
func _process(delta):
	# Update the angle based on time and speed
	if(Input.is_action_just_pressed("click")):
		dir*=-1
		$auto.scale.x*=-1
		$auto.scale.y*=-1
	angle += dir * speed * delta

	# Calculate the new x and y coordinates using trigonometry
	var x = radius * cos(angle)
	var y = radius * sin(angle)

	# Set the object's position
	$auto.position = Vector2(x, y)
	$auto.look_at($"..".position)
