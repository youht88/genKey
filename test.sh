arr=("|" "/" "-" "\\" )
for i in `seq 1 50`
do
  sleep 0.1
  progress=${progress}#;
  printf "[%s] %d,%s\r" ${arr[${i}%4]} $i $progress
done
