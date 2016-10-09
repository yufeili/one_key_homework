#!/bin/bash
FILE=`ls `	#当前目录下的文件
#echo $FILE
if [ "$FILE" = "" ];then
	echo "no resource file" #没有找到源代码文件
	exit 0
else
	TEMP=$(ls | grep *.c) #文件中寻找.c文件
	if [ "$TEMP" = "" ];then
		echo "没有.c文件"
	else
		echo "发现.c文件"
		TEMP1=$(ls | grep a.out)  #寻找a.out可执行文件
		if [ "$TEMP1" != "" ];then #删除
			rm -f a.out
		fi
		echo $TEMP1  ##
		cat $TEMP > 1.c #复制源代码
		enca -L zh_CN -x UTF-8 1.c #转码
		cat 1.c  #显示源代码
		gcc 1.c -lm -g -Wall -Wextra -o a.out #编译
		STATUS=$0 
		echo $STATUS 
		chmod 700 a.out #修改权限
		./a.out  #执行
		rm 1.c 
		rm $TEMP
		exit 0
	fi
	TEMP=$(ls | grep *.cpp) #文件中寻找.cpp文件
	if [ "$TEMP" = "" ] ; then
		echo "没有找到.cpp文件"
	else
		rm -f 1.cpp
		TEMP1=$(ls |grep a.out)
		if [ "$TEMP1" != "" ] ; then
			rm -f a.out
		fi
		cat $TEMP > 1.cpp
		enca -L zh_CN -x UTF-8 1.cpp #转码为UTF-8编码
		if [ $(cat 1.cpp | grep main) = '' ];then #把void main 替换
			echo "1"  ##
		else
			echo "2"  ##有void main语句
		fi
		cat 1.cpp #显示源代码
		STATUS =$(g++ 1.cpp -lm -g -Wall -Wextra -o a.out) #编译
		echo $STATUS
		rm 1.cpp
		exit 0
		chmod 700 a.out
		./a.out
		exit 0
	fi
fi
exit 0

