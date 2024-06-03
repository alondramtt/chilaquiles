extends CanvasLayer

signal start_game_btn

var score = 0 
var highscore = 0
var is_playing = false

func update_score_label():
	score = score + 10
	$ScoreLabel.text = "Score: %d"%(score) 

func update_high_score():
	if score > highscore:
		highscore = score
		$HighScoreLabel.text = "High Score: %d"%(highscore)
	is_playing = false
	$ScoreTimer.stop()
	$Button.visible = true

func _on_button_pressed():
	score = 0
	start_game_btn.emit()
	is_playing = true
	$ScoreTimer.start()
	$Button.visible = false


func _on_score_timer_timeout():
	update_score_label()
