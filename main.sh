#! /bin/bash

echo "
=========================================================
Book Management Tool | Copy & Name Generator | ver. 0.0.2
(⁎⁍̴̛ᴗ⁍̴̛⁎)‼ 呀～欢迎使用！
Welcome to use!
========================================================="
read -e -p "请输入本次的工作目录。。。就是说光盘文件你要存
到哪个文件夹的意思(❀╹◡╹)直接输入文件地址或者将文件夹拖拽至
此行，如无需拷贝光盘请直接按<ENTER>:" STOR_PATH

echo 'Directory setup ready. 请输入－
start copy - 拷贝光盘中的内容到指定文件夹中
合法的isbn号 － 自动生成图书信息
exit - 退出程序，结束任务
'

while true; do
	read ST
	case ${ST} in
		[Ss][Tt][Aa][Rr][Tt]\ [Cc][Oo][Pp][Yy])
			[ ${STOR_PATH} -z ] && echo "You didn't set the destination directory. Please run this program again to set dir."
			[ ! ${STOR_PATH} -e ] && echo "Error: ${STOR_PATH} not exist!"
			cp -rv /Volumes/我的光盘/* "${STOR_PATH}" &
			wait ${!}
			echo "\
######################
#   Copy Complete!   #
######################"
		;;
		exit)
			echo "ᕕ ( ᐛ ) ᕗ下次还可以找我帮忙！Bye Bye~"
			exit
		;;
		[0-9]*)
			echo "这是你要的关于isbn号为${ST}的书的信息："
			python3 ${0%/*}/Getbookinfo_douban.py ${ST}
		;;
		*)
			echo "Error: Invalid syntax. Please check input."
		;;
	esac
done


