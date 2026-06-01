## N-body Simulator
### About me 
This was made as my 8th grade challange project my favorite subjects are physics and python so i combined them and created a  n - body simulator in godot. 

### About the project

<img width="1311" height="646" alt="image" src="https://github.com/user-attachments/assets/364f8cdf-0040-4d3e-83e5-ee59086f54f9" />
This project is a 3d interactive n - body simulator were you can create and custimize the phycics properties of diffrent planets, suns and sattilites. 



## Technical Details

### Physics

The simulation uses the gravitational equation to calculate orbits:
$$F = G \frac{m_1 m_2}{r^2}$$

This is the implementation of the gravity in godot

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
dev note: yes i know its misspelled i did this at the beginning and it would take to long to fix

### development 
This project uses all open source tools, it was made on arch linux with godot and blender for visuels and google fonts for text. this project is live on github pages at [this link](https://shockspast.github.io/gravitatinal-orbits-simulater)

edit: textures are from poly haven a open source website for textures.
