extends RigidBody

var impulse = .25

var red = Color(255, 0, 0)
var green = Color(0, 255, 0)
var blue = Color(0,0,255)
var black = Color(0,0,0)

const NORMAL : int = 0
const SICK   : int = 1 
const CURED  : int = 2 
const DEAD   : int = 3

var state = NORMAL 

func _ready() -> void:
	pass
	
func infected() -> void:
	change_state(SICK)
	$CureTimer.autostart = 1
	$CureTimer.start()
	$DeathTimer.start()
	
func change_state(state_num : int) -> void:
	state = state_num
	if state_num == 0:
		#$Body.mesh.surface_get_material(0).albedo_color = green
		var newMaterial = SpatialMaterial.new()
		newMaterial.albedo_color = green
		$Body.material_override = newMaterial
	if state_num == 1:
		#$Body.mesh.surface_get_material(0).albedo_color = red
		var newMaterial = SpatialMaterial.new()
		newMaterial.albedo_color = red
		$Body.material_override = newMaterial
	if state_num == 2:
		#$Body.mesh.surface_get_material(0).albedo_color = red
		var newMaterial = SpatialMaterial.new()
		newMaterial.albedo_color = blue
		$Body.material_override = newMaterial
	if state_num == 3:
		var newMaterial = SpatialMaterial.new()
		newMaterial.albedo_color = black
		$Body.material_override = newMaterial
		
func _process(delta) -> void:
	randomize()
	var rand_x : float = rand_range(-impulse,impulse)
	var rand_y : float = rand_range(-impulse,impulse)
	apply_impulse(Vector3(), Vector3(rand_x,0,rand_y))

func _on_RigidBody_body_entered(body) -> void:
	if body.get_name() in 'RAgent' :
		if body.state == NORMAL and self.state == SICK :
			body.infected()			
			body.state = SICK
			get_tree().call_group("UI_Commands","increase_sick")

func _on_DeathTimer_timeout() -> void:
	var random : float = randf()
	if  not state == CURED:
		if random < 0.0036:
			change_state(DEAD)
			get_tree().call_group("UI_Commands","increase_death")
			$CureTimer.stop()
			$DeathTimer.stop()

func _on_CureTimer_timeout():
	get_tree().call_group("UI_Commands","increase_cured")
	change_state(CURED) 
