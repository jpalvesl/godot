extends StaticBody2D

var flip = false
var pos_inicial
var pos_final
const VELOCIDADE = 0.3

func _ready():
	$AnimatedSprite.play("default")
	pos_inicial = $".".position.x
	pos_final = pos_inicial + 100

func _physics_process(delta):
	if pos_inicial <= pos_final and !flip:
		$".".position.x += VELOCIDADE
		$AnimatedSprite.flip_h = true
		if $".".position.x >= pos_final:
			flip = true
			
	elif $".".position.x >= pos_inicial and flip:
		$".".position.x -= VELOCIDADE
		$AnimatedSprite.flip_h = false
		if $".".position.x <= pos_inicial:
			flip = false
			
func dano():
	get_node("anime").play("die")
	
func die():
	$".".queue_free()