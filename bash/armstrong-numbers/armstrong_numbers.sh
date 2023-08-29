input=$1
n=${#input}

for (( i=0; i<=$n; i++ )); do
    digit=${input:i:1}
    sum=$(( sum + digit**n ))
done

if [[ $sum -eq $1 ]]; then
    echo "true"
else
    echo "false"
fi