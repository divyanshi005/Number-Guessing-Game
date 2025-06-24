#!/bin/bash

# Set up the psql command
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

# Ask for the username
echo "Enter your username:"
read USERNAME

# Trim username to 22 characters
USERNAME=${USERNAME:0:22}

# Check if user exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';" | xargs)

# If user doesn't exist, insert into users table
if [[ -z $USER_ID ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
else
  # Fetch games played and best game, trim output
  USER_STATS=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")
  GAMES_PLAYED=$(echo "$USER_STATS" | cut -d '|' -f1 | xargs)
  BEST_GAME=$(echo "$USER_STATS" | cut -d '|' -f2 | xargs)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate the secret number
SECRET_NUMBER=$((1 + RANDOM % 1000))

# Prompt user to guess
echo "Guess the secret number between 1 and 1000:"

# Initialize guess counter
NUMBER_OF_GUESSES=0

# Game loop
while true; do
  read GUESS

  # Validate input
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update games played and best game
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';" | xargs)
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")

    # Update users table
    CURRENT_STATS=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")
    GAMES_PLAYED=$(echo "$CURRENT_STATS" | cut -d '|' -f1 | xargs)
    BEST_GAME=$(echo "$CURRENT_STATS" | cut -d '|' -f2 | xargs)

    ((GAMES_PLAYED++))

    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
      UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME';")
    else
      UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME';")
    fi

    break
  fi
done
