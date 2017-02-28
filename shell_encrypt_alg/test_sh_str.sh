
str='abc123'
strlen=${#str}

for (( i = 0; i < $strlen; i++ )); do
	sub_str=${str:$i:1}
	ascii=`printf "%d" "'$sub_str"`
	sec_ascii=`expr $ascii + 13`
#	if [ $sec_ascii -lt ]
	echo "$sub_str, $ascii, $sec_ascii"
done

