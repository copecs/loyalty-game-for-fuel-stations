extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$despawn.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func reset_despawn():
	$despawn.wait_time=2
	$despawn.start()

signal respawn
signal increment_score
func _on_area_2d_body_entered(body):
	$".".visible=false
	$resp.start()
	reset_despawn()
	$".".position=Vector2(-1000,-1000)
	increment_score.emit()


func _on_resp_timeout():
	respawn.emit()
	reset_despawn()
func _on_despawn_timeout():
	$".".visible=false
	$".".position=Vector2(-1000,-1000)
	respawn.emit()
	reset_despawn()
