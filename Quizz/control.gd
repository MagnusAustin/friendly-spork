extends Control

var questions = []
var options = []
var correct = []
var current_question_index = 0
var score = 0

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
		options.append(json_result[i].get("options", "Unknown"))
		
	for i in range(json_result.size()):
		correct.append(json_result[i].get("correct_index", "Unknown"))

# Display the current question and options
func show_question():
	$QuestionLabel.text = questions[current_question_index]
	$OptionA.text = options[current_question_index][0]
	$OptionB.text = options[current_question_index][1]
	$OptionC.text = options[current_question_index][2]
	$OptionD.text = options[current_question_index][3]

func next_question():
	if current_question_index >= 9:
		out_of_bounds()
	else:
		current_question_index += 1
		$AnswerLabel.text = ''
		$Correct_Answer.text = ''
		show_question()

func _on_next_question_button_pressed():
	if current_question_index >= 9:
		out_of_bounds()
	else:
		next_question()

func out_of_bounds():
	$TextureRect.queue_free()
	$AnswerLabel.queue_free()
	$QuestionLabel.text = "You've Completed the Quiz"
	$Correct_Answer.queue_free()
	$OptionA.queue_free()
	$OptionB.queue_free()
	$OptionC.queue_free()
	$OptionD.queue_free()
	$NextQuestionButton.queue_free()
	$".".add_child(Label.new())
	$".".get_child($".".get_child_count() - 1).text = "Your Score: " + str(score) + "/" + str(questions.size())

func _on_option_a_pressed():
	if correct[current_question_index] == 0: 
		$AnswerLabel.text = "Correct"
		score += 1
		
	else:
		$AnswerLabel.text = "Incorrect"
		correct_ans()
	next_question() 

func _on_option_b_pressed():
	if correct[current_question_index] == 1: 
		$AnswerLabel.text = "Correct"
		score += 1
		
	else:
		$AnswerLabel.text = "Incorrect"
		correct_ans()
	next_question() 

func _on_option_c_pressed():
	if correct[current_question_index] == 2: 
		$AnswerLabel.text = "Correct"
		score += 1
	else:
		$AnswerLabel.text = "Incorrect"
		correct_ans() 
	next_question()

func _on_option_d_pressed():
	if correct[current_question_index] == 3: 
		$AnswerLabel.text = "Correct"
		score += 1
	else:
		$AnswerLabel.text = "Incorrect"
		correct_ans()
	next_question() 
		
func correct_ans():
	$Correct_Answer.text = options[current_question_index][correct[current_question_index]]
	print(options[current_question_index][correct[current_question_index]])
