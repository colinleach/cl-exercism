re='^[0-9]+$'
if [[ $# -ne 1 || ! ($1 =~ $re) ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi

if [[ $(($1 % 400)) -eq 0 || ($(($1 % 4)) -eq 0 && ! ($(($1 % 100)) -eq 0)) ]]
then
    echo "true"
else
    echo "false"
fi