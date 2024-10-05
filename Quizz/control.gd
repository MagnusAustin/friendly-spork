extends Control

var questions = []
var options = []
var current_question_index = 0
var correct = []

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
		
	for i in range(json_result.size()):
		correct.append(json_result[i].get("correct_index" , "Unknown"))


# Display the current question and options
func show_question():
	$QuestionLabel.text = questions[current_question_index]
	$VBoxContainer/OptionA.text = options[current_question_index][0]
	$VBoxContainer/OptionB.text = options[current_question_index][1]
	$VBoxContainer/OptionC.text = options[current_question_index][2]
	$VBoxContainer/OptionD.text = options[current_question_index][3]

func next_question():
	if current_question_index >= 9:
		out_of_bounds()
	else:
		current_question_index +=1
		$VBoxContainer/AnswerLabel.text = ''
		$QuestionLabel.text = questions[current_question_index]
		$VBoxContainer/OptionA.text = options[current_question_index][0]
		$VBoxContainer/OptionB.text = options[current_question_index][1]
		$VBoxContainer/OptionC.text = options[current_question_index][2]
		$VBoxContainer/OptionD.text = options[current_question_index][3]

func _on_next_question_button_pressed():
	if current_question_index >= 9:
		out_of_bounds()
	else:
		next_question()

func out_of_bounds():
	$VBoxContainer/AnswerLabel.queue_free()
	$QuestionLabel.text = "Hooray"
	$VBoxContainer/OptionA.queue_free()
	$VBoxContainer/OptionB.queue_free()
	$VBoxContainer/OptionC.queue_free()
	$VBoxContainer/OptionD.queue_free()
	$VBoxContainer/NextQuestionButton.queue_free()	 



func _on_option_a_pressed():
	if correct[current_question_index] == 0: 
		$VBoxContainer/AnswerLabel.text = "Correct"
		next_question()
	else:
		$VBoxContainer/AnswerLabel.text = "Incorrect"
		correct_ans() 

func _on_option_b_pressed():
	if correct[current_question_index] == 1: 
		$VBoxContainer/AnswerLabel.text = "Correct"
		next_question()
	else:
		$VBoxContainer/AnswerLabel.text = "Incorrect" # Replace with function body.
		correct_ans() 

func _on_option_c_pressed():
	if correct[current_question_index] == 2: 
		$VBoxContainer/AnswerLabel.text = "Correct"
		next_question()
	else:
		$VBoxContainer/AnswerLabel.text = "Incorrect" # Replace with function body.
		correct_ans() 

func _on_option_d_pressed():
	if correct[current_question_index] == 3: 
		$VBoxContainer/AnswerLabel.text = "Correct"
		next_question()
	else:
		$VBoxContainer/AnswerLabel.text = "Incorrect"
		correct_ans() 
		
func correct_ans():
	print(options[current_question_index][correct[current_question_index]])
