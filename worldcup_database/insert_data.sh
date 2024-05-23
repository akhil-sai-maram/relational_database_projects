#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "CREATE TABLE IF NOT EXISTS temp_teams(name VARCHAR(50));")
echo $($PSQL "TRUNCATE teams, temp_teams, games;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  if [[ $WINNER != "winner" ]]
  then
    INSERT_TEMP_TEAMS=$($PSQL "INSERT INTO temp_teams(name) VALUES('$WINNER');")
    if [[ $INSERT_TEMP_TEAMS = "INSERT 0 1" ]]
    then
      echo Team $WINNER inserted successfully
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    INSERT_TEMP_TEAMS=$($PSQL "INSERT INTO temp_teams(name) VALUES('$OPPONENT');")
    if [[ $INSERT_TEMP_TEAMS = "INSERT 0 1" ]]
    then
      echo Team $WINNER inserted successfully.
    fi
  fi

done

INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) SELECT DISTINCT name FROM temp_teams;")
if [[ $INSERT_TEAMS = "INSERT 0 1" ]]
then
  echo $WINNER inserted successfully into teams
fi

echo $($PSQL "DROP TABLE temp_teams;")


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
  INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNERGOALS, $OPPONENTGOALS);")
  
  if [[ $INSERT_GAMES = "INSERT 0 1" ]]
  then
    echo game inserted successfully
  fi
done
