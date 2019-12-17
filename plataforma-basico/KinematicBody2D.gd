extends KinematicBody2D

const GRAVIDADE = 20
const JUMP_HEIGH = -550
const VEL = 200
const UP = Vector2(0, -1)

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVIDADE
	
	if Input.is_action_pressed("ui_right"):
		motion.x = VEL
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -VEL
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		motion.x = 0
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGH
	else:
		$Sprite.play("jump")
		
	motion = move_and_slide(motion, UP)
