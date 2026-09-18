extends CharacterBody2D

@export var speed: float = 240.0
@export var jump_velocity: float = -420.0
@export var gravity: float = 1000.0

@export var max_hp: int = 10
var hp: int

# Dodge (rolada) parameters
@export var dodge_distance: float = 150.0
@export var dodge_duration: float = 0.25
@export var dodge_cooldown: float = 0.8
@export var dodge_invulnerable_time: float = 0.25

var can_dodge: bool = true
var is_dodging: bool = false
var dodge_timer: float = 0.0
var dodge_cooldown_timer: float = 0.0
var dodge_direction: int = 1

var attack_damage: int = 1

onready var attack_area = $AttackArea

func _ready():
    hp = max_hp

func _physics_process(delta):
    var input_dir = Vector2.ZERO
    if not is_dodging:
        if Input.is_action_pressed("ui_left") or Input.is_key_pressed(Key.A):
            input_dir.x -= 1
        if Input.is_action_pressed("ui_right") or Input.is_key_pressed(Key.D):
            input_dir.x += 1

        velocity.x = input_dir.x * speed

        # Jump
        if (Input.is_action_just_pressed("ui_up") or Input.is_key_pressed(Key.W)) and is_on_floor():
            velocity.y = jump_velocity

        # Attack
        if Input.is_key_pressed(Key.K) and not is_dodging:
            _attack()

        # Dodge
        if Input.is_key_pressed(Key.SHIFT) and can_dodge:
            _start_dodge(input_dir)

    else:
        # During dodge, apply dodge velocity
        dodge_timer -= delta
        var t = clamp(dodge_timer / dodge_duration, 0.0, 1.0)
        # simple linear movement
        velocity = Vector2(dodge_direction * dodge_distance / dodge_duration, 0)
        if dodge_timer <= 0:
            _end_dodge()

    # Gravity
    if not is_on_floor():
        velocity.y += gravity * delta

    move_and_slide()

    # Cooldown timer
    if not can_dodge:
        dodge_cooldown_timer -= delta
        if dodge_cooldown_timer <= 0:
            can_dodge = true

func _attack():
    # simple attack: check overlapping bodies in attack area
    var bodies = attack_area.get_overlapping_bodies()
    for b in bodies:
        if b.has_method("take_damage"):
            b.take_damage(attack_damage)

func _start_dodge(input_dir: Vector2) -> void:
    is_dodging = true
    can_dodge = false
    dodge_timer = dodge_duration
    dodge_cooldown_timer = dodge_cooldown
    dodge_direction = 1 if input_dir.x >= 0 else -1
    # if no horizontal input, dodge toward facing direction (right by default)
    if input_dir.x == 0:
        dodge_direction = 1
    # set invulnerability flag (could be used by enemies to ignore)
    set_physics_process(true)

func _end_dodge() -> void:
    is_dodging = false

func take_damage(amount: int) -> void:
    # if currently dodging and within invulnerable time, ignore
    if is_dodging:
        return
    hp -= amount
    if hp <= 0:
        queue_free()
