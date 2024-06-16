extends Control

@export var dialogPath = ""
@export var textSpeed: float = 0.05

var dialog

var phraseNum = 0
var finished = false

func _ready():
#	$Timer.wait_time = textSpeed
#	dialog = getDialog()
#	assert(dialog) #,"Dialog not found")
#	nextPhrase()
	pass

func _process(_delta):
	pass
	#$Indicator.visible = finished
	#if Input.is_action_just_pressed("next_dialogue"):
		#if finished:
			#nextPhrase()
		#else:
			#$Text.visible_characters = len($Text.text)

func getDialog() -> Array:
#	var f = File.new()
#	assert(f.file_exists(dialogPath)) #,"File path does not exist")
#
#	f.open(dialogPath, File.READ)
#	var json = f.get_as_text()
#
#	var test_json_conv = JSON.new()
#	test_json_conv.parse(json)
#	var output = test_json_conv.get_data()
#
#	if typeof(output) == TYPE_ARRAY:
#		return output
#	else:
		return []

func nextPhrase() -> void:
#	if phraseNum >= len(dialog):
#		#queue_free()
#		self.visible = false
#		return
#
#	finished = false
#
#	$Name.text = dialog[phraseNum]["Name"]
#	$Text.text = dialog[phraseNum]["Text"]
#
#	$Text.visible_characters = 0
#
#	var f = File.new()
#	var img = "NPC/" + dialog[phraseNum]["Name"] + dialog[phraseNum]["Emotion"] + ".png"
#	if f.file_exists(img):
#		$Portrait.texture = load(img)
#	else: $Portrait.texture = null
#
#	while $Text.visible_characters < len($Text.text):
#		$Text.visible_characters += 1
#
#		$Timer.start()
#		await $Timer.timeout
#
#	finished = true
#	phraseNum += 1
	return
