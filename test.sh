

#!/bin/bash


cd ./assignment
file='100 CC Records.csv'
IFS=","
m1=06
y1=2019
while read f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11
do
		output=$(echo $f11 | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')
		output="$output USD"
		m="${f8:0:2}"
		y="${f8:3:7}"
		if [ $y -gt $y1 ]
  		then
		ans='active'
		elif [$y -eq $y1 -a $m -ge $m1]
		then
		ans='active'
		else 
		ans='expired'        
		fi
		filename="$f4.$ans"
	if [ ! -d "$f2" ]; then
		mkdir ./$f2
		cd ./$f2
		if [ ! -d "$f3" ]; then
		mkdir ./$f3
		cd ./$f3
		touch $filename.txt
		cat <<-EOT>> $filename.txt
		Card Type Code: $f1
		Card Type Full Name: $f2
		Issuing Bank: $f3
		Card Number: $f4
		Card Holder's Name: $f5
		CVV/CVV2: $f6
		Issue Date: $f7
		Expiry Date: $f8
		Billing Date: $f9
		Card PIN: $f10
		Credit Limit: $output
		EOT
		cd ..
		else
		cd ./$f3
		touch $filename.txt
		cat <<-EOT>> $filename.txt
		Card Type Code: $f1
		Card Type Full Name: $f2
		Issuing Bank: $f3
		Card Number: $f4
		Card Holder's Name: $f5
		CVV/CVV2: $f6
		Issue Date: $f7
		Expiry Date: $f8
		Billing Date: $f9
		Card PIN: $f10
		Credit Limit: $output
		EOT
		cd ..
		fi
	else
		cd ./$f2
		if [ ! -d "$f3" ]; then
		mkdir ./$f3
		cd ./$f3
		touch $filename.txt
		cat <<-EOT>> $filename.txt
		Card Type Code: $f1
		Card Type Full Name: $f2
		Issuing Bank: $f3
		Card Number: $f4
		Card Holder's Name: $f5
		CVV/CVV2: $f6
		Issue Date: $f7
		Expiry Date: $f8
		Billing Date: $f9
		Card PIN: $f10
		Credit Limit: $output
		EOT
		cd ..
		else
		cd ./$f3
		touch $filename.txt
		cat <<-EOT>> $filename.txt
		Card Type Code: $f1
		Card Type Full Name: $f2
		Issuing Bank: $f3
		Card Number: $f4
		Card Holder's Name: $f5
		CVV/CVV2: $f6
		Issue Date: $f7
		Expiry Date: $f8
		Billing Date: $f9
		Card PIN: $f10
		Credit Limit: $output
		EOT
		cd ..
		fi
	fi
cd ..
done < "$file"