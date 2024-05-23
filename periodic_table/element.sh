#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  #All existing entries for elements
  NUMLIST=($($PSQL "SELECT atomic_number FROM elements;"))
  SYMBLIST=($($PSQL "SELECT symbol FROM elements;"))
  NAMELIST=($($PSQL "SELECT name FROM elements;"))

  #Retrieve atomic number of specified element
  if [[ ${NUMLIST[*]} =~ $1 ]]
    then 
        ATOMNUM=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$1';")
  elif [[ ${SYMBLIST[*]} =~ $1 ]]
    then
        ATOMNUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1';")
  elif [[ ${NAMELIST[*]} =~ $1 ]]
    then
        ATOMNUM=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1';")
  else
        echo "I could not find that element in the database."
  fi

  if ! [[ -z $ATOMNUM ]]
  then
    PROPERTIES=$($PSQL "SELECT * FROM properties INNSER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMNUM;")
    echo $PROPERTIES | sed s/" | "/" "/g | while ifs=" " read TYPE_ID ATOMNUM ATOMMASS MELTP BOILP SYMBOL NAME TYPE
    do
      if [[ -z $TYPE_ID || -z $ATOMNUM || -z $ATOMMASS || -z $MELTP || -z $BOILP || -z $SYMBOL || -z $NAME || -z $TYPE ]]
      #if [[ -z $ATOMNUM || -z $SYMBOL || -z $NAME ]]
      then
        echo "I could not find that element in the database."
      else
        echo "The element with atomic number $ATOMNUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMMASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
      fi
    done
  fi

fi

