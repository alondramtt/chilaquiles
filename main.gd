extends Node2D

@export var mob_scene: PackedScene

var screen_size : Vector2i
var PlayerInitialPosition


func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position

func new_game():
	$Player.position = PlayerInitialPosition
	$Piso.position.x = 0 
	$MobTimer.start() 

func game_over():
	GHUD.update_high_score()

func _process(delta):
		$Piso.position.x = $Player.position.x - 150


func _on_mob_timer_timeout():
	print('creando MOB...')
