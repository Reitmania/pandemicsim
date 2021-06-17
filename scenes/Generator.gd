extends Spatial

var Base := preload("res://scenes/Agent.tscn")
var totalPeople : int = 800
var sickPeople : int = 10

func _ready():	
	var node = get_tree().get_root().get_node("UI/NLabelN")
			
	for _i in range(0, sickPeople):	
		var sick_person := Base.instance()
		sick_person.get_child(0).infected()	
		#sick_person.get_child(2).change_state(1)
		var rand_x_sick : float = rand_range(-49,49)
		var rand_y_sick : float = rand_range(-49,49)
		sick_person.translate(Vector3(rand_x_sick,0,rand_y_sick))
		self.add_child(sick_person)
	
	for _i in range(0, totalPeople): 
		var normal_person := Base.instance()
		normal_person.get_child(0).change_state(0)
		var rand_x : float = rand_range(-49,49)
		var rand_y : float = rand_range(-49,49)
		normal_person.translate(Vector3(rand_x,0,rand_y))
		self.add_child(normal_person)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
