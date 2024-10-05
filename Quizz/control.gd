extends Control

var questions = []
var options = []
var current_question_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	load_questions()
	show_question()

# Manually load questions from the JSON file
func load_questions():
	var file_path = "res://questions.json"
	var json_as_text = FileAccess.get_file_as_string(file_path)
	var json_result = JSON.parse_string(json_as_text) # Parsing the JSON
	
	# Assume json_result is a valid array after parsing
	for i in range(json_result.size()):
		questions.append(json_result[i].get("question", "Unknown"))

	for i in range(json_result.size()):
		options.append(json_result[i].get("options" , "Unknown"))
	
	print(options[1])

# Display the current question and options
func show_question():
	$QuestionLabel.text = questions[current_question_index]
	$VBoxContainer/OptionA.text = options[current_question_index][0]
	$VBoxContainer/OptionB.text = options[current_question_index][1]
	$VBoxContainer/OptionC.text = options[current_question_index][2]
	$VBoxContainer/OptionD.text = options[current_question_index][3]

func next_question():
	current_question_index +=1

func _on_next_question_button_pressed():
	if current_question_index >= 1:
		$QuestionLabel.text = "Hooray"
		$VBoxContainer/OptionA.queue_free()
		$VBoxContainer/OptionB.queue_free()
		$VBoxContainer/OptionC.queue_free()
		$VBoxContainer/OptionD.queue_free()
		$VBoxContainer/NextQuestionButton.queue_free()
	else:
		next_question()
		$QuestionLabel.text = questions[current_question_index]
		$VBoxContainer/OptionA.text = options[current_question_index][0]
		$VBoxContainer/OptionB.text = options[current_question_index][1]
		$VBoxContainer/OptionC.text = options[current_question_index][2]
		$VBoxContainer/OptionD.text = options[current_question_index][3] 
