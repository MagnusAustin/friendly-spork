extends Control

func _ready():
	# Initialize Firebase
	var firebase_config = {
		"apiKey": "AIzaSyB4g_9rFPureTnrk2b8uQizMIVA_u8x0lI",
		"authDomain": "quizapp-e46a2.firebaseapp.com",
		"databaseURL": "https://quizapp-e46a2.firebaseio.com",
		"projectId": "quizapp-e46a2",
		"storageBucket": "quizapp-e46a2.appspot.com",
		"messagingSenderId": "216409482935",
		"appId": "1:216409482935:web:9158cfd62a60b7a9704f32",
		"measurementId": "G-EXK3FJ3YRJ"
	}
	
	# Connect signals
	Firebase.Auth.login_succeeded.connect(on_login_success)
	Firebase.Auth.signup_succeeded.connect(on_signup_success)
	Firebase.Auth.login_failed.connect(on_login_fail)
	Firebase.Auth.signup_failed.connect(on_signup_fail)    

func _process(delta):
	pass

func _on_sign_in_button_pressed():
	var email = $VBoxContainer/EmailLineEdit.text
	var password = $VBoxContainer/PasswordLineEdit.text
	Firebase.Auth.login_with_email_and_password(email, password)
	$VBoxContainer/StateLabel.text = "Signing in"

func _on_login_button_pressed():
	var email = $VBoxContainer/EmailLineEdit.text
	var password = $VBoxContainer/PasswordLineEdit.text
	Firebase.Auth.login_with_email_and_password(email, password)
	$VBoxContainer/StateLabel.text = "Logging in"

func on_login_success(auth):
	print(auth)
	$VBoxContainer/StateLabel.text = "Login Success"

func on_signup_success(auth):
	print(auth)
	$VBoxContainer/StateLabel.text = "SignUp Success"

func on_login_fail(error_code, message):
	print(error_code)
	print(message)
	$VBoxContainer/StateLabel.text = "Login Failed"

func on_signup_fail(error_code, message):
	print(error_code)
	print(message)
	$VBoxContainer/StateLabel.text = "Sign up Failed"
