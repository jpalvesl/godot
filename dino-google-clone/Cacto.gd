extends Area2D

onready var dinossauro = get_parent().get_node("Dino.tscn")
var CHAO = Vector2(1400, 683)
var velocidade = Vector2(-500, 0)

func _ready():
	set_position(CHAO)
	
	connect("area_entered", dinossauro, "colidiu")
	pass

func _physics_process(delta):
	set_position(position + velocidade * delta)