extends Node2D


var angle=0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".rotation_degrees=angle
	angle+=1


func _on_despawn_timeout():
	$".".position=Vector2(-10000,-10000)

signal fastup
func _on_area_2d_body_entered(body):
	fastup.emit()
