extends Node2D

@export var mob_scene: PackedScene

var screen_size : Vector2i
var PlayerInitialPosition


func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position
	GHUD .start_game_btn.connect(new_game)

func new_game():
	$Player.position = PlayerInitialPosition
	$Piso.position.x = 0 
	$MobTimer.start() 

func game_over():
	GHUD.mob_counter = 0
	$MobTimer.stop()
	GHUD.update_high_score()

func _process(_delta):
		$Piso.position.x = $Player.position.x - 150


func _on_mob_timer_timeout():
	if GHUD.mob_counter < 2:
		var mob = mob_scene.instantiate()
		mob.position.x = $Player.position.x + 1500
		mob.position.y = 640
		add_child(mob)
		mob.hit.connect(game_over)
