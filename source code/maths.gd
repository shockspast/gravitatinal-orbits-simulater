extends Node

const G = 6.67430



func calculate_gravity_force(pos1: Vector3, mass1: float, pos2: Vector3, mass2: float) -> Vector3:
	var direction = pos2 - pos1
	var distance_squared = direction.length_squared()
	
   
	var softening = 10.0 
	
	var force_magnitude = G * (mass1 * mass2) / (distance_squared + softening)
	return direction.normalized() * force_magnitude
