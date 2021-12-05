# ---------------------------------------------------------
# PS1 Setup
# ---------------------------------------------------------

dir_colour="\[\e[38;5;0m\]\[\e[48;5;14m\]"
branch_colour="\[\e[38;5;0m\]\[\e[48;5;3m\]"
message_colour="\[\e[38;5;15m\]\[\e[48;5;8m\]"
time_colour="\[\e[38;5;0m\]\[\e[48;5;10m\]"
reset="\[\e[0m\]"

spaces="$message_colour\`printf '%*s' \\\`tput cols\\\`\`\e[1G"
directory="${dir_colour} \w "
git_branch="${branch_colour}\`__git_ps1\`"

messages=("Have a great day!" "You rock, don't ever change!" "This is a wonderful day, I have never seen this one before." "Make each day your masterpiece." "Today is your day, your mountain is waiting. So get on your way." "The only secret behind a good day is a good attitude." "This is a wonderful day waiting for you to enjoy." "Wishing you a day full of sunshine." "I just wanted to say I hope you have a wonderful day." "Start each day with a grateful heart." "Today is a good day to have a good day!" "May your worries be light and your joy be great." "Don’t forget to be awesome today!" "Good morning, have an awesome day!" "Life is beautiful; enjoy the ride." "Have a ridiculously amazing day!" "Good morning – it’s coffee time." "The world always looks brighter from behind a smile." "Every smile makes you a day younger." "Hey, I’ve got nothing to do today but smile." "Leave something good in every day." "Someday, everything will make sense!" "Make today an amazing day!")
message="${message_colour} \${messages[\$RANDOM % \${#messages[@]} ]} "

time_position="\e[\`tput cols\`G\e[10D"
time="$time_colour [ \A ] "
prompt="${reset}\n$ "

GIT_PS1_SHOWDIRTYSTATE=y
GIT_PS1_SHOWUNTRACKEDFILES=y
GIT_PS1_SHOWUPSTREAM=y

PS1="\n$spaces$directory$git_branch$message$time_position$time$prompt"
