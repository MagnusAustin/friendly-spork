extends Control

var ind = 0
var dialogs = [
	# Scene 1: CEO’s Office – The Attack Begins
	{
		"character": "CEO",
		"dialog": "Excuse me, everyone. Why are we getting so many service disruption alerts? Get the IT team on this immediately."
	},
	{
		"character": "Head of IT",
		"dialog": "Sir, we’re facing a massive server overload. It’s a DDoS attack, hitting us from multiple angles."
	},
	{
		"character": "CEO",
		"dialog": "DDoS? Isn’t our security supposed to prevent this?"
	},
	{
		"character": "Head of IT",
		"dialog": "We’ve got defenses in place, but this is huge. The entire system is being flooded. I’ve already escalated it to our white hat hacker, Neha. She’s working on it."
	},
	{
		"character": "CEO",
		"dialog": "Get her on the line now. And Arjun, this better get resolved quickly—we can’t afford downtime."
	},

	# Scene 2: White Hat Hacker’s Workspace – The Defense
	{
		"character": "CEO (Phone)",
		"dialog": "Neha, this is Mr. Mehta. What’s going on? How bad is it?"
	},
	{
		"character": "Neha",
		"dialog": "Sir, the company’s under a large-scale DDoS attack. A botnet’s targeting our servers with millions of requests per second. I’m working on filtering the traffic and blocking malicious IPs, but this isn’t just your usual attack—it’s coordinated."
	},
	{
		"character": "CEO",
		"dialog": "Can we stop it?"
	},
	{
		"character": "Neha",
		"dialog": "I’m doing everything I can. I’ve put up some initial defenses, but they’re adapting. We might need to reroute traffic through a CDN and bring in additional support from ISPs."
	},
	{
		"character": "CEO",
		"dialog": "Whatever it takes, Neha. We can’t let this hit us. I’ll leave this in your hands. Keep me updated."
	},
	{
		"character": "Neha",
		"dialog": "Understood, sir. I’ll keep you posted."
	},
	{
		"character": "Neha",
		"dialog": "Damn, they’re shifting tactics. They’re hitting the backup servers now… okay, time to counter this."
	},

	# Scene 3: The Black Hat Hacker’s Lair – The Attack Escalates
	{
		"character": "Vikram",
		"dialog": "Ah, there you are, Neha. I see you trying to block me... let’s see how fast you really are."
	},
	{
		"character": "Vikram",
		"dialog": "You think you can stop me? I’ve been planning this for months."
	},
	{
		"character": "Vikram",
		"dialog": "Not yet, but give them a few more hours of chaos, and they’ll be begging to pay."
	},

	# Scene 4: White Hat Hacker vs. Black Hat Hacker – The Cyber Battle
	{
		"character": "Neha",
		"dialog": "Come on, stay ahead of him…"
	},
	{
		"character": "Vikram (Message)",
		"dialog": "Nice try, Neha. But you’ll need to do better than that."
	},
	{
		"character": "Neha",
		"dialog": "Oh, so you want to play games?"
	},
	{
		"character": "Neha (Message)",
		"dialog": "You’re not getting in. I know every move you’re about to make."
	},
	{
		"character": "Vikram (Message)",
		"dialog": "Bold of you to think that. Let’s see who wins, shall we?"
	},

	# Scene 5: CEO’s Office – The Critical Moment
	{
		"character": "CEO",
		"dialog": "This can’t be happening… we’re going to lose millions if this continues."
	},
	{
		"character": "CEO",
		"dialog": "What’s the latest?"
	},
	{
		"character": "Head of IT",
		"dialog": "Neha’s fighting it, but the attack is still ongoing. The hacker’s not letting up."
	},
	{
		"character": "CEO",
		"dialog": "I don’t care what it takes—throw everything we have at this. Bring in external teams if needed."
	},
	{
		"character": "Head of IT",
		"dialog": "We might need to negotiate if things don’t improve."
	},
	{
		"character": "CEO",
		"dialog": "I don’t negotiate with criminals. Fix this."
	},

	# Scene 6: The Climax – Defense Wins
	{
		"character": "Neha",
		"dialog": "Got you."
	},
	{
		"character": "Neha (Message)",
		"dialog": "It’s over. You’ve lost."
	},
	{
		"character": "Vikram (Message)",
		"dialog": "Maybe this time. But there’s always next time."
	},

	# Scene 7: Aftermath – The CEO’s Response
	{
		"character": "CEO",
		"dialog": "Thanks to Neha and the team, we managed to fend off the attack. We’ve sustained some losses, but the company is secure. Moving forward, we’re increasing our cybersecurity investments."
	},
	{
		"character": "Board Member",
		"dialog": "What about the hacker? Can we trace them?"
	},
	{
		"character": "Neha",
		"dialog": "We’ve got some leads, but it’ll take time. The important thing is, we’re safe for now."
	},
	{
		"character": "CEO",
		"dialog": "Neha, you saved this company. We’re grateful."
	},
	{
		"character": "Neha",
		"dialog": "Just doing my job, sir."
	},

	# Final Scene: The Black Hat Hacker's Return
	{
		"character": "Vikram",
		"dialog": "Today was just a warm-up. They got lucky... next time, they won’t be."
	}
]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$Character.text = dialogs[ind].get("character","Unknown") # Replace with function body.
	$Dialogue.text = dialogs[ind].get("dialog","Unknown")
	ind += 1
