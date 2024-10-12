extends Node2D

var markers
var num=0
var score
var spawned=0
# Called when the node enters the scene tree for the first time.
func _ready():
	markers = $markeri.get_children()
	for marker in markers:
		num+=1
		print(marker.position)
	score=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$txt.text=str(score)
	if(randi()%1200 == 2):
		$stop.position = markers[randi()%num].position + $markeri.position
		print("haos")
		$stop/despawn.start() 
	if(randi()%1200 ==3):
		$gdrive.position = markers[randi()%num].position + $markeri.position
		$gdrive/despawn.start()


func _on_coin_respawn():
	$coin.visible=true
	$coin.position=markers[randi()%num].position+$markeri.position
	$coin.reset_despawn()
	print("respawn")
	spawned+=1


func _on_coin_increment_score():
	score+=1
	print(score)
	print(spawned)


func _on_stop_slow_down():
	$level.speed = 1
	$stop.position=Vector2(-10000,-10000)
	$slow.start()
	print("usporen")



func _on_slow_timeout():
	$level.speed=1.5
	


func _on_fast_timeout():
	$level.speed=1.5


func _on_gdrive_fastup():
	$level.speed=3
	$gdrive.position = Vector2(-10000,-10000)
	$fast.start()
	print("ubrzan")
