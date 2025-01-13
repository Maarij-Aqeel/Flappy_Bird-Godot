extends Node2D
@export var pipe_scene:PackedScene


var running
const scroll_spd=4
var game_over 
var scroll
var pipes :Array
var ground_height
var score
const pipe_range=200
const pipe_delay=100
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size=get_window().size
	ground_height=$Ground.get_node('Sprite2D').texture.get_height()
	new_game() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if running:
		scroll+=scroll_spd
		if scroll>=screen_size.x:
			scroll=0
		$Ground.position.x=-scroll
#Move pipes
		for pipe in pipes:
			pipe.position.x-=scroll_spd
 
func new_game():
	running=false
	game_over=false
	score=0
	scroll=0
	get_tree().call_group('pipes','queue_free')
	$Game_Over.hide( )
	$Score.text="SCORE: "+str(score)
	pipes.clear()
	generate_pipes()
	$Bird.reset()
func _input(event: InputEvent) -> void:
	if game_over:
		return
	if Input.is_action_just_pressed("Jump"):
		if running==false:
			start_game()
		elif $Bird.flying:
			$Bird.flap()
			check_top() 

func start_game():
	running=true
	#game_over=false 
	$Bird.flying=true
	$Bird.flap()
	$Piper_timer.start()

#Bird Die
func check_top():
	if $Bird.position.y<0:
		$Bird.falling=true
		stop_game() 

#Stop Game
func stop_game():
	$Bird.flying=false
	$Piper_timer.stop()
	$Game_Over.show()
	
	running=false
	game_over=true

func _on_piper_timer_timeout() -> void:
	generate_pipes()
	
func generate_pipes():
	var pipe=pipe_scene.instantiate()
	pipe.position.x=screen_size.x+pipe_delay
	pipe.position.y=(screen_size.y-ground_height)/2 +randi() %(2*pipe_range)-pipe_range
	pipe.hit.connect(bird_hit)
	pipe.scored.connect(scored)
	add_child(pipe)
	pipes.append(pipe)

func scored():
	score+=1
	$Score.text="SCORE: "+str(score)
func bird_hit():
	$Bird.falling=true
	stop_game()   


func _on_ground_hit() -> void:
	$Bird.falling=false
	stop_game() 


func _on_game_over_restart() -> void:
	new_game()
