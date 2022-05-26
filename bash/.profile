# ---------------------------------------------------------
# PS1 Setup
# ---------------------------------------------------------

font_black="\[\e[38;5;0m\]"
font_teal="\[\e[38;5;14m\]"
font_pink="\[\e[38;5;13m\]"
font_green="\[\e[38;5;10m\]"
font_grey="\[\e[38;5;8m\]"
back_teal="\[\e[48;5;14m\]"
back_pink="\[\e[48;5;13m\]"
back_green="\[\e[48;5;10m\]"
back_grey="\[\e[48;5;8m\]"
back_default="\[\e[49m\]"
reset="\[\e[0m\]"
right_char=""
left_char=""

messages=( \
    "Have a great day!" \
    "You rock, don't ever change!" \
    "This is a wonderful day, I have never seen this one before." \
    "Make each day your masterpiece." \
    "Today is your day, your mountain is waiting. So get on your way." \
    "The only secret behind a good day is a good attitude." \
    "This is a wonderful day waiting for you to enjoy." \
    "Wishing you a day full of sunshine." \
    "I just wanted to say I hope you have a wonderful day." \
    "Start each day with a grateful heart." \
    "Today is a good day to have a good day!" \
    "May your worries be light and your joy be great." \
    "Don’t forget to be awesome today!" \
    "Good morning, have an awesome day!" \
    "Life is beautiful; enjoy the ride." \
    "Have a ridiculously amazing day!" \
    "Good morning – it’s coffee time." \
    "The world always looks brighter from behind a smile." \
    "Every smile makes you a day younger." \
    "Hey, I’ve got nothing to do today but smile." \
    "Leave something good in every day." \
    "Someday, everything will make sense!" \
    "Make today an amazing day!" \
)

# GIT_PS1_SHOWDIRTYSTATE=y
# GIT_PS1_SHOWUNTRACKEDFILES=y
# GIT_PS1_SHOWUPSTREAM="git verbose"

directory="$back_default$font_teal$left_char$font_black$back_tealﱮ \w$font_teal"
time="$font_green$left_char$back_green$font_black\A  $font_green$back_default$right_char"
prompt="$reset\n\$ "
message="$back_grey$right_char$font_black \$picked_message"
time_position="\[\e[\${COLUMNS}G\]\[\e[9D\]"
background="$back_grey\$spaces\[\e[1G\]"

right="\n$background$directory"
left="$message$time_position$time$prompt"
format="$back_pink$right_char$font_black  %s$font_pink"

PROMPT_COMMAND=' \
    picked_message="${messages[$RANDOM % ${#messages[@]}]}"; \
    spaces="$(printf "%*s" $COLUMNS)"; \
    __git_ps1 "$right" "$left" "$format" \
'
