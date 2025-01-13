extends CharacterBody2D

const Gravity=1000
const Max_vel=600
const flap_spd=-400
var flying=false
var falling=false
const Start_pos=Vector2(100,400)
 
func _ready() -> void:
	reset()
	
func reset():
	position=Start_pos
	set_rotation(0)
	falling=false
	flying=false
func _physics_process(delta: float) -> void:
	if flying or falling :
		velocity.y+= Gravity* delta
		if velocity.y>Max_vel:
			velocity.y=Max_vel
		if flying:
			set_rotation(deg_to_rad(velocity.y*0.05))
			$AnimatedSprite2D.play()
		elif falling:
			set_rotation(PI/2) 
			$AnimatedSprite2D.stop()
		move_and_collide(velocity*delta)
	
	else:
		$AnimatedSprite2D.stop()
	
func flap():
	velocity.y=flap_spd 
		
		
		
		
		
	
