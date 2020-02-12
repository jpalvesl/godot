extends KinematicBody2D

const GRAVIDADE = 20
const JUMP_HEIGH = -550
const VEL = 200
const UP = Vector2(0, -1)
var lado = true
var movimento = "idle"

var motion = Vector2()
var life = 3


func _physics_process(delta):
	_andar()
	
	if lado:
		_pular_ar()
	else:
		_pular_normal()
	
	
	motion = move_and_slide(motion, UP)
	$Sprite.play(movimento)
	
func _andar():
	motion.y += GRAVIDADE
	
	if Input.is_action_just_pressed("ui_end"):
		lado = !lado
	
	if Input.is_action_pressed("ui_right"):
		motion.x = VEL
		$Sprite.flip_h = false
		movimento = "run"
	elif Input.is_action_pressed("ui_left"):
		motion.x = -VEL
		$Sprite.flip_h = true
		movimento = "run"
	else:
		motion.x = 0
		movimento = "idle"
		

func _pular_ar():
	if not is_on_floor():
		movimento = "jump"
		
	if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGH

func _pular_normal():
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGH
	else:
		movimento = "jump"
		
	

func _on_pes_body_entered(body):
	body.dano()
	motion.y = -200


func _on_dano_body_entered(body):
	life -= 1
	if life == 0:
		get_tree().change_scene("res://Menu.tscn")
