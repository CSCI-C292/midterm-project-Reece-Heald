extends Control
var click = AudioStreamPlayer.new();

func _on_Button2_pressed():
	self.add_child(click);
	click.stream = load("res://FOTD Assets/Sounds/Buttons/button.wav");
	click.play(true);
	$Credits.show()


func _process(delta):
	if self.visible == true:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_Button3_pressed():
	self.add_child(click);
	click.stream = load("res://FOTD Assets/Sounds/Buttons/button.wav");
	click.play(true);
	get_tree().quit()


func _on_Button_pressed():
	self.add_child(click);
	click.stream = load("res://FOTD Assets/Sounds/Buttons/button.wav");
	click.play(true);
	GameState.start_game()
	if GameState.is_game_started:
		
		self.visible = false
