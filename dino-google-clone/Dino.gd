extends Area2D

var Cacto = load("res://Cacto.tscn")
var CHAO = Vector2(120, 667)
var GRAVIDADE = 4000
var velocidade = Vector2()
var JUMP_HEIGH = -1200
var modificador_gravidade = 2

var tempo = 0.0
var intervalo = 3

func _ready():
	set_position(CHAO)
	pass
	
func _physics_process(delta):
	tempo += delta
	
	if tempo >= intervalo:
		tempo = 0
		print(Cacto)
		get_parent().add_child(Cacto.instance())
	
	# pulo maior	
	if Input.is_action_pressed("pular"):
		velocidade.y  += GRAVIDADE * delta
	# pulo menor
	else:
		velocidade.y  += GRAVIDADE * delta * modificador_gravidade
	
	# verificando se esta no chao para poder pular
	if Input.is_action_pressed("pular") and position == CHAO:
			velocidade.y = JUMP_HEIGH
	
	position += velocidade * delta
	
	# colisao com o chao
	if get_position().y > CHAO.y:
		set_position(CHAO)
	pass
	
func colidiu(area):
	queue_free()
