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
extends Node

const G = 6.67430

func calculate_gravity_force(pos1: Vector3, mass1: float, pos2: Vector3, mass2: float) -> Vector3:
	var direction = pos2 - pos1
	var distance_squared = direction.length_squared()
	var softening = 10.0
	var force_magnitude = G * (mass1 * mass2) / (distance_squared + softening)
	return direction.normalized() * force_magnitude
```
dev note: yes I know it's misspelled. I did this at the beginning and it would take too long to fix.

### development 
This project uses all open source tools. It was made on Arch Linux with Godot and Blender for visuals and Google Fonts for text. This project is live on GitHub Pages at [this link](https://shocksp[...]

edit: textures are from Poly Haven, an open source website for textures.
