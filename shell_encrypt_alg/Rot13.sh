#!/bin/bash

Usage(){
	echo "Rot13.sh is a bash script fot Rot13 encryption"
	echo "Usage:"
	echo -e "\t$0 input_string"
}

if [ $# -lt 1 ]; then
	Usage
	exit 
fi

#return char position in string
#usage: str_char_pos str char
str_char_pos(){
	str=$1
	strlen=${#str}

	for (( i = 0; i < $strlen; i++ )); do
		if [ ${str:$i:1} == "$2" ]; then
			echo $i
			return
		fi
	done

	echo "-1" #failed
}

Rot13Table1='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
Rot13Table2='NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'


str=$1
strlen=${#str}
result=''

for (( i = 0; i < $strlen; i++ )); do
	char=${str:$i:1}
	pos=`str_char_pos $Rot13Table1 $char`
	if [ $pos == "-1" ]; then #Not a alphabeta
		result="$result$char"
	else #alphabeta, translate it
		result="$result${Rot13Table2:$pos:1}"
	fi
done

echo $result
