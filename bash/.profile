# ---------------------------------------------------------
# PS1 Setup
# ---------------------------------------------------------

dir_colour="\[\e[0;30m\]\[\e[48;5;13m\]"
branch_colour="\[\e[0;30m\]\[\e[48;5;5m\]"
message_colour="\[\e[38;5;15m\]\[\e[48;5;8m\]"
time_colour="\[\e[38;5;0m\]\[\e[48;5;7m\]"
reset="\[\e[0m\]"

prompt="${reset}\n$ " # Display a traditional $ on the next line as the prompt for commands
git_branch="${branch_colour}\`__git_ps1\` " # Show the current git branch (if applicable), automatically updates
directory="${dir_colour} \w " # Show the current directory
command="${message_colour}" # Append text for a suggested command (i.e. for running grunt / dotnet)

messages=("Have a great day!" "You rock, don't ever change!" "This is a wonderful day, I have never seen this one before." "Make each day your masterpiece." "Today is your day, your mountain is waiting. So get on your way." "The only secret behind a good day is a good attitude." "This is a wonderful day waiting for you to enjoy." "Wishing you a day full of sunshine." "I just wanted to say I hope you have a wonderful day." "Start each day with a grateful heart." "Today is a good day to have a good day!" "May your worries be light and your joy be great." "Don’t forget to be awesome today!" "Good morning, have an awesome day!" "Life is beautiful; enjoy the ride." "Have a ridiculously amazing day!" "Good morning – it’s coffee time." "The world always looks brighter from behind a smile." "Every smile makes you a day younger." "Hey, I’ve got nothing to do today but smile." "Leave something good in every day." "Someday, everything will make sense!" "Make today an amazing day!")

command+=" \${messages[\$RANDOM % \${#messages[@]} ]} " # No suggested commands for a plain old terminal, just display random message

time="$time_colour [ \A ] "
COLUMNS=$(tput cols)

# TODO: Make responsive
# Set the PS1 variable, which stands for Prompt Script 1, which sets the text for the prompt
PS1="\n$message_colour\`printf "%*s" \\\`tput cols\\\`\`\e[1G$directory$git_branch$command\e[\`tput cols\`G\e[10D$time$prompt"
