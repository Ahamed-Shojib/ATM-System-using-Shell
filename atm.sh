#!/bin/bash
# Sample ATM System

balance=0
amount_w=0
amount_d=0

function home() {

while true; do
        display_menu

        echo -n "	Enter your choice: "
        read choice

        case $choice in
            1) check_balance;;
            2) withdraw;;
            3) deposit;;
	    4) statement;;
	    5) account_details;;
            6) printf " \n	= = = = = -> Thank You for Using ATM System! <- = = = = = \n";break;;
            *) printf " \n	= = = = = -> Invalid choice. Please try again <- = = = = = \n";;
        esac
        
    done

}

function account_details() {

	echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - " 
        echo "		Owner Name - - -> Account No. - - -> Pin No." 
        profile=$(grep "$name" users.txt)
        echo "		$profile"
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        display_title

	
        #echo "Under Construction........."

}

function display_all() {
	sleep 4
	printf "\033c"
	display_title
}
function clear_screen() {
	printf "\n\n		       Loading ..... "
	sleep 3
	printf "\033c"
	display_title
}

function display_title() {
	
	echo "=================================================================="
	echo "     		Welcome to the ATM System       "
	echo "=================================================================="
}
function Init_display() {

while true; do
    echo "	1. Enter Account"
    echo "	2. Create Account"
    echo "	3. Exit"
    read -p "	Enter your choice: " choice
    display_title

    case $choice in
        1) enter_account ;;
        2) create_account ;;
        3) printf " \n   = = = = = -> Exiting ATM System. Goodbye! <- = = = = = \n"; exit ;;
        *) printf " \n   = = -> Invalid choice! Please enter a valid option <- = =\n" ;;
    esac
 done

}
enter_account() {
    read -p "	Enter your account number: " account_number
    read -p "	Enter your Pin number: " pin
    profile=$(grep "$account_number" users.txt)
    if [ -n "$profile" ]; then
    	display_title
        home
    else
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        echo "		- - - - Account not found ! - - - -"
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        
    fi
}

create_account() {
    read -p "	Enter your name: " name
    read -p "	Enter your account number: " account_number
    read -p "	Enter your Account Pin Number : " pin

    echo "$name - - -> $account_number - - -> $pin" >> users.txt

    	echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - " 
        echo "		- - - -> Profile created successfully ! <- - - - "
        echo "			  ->Account Name : $name  "
        echo "			  ->Account Number : $account_number  "
        echo "			  ->Pin Number : $pin  "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
}


function display_menu() {

    echo "	1. Check Balance"
    echo "	2. Withdraw"
    echo "	3. Deposit"
    echo "	4. Statement"
    echo "	5. Account Details"
    echo "	6. Exit"
}

function check_balance() {
	
	echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        echo "			Your balance is: $balance Tk "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        display_title
    
}

function withdraw() {
    echo -n "	Enter the amount to withdraw: "
    read amount_w

    if [[ $amount_w -gt 0 && $amount_w -le $balance ]]; then
        balance=$((balance - amount_w))
        printf " - - - - - - - - - - - - - withdraw - - - - - - - - - - - - - - -\n"
	printf "	    $amount_w Tk withdrawal successful\n	    New balance: $balance Tk\n"
	printf " - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - -\n"
	display_title
    else
    	echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        printf "	 - - - -Invalid amount or insufficient funds - - - \n"
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        display_title
    fi
}

function deposit() {
    echo -n "	Enter the amount to deposit: "
    read amount_d

    if [[ $amount_d -gt 0 ]]; then
        balance=$((balance + amount_d))
        printf " - - - - - - - - - Deposit - - - - - - - - - -\n"
	printf "	$amount_d Tk deposit successful.\n	New balance: $balance Tk\n"
	printf " - - - - - - - - - - - - - -  - - - - - - - - - -\n"
	display_title
       
    else
    	echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo "		- - - - - - - Invalid amount - - - - - - - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        display_title
    fi

}

function statement() {
	printf " - - - - - - - - - Statement - - - - - - - - - -\n"
	printf "	-> Account No. : $account_number \n"
	printf "	-> Deposit Amount : $amount_d Tk\n"
	printf "	-> Withdraw Amount : $amount_w Tk\n"
	printf "	-> Current Amount : $balance Tk\n"
	printf " - - - - - - - - - - - - - -  - - - - - - - - - -\n"
	display_title

}
# Main program
display_title
clear_screen

Init_display

#display_all

    
