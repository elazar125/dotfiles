#!/bin/bash

# ---------------------------------------------------------
# PS1 Setup
# ---------------------------------------------------------

# shellcheck disable=SC2034

font_black="\[\e[38;5;0m\]"
font_red="\[\e[38;5;1m\]"
font_green="\[\e[38;5;2m\]"
font_yellow="\[\e[38;5;3m\]"
font_blue="\[\e[38;5;4m\]"
font_purple="\[\e[38;5;5m\]"
font_cyan="\[\e[38;5;6m\]"
font_white="\[\e[38;5;7m\]"
font_grey="\[\e[38;5;8m\]"
font_light_red="\[\e[38;5;9m\]"
font_light_green="\[\e[38;5;10m\]"
font_light_yellow="\[\e[38;5;11m\]"
font_light_blue="\[\e[38;5;12m\]"
font_light_purple="\[\e[38;5;13m\]"
font_light_cyan="\[\e[38;5;14m\]"
font_light_grey="\[\e[38;5;15m\]"
reset="\[\e[0m\]"

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

compute_git_status() {
    echo -n "$font_yellow %s"

    status=$(git status --porcelain --no-ahead-behind 2>/dev/null)
    if [[ "$status" == "" ]]; then return; fi

    declare -A worktree
    declare -A index

    IFS=''
    while read -r line; do
        indexChar="${line:0:1}"
        if ! [[ "$indexChar" =~ [[:space:]?] ]]; then
            ((index[$indexChar]++))
        fi

        worktreeChar="${line:1:1}"
        if ! [[ "$worktreeChar" =~ [[:space:]] ]]; then
            ((worktree[$worktreeChar]++))
        fi
    done <<< "$status"
    unset IFS

    echo -n "$reset\n├ $font_purple( $font_green"
    for x in "${!index[@]}"; do echo -n "${index[$x]}$x " ; done
    echo -n "$font_red"
    for x in "${!worktree[@]}"; do echo -n "${worktree[$x]}$x " ; done
    echo "$font_purple)"
}

init="$reset\n╭"
directory="$font_cyan \w"
time="$font_red \A"
message="$reset\n├ $font_green\$picked_message"
prompt="$reset\n╰   "

left="$init $time $directory "
right="$message $prompt"
format="$font_yellow %s"

PROMPT_COMMAND=' \
    history -a; \
    picked_message="${messages[$RANDOM % ${#messages[@]}]}"; \
    format="$(compute_git_status)" ; \
    __git_ps1 "$left" "$right" "$format" \
'
