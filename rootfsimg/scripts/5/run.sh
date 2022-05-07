rm -f runtime.txt
i=0
bg=$(date +%s)
while [ $i -lt 2 ]
do
    let i=i+1
    bg_one=$(date +%s)
    ./single_thread ha.txt a > log;
    #sleep 1
    ed_one=$(date +%s)
    tm_one=`expr $ed_one - $bg_one`
    echo "$i: $tm_one" | tee -a runtime.txt
done
ed=$(date +%s)
all=`expr $ed - $bg`
echo "all: $all" | tee -a runtime.txt
