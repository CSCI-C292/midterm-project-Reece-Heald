extends Control

onready var menu = get_node("/root/Main/UserInterface/MainMenu")

func _ready():
	get_tree().paused = true

func _process(delta):
	
	$Cash.text = "Money :" + str(GameState.money)
	
	if Input.is_action_just_pressed("shop"):
		GameState.start_game_shop()
		if GameState.is_game_shop:
			
			self.visible = !self.visible

	if self.visible == true or menu.visible == true:
		get_tree().paused = true
	else:
		get_tree().paused = false
