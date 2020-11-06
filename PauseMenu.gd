extends TextureRect



func _process(delta):
	
	if Input.is_action_just_pressed("pause"):
		GameState.start_game_pause()
		if GameState.is_game_paused:
			get_tree().paused = true
			self.visible = !self.visible
		
