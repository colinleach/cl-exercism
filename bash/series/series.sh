input=$1
n=$2
len=${#input}

if [ $len -eq 0 ]; then
    echo "series cannot be empty"
    exit 1
fi

if [ $len -lt $n ]; then
    echo "slice length cannot be greater than series length"
    exit 1
fi

if [ $n -eq 0 ]; then
    echo "slice length cannot be zero"
    exit 1
fi

if [ $n -lt 0 ]; then
    echo "slice length cannot be negative"
    exit 1
fi

output=''

for (( start=0; start<=$((len - n)); start++ ))
do
    str=${input:start:n}
    output+=' '
    output+=$str
done

echo $output
