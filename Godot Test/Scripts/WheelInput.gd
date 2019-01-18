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
	
var stickL = Vector2(0, 0)
var stickR = Vector2(0, 0)

var stickLOld = Vector2(0, 0)
var stickROld = Vector2(0, 0)

var stickThresh = .9
	
var changeInStickL = 0 #radian
var changeInStickR = 0 #radian

var averageChange = 0 #radian

var steeringWheelContainer = 0 #radian
var wheelAngle = 0

var maxSteeringRotation = 10 #radians
var maxWheelRotation = .7 #radians

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	#print("FPS: " + str(Engine.get_frames_per_second()))

	if Input.get_connected_joypads().size() > 0:
		#Checks if at least one controller is connected.
		
		var xAxisL = Input.get_joy_axis(0,JOY_AXIS_0)
		get_node("Controller Face/Body/Stick L").rotation.z = -xAxisL / 2
		var yAxisL = Input.get_joy_axis(0,JOY_AXIS_1)
		get_node("Controller Face/Body/Stick L").rotation.x = yAxisL / 2
		
		var xAxisR = Input.get_joy_axis(0,JOY_AXIS_2)
		get_node("Controller Face/Body/Stick R").rotation.z = -xAxisR / 2
		var yAxisR = Input.get_joy_axis(0,JOY_AXIS_3)
		get_node("Controller Face/Body/Stick R").rotation.x = yAxisR / 2
		
		stickLOld = stickL
		stickROld = stickR
		
		stickL = Vector2(xAxisL, yAxisL)
		stickR = Vector2(xAxisR, yAxisR)
		
		if abs(stickL.x) < stickThresh and abs(stickL.y) < stickThresh:
			stickL = Vector2(0, 0)
		
		if abs(stickR.x) < stickThresh and abs(stickR.y) < stickThresh:
			stickR = Vector2(0, 0)
		
		if (abs(stickLOld.x) < stickThresh and abs(stickLOld.y) < stickThresh) or (abs(stickL.x) < stickThresh and abs(stickL.y) < stickThresh):
			changeInStickL = stickL.angle_to(stickLOld)
		else:
			changeInStickL = 0
		
		if (abs(stickROld.x) < stickThresh and abs(stickROld.y) < stickThresh) or (abs(stickR.x) < stickThresh and abs(stickR.y) < stickThresh):
			changeInStickR = stickR.angle_to(stickROld)
		else:
			changeInStickR = 0
		
		averageChange = (changeInStickL + changeInStickR) / 2
		
		steeringWheelContainer += averageChange
		if abs(steeringWheelContainer) > maxSteeringRotation:
			steeringWheelContainer = maxSteeringRotation * (abs(steeringWheelContainer) / steeringWheelContainer)
		
		wheelAngle = (steeringWheelContainer / maxSteeringRotation) * maxWheelRotation
		
		get_node("WheelProxy").rotation.y = steeringWheelContainer
		get_node("TireProxyL").rotation.y = wheelAngle
		get_node("TireProxyR").rotation.y = wheelAngle
		
		get_node("../Main/CanvasLayer/Label L Stick X").set_text(" L Stick X: " + str(xAxisL))
		get_node("../Main/CanvasLayer/Label L Stick Y").set_text(" L Stick Y: " + str(yAxisL))
		get_node("../Main/CanvasLayer/Label L Stick Length").set_text(" L Stick Length: " + str(sqrt(pow(abs(xAxisL), 2) + pow(abs(yAxisL), 2))))
		get_node("../Main/CanvasLayer/Label R Stick X").set_text(" R Stick X: " + str(xAxisR))
		get_node("../Main/CanvasLayer/Label R Stick Y").set_text(" R Stick Y: " + str(yAxisR))
		get_node("../Main/CanvasLayer/Label R Stick Length").set_text(" R Stick Length: " + str(sqrt(pow(abs(xAxisR), 2) + pow(abs(yAxisR), 2))))
		
		get_node("../Main/CanvasLayer/Label L Vector X").set_text(" L Vector X: " + str(stickL.x))
		get_node("../Main/CanvasLayer/Label L Vector Y").set_text(" L Vector Y: " + str(stickL.y))
		get_node("../Main/CanvasLayer/Label R Vector X").set_text(" R Vector X: " + str(stickR.x))
		get_node("../Main/CanvasLayer/Label R Vector Y").set_text(" R Vector Y: " + str(stickR.y))