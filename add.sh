#将最近拍摄的照片或影片添加到icfs中。如果带参数，参数为最近的第几个文件
dir="/data/data/com.termux/files/home/storage/dcim/Camera/"
if [  -z "$1" ];then
	icfs name publish $(icfs add -Q $dir`ls -t -1 $dir|grep -v cache|head -n 1`)
else
	icfs name publish $(icfs add -Q $dir`ls -t -1 $dir|grep -v cache|head -n $1|tail -n 1`)
fi;

