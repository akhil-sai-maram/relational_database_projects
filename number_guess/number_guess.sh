#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

ANSWER=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

USERNAME_EXIST=$($PSQL "SELECT username FROM game_info WHERE username = '$USERNAME';")

if [[ -z $USERNAME_EXIST ]]
then 
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  USER_INFO=$($PSQL "SELECT * FROM game_info WHERE username='$USERNAME';")
  echo $USER_INFO | sed s/"|"/" "/g | while ifs=' ' read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo $ANSWER

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

COUNT=1
while [[ $USER_GUESS -ne $ANSWER ]]
do
  ((COUNT=COUNT+1))
  while ! [[ "$USER_GUESS" =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read USER_GUESS
  done

  if [[ $USER_GUESS -lt $ANSWER ]]
  then
    echo "It's higher than that, guess again:"
    read USER_GUESS
  else
    echo "It's lower than that, guess again:"
    read USER_GUESS
  fi
done

if [[ -z $USERNAME_EXIST ]]
then
  INSERT_NEW_USER=$($PSQL "INSERT INTO game_info(username, games_played, best_game_guesses) VALUES ('$USERNAME', 1, $COUNT);")
  if [[ $INSERT_NEW_USER = "INSERT 0 1" ]]
  then
    echo "New user inserted successfully"
  else
    echo "Error inserting new user"
  fi
else
  NEW_GAMES_PLAYED=$GAMES_PLAYED+1
  if [[ $COUNT -lt $BEST_GAME ]]
  then
    UPDATE_GUESS=$($PSQL "UPDATE game_info SET best_game_guesses = $COUNT WHERE username = '$USERNAME';")
    if ! [[ $UPDATE_GUESS = "UPDATE 1" ]]
    then
      echo "Error inserting new guess"
    fi
  fi

  UPDATE_GAME=$($PSQL "UPDATE game_info SET games_played = $NEW_GAMES_PLAYED WHERE username = '$USERNAME';")

  if [[ UPDATE_GAME = "UPDATE 1" ]]
  then
    echo "Existing user data updated successfully"
  else
    echo "Error inserting user game count"
  fi
fi

echo "You guessed it in $COUNT tries. The secret number was $ANSWER. Nice job!"
