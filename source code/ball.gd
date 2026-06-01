extends CharacterBody3D

@export var Xvelosity: float = 0
@export var Yvelosity: float = 0
@export var Zvelosity: float = 0
@export var mass: float = 10


@onready var grav_velocity: Vector3 = Vector3(Xvelosity, Yvelosity, Zvelosity)

func _ready():
	add_to_group("gravity_bodies")

func _physics_process(delta):
		
	
	var total_force = Vector3.ZERO
	var bodies = get_tree().get_nodes_in_group("gravity_bodies")

	for body in bodies:
		if body == self: continue
		total_force += maths.calculate_gravity_force(global_position, mass, body.global_position, body.mass)

	var acceleration = total_force / mass
	grav_velocity += acceleration * delta 

	velocity = grav_velocity 
	move_and_slide()
