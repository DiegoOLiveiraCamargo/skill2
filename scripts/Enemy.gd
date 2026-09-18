extends CharacterBody2D

@export var max_hp: int = 3
var hp: int

func _ready():
    hp = max_hp

func take_damage(amount: int) -> void:
    hp -= amount
    if hp <= 0:
        queue_free()
