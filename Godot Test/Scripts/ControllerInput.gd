extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var deadZone = 0.1

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Input.connect("joy_connection_changed",self,"joy_con_changed")
	
func joy_con_changed(deviceid, isConnected):
	if isConnected:
		print("Joystick " + str(deviceid) + " Connected")
		if Input.is_joy_known(0):
			print("Recognized controller")
			print(Input.get_joy_name(0) + " device found")
	else:
		print("Controller disconnected")

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if Input.get_connected_joypads().size() > 0:
		#Checks if at least one controller is connected.
		var xAxis = Input.get_joy_axis(0,JOY_AXIS_0)
		if abs(xAxis) > deadZone:
			if xAxis < 0:
				get_node("Controller Face/Body/Stick L").rotation.z = xAxis * 23
				get_node("Controller Top/Body/Stick L").rotation.z = xAxis * 23

