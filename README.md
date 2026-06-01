## N-body Simulator
### About me 
This was made as my 8th grade challenge project. My favorite subjects are physics and Python, so I combined them and created an N-body simulator in Godot.

### About the project

<img width="1311" height="646" alt="image" src="https://github.com/user-attachments/assets/364f8cdf-0040-4d3e-83e5-ee59086f54f9" />
This project is a 3D interactive N-body simulator where you can create and customize the physics properties of different planets, suns, and satellites.



## Technical Details

### Physics

The simulation uses the gravitational equation to calculate orbits:
$$F = G \frac{m_1 m_2}{r^2}$$

This is the implementation of the gravity in Godot

```gdscript
extends Node

const G = 6.67430

func calculate_gravity_force(pos1: Vector3, mass1: float, pos2: Vector3, mass2: float) -> Vector3:
	var direction = pos2 - pos1
	var distance_squared = direction.length_squared()
	var softening = 10.0
	var force_magnitude = G * (mass1 * mass2) / (distance_squared + softening)
	return direction.normalized() * force_magnitude
```

as well as the planets script:
```gdscript
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
```
$\color{red}{\text{dev note}}$: yes I know it's misspelled. I did this at the beginning and it would take too long to fix.

$\color{red}{\text{dev note}}$: I used the CharacterBody3D node instead of a RigidBody for the planets because it gave me more control.
### development 
This project uses all open source tools. It was made on Arch Linux with Godot and Blender for visuals and Google Fonts for text. This project is live on GitHub Pages at [this link](https://shockspast.github.io/gravitatinal-orbits-simulater)

edit: textures are from Poly Haven, an open source website for textures.
