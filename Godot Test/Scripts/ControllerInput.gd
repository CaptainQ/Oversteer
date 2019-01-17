extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

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
	print("FPS: " + str(Engine.get_frames_per_second()))

	if Input.get_connected_joypads().size() > 0:
		#Checks if at least one controller is connected.
		var xAxisL = Input.get_joy_axis(0,JOY_AXIS_0)
		get_node("Controller Face/Body/Stick L").rotation.z = -xAxisL / 2
		get_node("Controller Top/Body/Stick L").rotation.z = -xAxisL / 2
		var yAxisL = Input.get_joy_axis(0,JOY_AXIS_1)
		get_node("Controller Face/Body/Stick L").rotation.x = yAxisL / 2
		get_node("Controller Top/Body/Stick L").rotation.x = yAxisL / 2
		
		var xAxisR = Input.get_joy_axis(0,JOY_AXIS_2)
		get_node("Controller Face/Body/Stick R").rotation.z = -xAxisR / 2
		get_node("Controller Top/Body/Stick R").rotation.z = -xAxisR / 2
		var yAxisR = Input.get_joy_axis(0,JOY_AXIS_3)
		get_node("Controller Face/Body/Stick R").rotation.x = yAxisR / 2
		get_node("Controller Top/Body/Stick R").rotation.x = yAxisR / 2
		
		var triggerL = Input.get_joy_axis(0,JOY_AXIS_6)
		get_node("Controller Face/Body/Trigger L").rotation.x = -triggerL / 4
		get_node("Controller Top/Body/Trigger L").rotation.x = -triggerL / 4
		
		var triggerR = Input.get_joy_axis(0,JOY_AXIS_7)
		get_node("Controller Face/Body/Trigger R").rotation.x = -triggerR / 4
		get_node("Controller Top/Body/Trigger R").rotation.x = -triggerR / 4
		
		if Input.is_joy_button_pressed(0,JOY_L3):
			get_node("Controller Face/Body/Stick L").set_translation(Vector3(-0.846608, -.05, -0.112145))
			get_node("Controller Top/Body/Stick L").set_translation(Vector3(-0.846608, -.05, -0.112145))
		else:
			get_node("Controller Face/Body/Stick L").set_translation(Vector3(-0.846608, 0, -0.112145))
			get_node("Controller Top/Body/Stick L").set_translation(Vector3(-0.846608, 0, -0.112145))
			
		if Input.is_joy_button_pressed(0,JOY_R3):
			get_node("Controller Face/Body/Stick R").set_translation(Vector3(0.428497, -.05, 0.547077))
			get_node("Controller Top/Body/Stick R").set_translation(Vector3(0.428497, -.05, 0.547077))
		else:
			get_node("Controller Face/Body/Stick R").set_translation(Vector3(0.428497, 0, 0.547077))
			get_node("Controller Top/Body/Stick R").set_translation(Vector3(0.428497, 0, 0.547077))
		
		var dPadUp = 0
		var dPadDown = 0
		if Input.is_joy_button_pressed(0,JOY_DPAD_UP):
			dPadUp = -.25
		else:
			dPadUp = 0
		if Input.is_joy_button_pressed(0,JOY_DPAD_DOWN):
			dPadDown = .25
		else:
			dPadDown = 0
		var dPadVert = dPadUp + dPadDown
		get_node("Controller Face/Body/D Pad").rotation.x = dPadVert
		get_node("Controller Top/Body/D Pad").rotation.x = dPadVert
		
		var dPadLeft = 0
		var dPadRight = 0
		if Input.is_joy_button_pressed(0,JOY_DPAD_LEFT):
			dPadLeft = .25
		else:
			dPadLeft = 0
		if Input.is_joy_button_pressed(0,JOY_DPAD_RIGHT):
			dPadRight = -.25
		else:
			dPadRight = 0
		var dPadHoriz = dPadLeft + dPadRight
		get_node("Controller Face/Body/D Pad").rotation.z = dPadHoriz
		get_node("Controller Top/Body/D Pad").rotation.z = dPadHoriz
		
		if Input.is_joy_button_pressed(0,JOY_SELECT):
			get_node("Controller Face/Body/Menu L").set_translation(Vector3(0.015876, 0.305561 -.05, -0.120575))
			get_node("Controller Top/Body/Menu L").set_translation(Vector3(0.015876, 0.305561 -.05, -0.120575))
		else:
			get_node("Controller Face/Body/Menu L").set_translation(Vector3(0.015876, 0.305561, -0.120575))
			get_node("Controller Top/Body/Menu L").set_translation(Vector3(0.015876, 0.305561, -0.120575))
			
		if Input.is_joy_button_pressed(0,JOY_START):
			get_node("Controller Face/Body/Menu R").set_translation(Vector3(0.015876, 0.305561 -.05, -0.120575))
			get_node("Controller Top/Body/Menu R").set_translation(Vector3(0.015876, 0.305561 -.05, -0.120575))
		else:
			get_node("Controller Face/Body/Menu R").set_translation(Vector3(0.015876, 0.305561, -0.120575))
			get_node("Controller Top/Body/Menu R").set_translation(Vector3(0.015876, 0.305561, -0.120575))
			
			
		if Input.is_joy_button_pressed(0,JOY_L):
			get_node("Controller Face/Body/Shoulder L").set_translation(Vector3(0, 0, .05))
			get_node("Controller Top/Body/Shoulder L").set_translation(Vector3(0, 0, .05))
		else:
			get_node("Controller Face/Body/Shoulder L").set_translation(Vector3(0, 0, 0))
			get_node("Controller Top/Body/Shoulder L").set_translation(Vector3(0, 0, 0))
			
		if Input.is_joy_button_pressed(0,JOY_R):
			get_node("Controller Face/Body/Shoulder R").set_translation(Vector3(0, 0, .05))
			get_node("Controller Top/Body/Shoulder R").set_translation(Vector3(0, 0, .05))
		else:
			get_node("Controller Face/Body/Shoulder R").set_translation(Vector3(0, 0, 0))
			get_node("Controller Top/Body/Shoulder R").set_translation(Vector3(0, 0, 0))
			
		if Input.is_joy_button_pressed(0,JOY_XBOX_A):
			get_node("Controller Face/Body/A Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
			get_node("Controller Top/Body/A Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
		else:
			get_node("Controller Face/Body/A Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))
			get_node("Controller Top/Body/A Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))
		
		if Input.is_joy_button_pressed(0,JOY_XBOX_B):
			get_node("Controller Face/Body/B Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
			get_node("Controller Top/Body/B Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
		else:
			get_node("Controller Face/Body/B Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))
			get_node("Controller Top/Body/B Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))
		
		if Input.is_joy_button_pressed(0,JOY_XBOX_X):
			get_node("Controller Face/Body/X Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
			get_node("Controller Top/Body/X Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
		else:
			get_node("Controller Face/Body/X Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))
			get_node("Controller Top/Body/X Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))
		
		if Input.is_joy_button_pressed(0,JOY_XBOX_Y):
			get_node("Controller Face/Body/Y Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
			get_node("Controller Top/Body/Y Button").set_translation(Vector3(0.88828, 0.260491 -.05, -0.114756))
		else:
			get_node("Controller Face/Body/Y Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))
			get_node("Controller Top/Body/Y Button").set_translation(Vector3(0.88828, 0.260491, -0.114756))