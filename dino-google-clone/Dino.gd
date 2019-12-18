extends Area2D

var CHAO = Vector2(120, 667)
var GRAVIDADE = 4000
var velocidade = Vector2()
var JUMP_HEIGH = -1200
var modificador_gravidade = 2

func _ready():
	set_position(CHAO)
	
func _physics_process(delta):
	if Input.is_action_pressed("pular"):
		velocidade.y  += GRAVIDADE * delta
	else:
		velocidade.y  += GRAVIDADE * delta * modificador_gravidade
	
	if Input.is_action_pressed("pular") and position == CHAO:
			velocidade.y = JUMP_HEIGH
	
	position += velocidade * delta
	
	# colisao com o chao
	if get_position().y > CHAO.y:
		set_position(CHAO)