#!/bin/bash
FILE=`ls `	#假设为.c文件 
#echo $FILE
if [ "$FILE" = "" ];then
	echo "no resource file" #没有找到源代码文件
	exit 0
else
	TEMP=$(ls | grep *.c) #文件中寻找.c文件
	if [ "$TEMP" = "" ];then
		echo "1"
	else
		TEMP1=$(ls | grep a.out)  #寻找a.out可执行文件
		if [ "$TEMP1" != "" ];then #删除
			rm -f a.out
		fi
		echo $TEMP
		gcc $TEMP -lm -g -Wall -Wextra -o a.out
		STATUS=$0
		echo $STATUS 
		chmod 700 a.out
		./a.out

		exit 0
		TEMP=$(ls | grep *.cpp)#文件zhong寻找.cpp文件
		if [ "$TEMP" = "" ] ; then
			echo "1"
		else
			TEMP1=$(ls |grep a.out)
			if [ "$TEMP1" != "" ] ; then
				rm -f a.out
			fi
			STATUS =$(g++ TEMP -lm -g -Wall -Wextra -o a.out)
			echo $STATUS
			exit 0
		fi
	fi
fi
exit 0

