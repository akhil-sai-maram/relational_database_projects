#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~MY SALON~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  echo "Welcome to my salon! How can I help you?"
  echo -e "\n1) haircut\n2) tanning\n3) massage\n4) exit"
  read SERVICE_ID_SELECTED
  
  case $SERVICE_ID_SELECTED in
    1) HAIRCUT_MENU $SERVICE_ID_SELECTED ;;
    2) TANNING_MENU $SERVICE_ID_SELECTED ;;
    3) MASSAGE_MENU $SERVICE_ID_SELECTED ;;
    4) EXIT ;;
    *) MAIN_MENU "Option not recognised. Please enter a valid option" ;;
  esac
}

HAIRCUT_MENU() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $1;")
}

TANNING_MENU() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $1;")
}

MASSAGE_MENU() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $1;")
}

EXIT() {
  echo "Thank you for visiting the salon."
}


MAIN_MENU

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

PHONE_CHECK=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")

if [[ -z $PHONE_CHECK ]]
then
  echo -e "\nPlease enter your name:"
  read CUSTOMER_NAME
  NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
fi

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

echo -e "\nWhat time would you like your appointment to be$CUSTOMER_NAME?"
read SERVICE_TIME

INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

if [[ $INSERT_APPOINTMENT == 'INSERT 0 1' ]]
then
  echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
fi
