# ---------------------------------------------------------
# PS1 Setup
# ---------------------------------------------------------

yellow="\[\033[0;33m\]"
cyan="\[\033[0;36m\]"
magenta="\[\033[1;35m\]"
white="\[\033[0;37m\]"

prompt="${white}\n$ " # Display a traditional $ on the next line as the prompt for commands
git_branch="${cyan}\`__git_ps1\`" # Show the current git branch (if applicable), automatically updates
directory="${yellow}" # Append text for the current directory
command="${white} - ${magenta}" # Append text for a suggested command (i.e. for running grunt / dotnet)

messages=("Have a great day!" "You rock, don't ever change!" "This is a wonderful day, I have never seen this one before." "Make each day your masterpiece." "Today is your day, your mountain is waiting. So get on your way." "The only secret behind a good day is a good attitude." "This is a wonderful day waiting for you to enjoy." "Wishing you a day full of sunshine." "I just wanted to say I hope you have a wonderful day." "Start each day with a grateful heart." "Today is a good day to have a good day!" "May your worries be light and your joy be great." "Don’t forget to be awesome today!" "Good morning, have an awesome day!" "Life is beautiful; enjoy the ride." "Have a ridiculously amazing day!" "Good morning – it’s coffee time." "The world always looks brighter from behind a smile." "Every smile makes you a day younger." "Hey, I’ve got nothing to do today but smile." "Leave something good in every day." "Someday, everything will make sense!" "Make today an amazing day!")

directory+="\w" # Current directory, automatically updates
command+="\${messages[\$RANDOM % \${#messages[@]} ]}" # No suggested commands for a plain old terminal, just display random message

# Set the PS1 variable, which stands for Prompt Script 1, which sets the text for the prompt
PS1="\n${directory}${git_branch}${command}${prompt}"
