

milliseconds_to_date() {
    milliseconds="$1"
    seconds=$((milliseconds / 1000))
    date="$(date -u -r "$seconds" +"%Y-%m-%d %H:%M:%S")"
     echo "milliseconds to date: $date"
}

seconds_to_date() {
    seconds="$1"
    date="$(date -u -r "$seconds" +"%Y-%m-%d %H:%M:%S")"
    echo "seconds to date: $date"
}


current_milliseconds() {
    echo $(($(date +%s) * 1000 + $(date +%N) / 1000000))
}



flag=""

if [ "$#" -eq 0 ]; then
    echo "No arguments passed...getting current milliseconds"
    current_milliseconds
fi

for arg in "$@"; do
    if [[ "$arg" == "--"* ]]; then
        flag="${arg:2}" # Remove the leading "--"
    else
        if [ "$flag" = "millis" ]; then
            milliseconds_to_date "$arg"
        fi
        if [ "$flag" = "secs" ]; then
            seconds_to_date "$arg"
        fi
    fi
done