#!/bin/bash

echo "runbook started (with $1 seconds period) ...";
say "Jason is back baby"

mkdir logs
token=$(cat token.txt)

target=8 # 8 is Auguest (it will check for month less equal than Auguest)

echo "read token: $token"

while true; do

  # make a curl request to fetch data (result is stored in tmp.json)
  curl 'https://ais.usvisa-info.com/en-am/niv/schedule/57107853/appointment/days/122.json?appointments\[expedite\]=false' \
    -H 'Accept: application/json, text/javascript, */*; q=0.01' \
    -H 'Accept-Language: en-GB,en;q=0.9,fa-IR;q=0.8,fa;q=0.7,en-US;q=0.6' \
    -H 'Connection: keep-alive' \
    -H "Cookie: _gid=GA1.2.2103842680.1712819157; _ga=GA1.3.456017859.1708620406; _gid=GA1.3.2103842680.1712819157; _ga_CSLL4ZEK4L=GS1.1.1713192326.17.1.1713192674.0.0.0; _ga=GA1.2.456017859.1708620406; _gat=1; _ga_W1JNKHTW0Y=GS1.2.1713165393.14.1.1713198047.0.0.0; _yatri_session=$token" \
    -H 'Referer: https://ais.usvisa-info.com/en-am/niv/schedule/57107853/appointment?applicants%5B%5D=67294830&applicants%5B%5D=67294881&confirmed_limit_message=1&commit=Continue' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Site: same-origin' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36' \
    -H 'X-CSRF-Token: WRL5BAcNwoD3xkUDL1ZvpD7+JD988/s2TnZhaBD/fjyP/otzaWUxARGingnxobdtxi7TFg6ndoAn9feq2oBlNg==' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'sec-ch-ua: "Google Chrome";v="123", "Not:A-Brand";v="8", "Chromium";v="123"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    > tmp.json

  # first check tmp.json for errors
  jsonfilecheck=$(cat tmp.json | jq -e || echo "parse error")
  if [[ "$jsonfilecheck" == *"parse error"* ]]; then
    cp tmp.json "logs/$(echo $(date '+%Y-%m-%d--%H-%M-%S'))"

    echo "failed to parse tmp.json"
    sleep $1

    continue
  fi

  # convert the base file with new.json
  cat tmp.json | python3 -m json.tool > new.json

  # check for session expiration
  dcheck=$(cat new.json)
  if [[ "$dcheck" == *"error"* ]]; then
    echo "interrupted with session expired!"

    ./curl.sh
    token=$(cat token.txt)

    continue
  fi

  # compare the first item of two current files
  newj=$(cat new.json | jq '.[0]')
  oldj=$(cat dates.json | jq '.[0]')

  echo "new one:\n $newj"
  echo "old one:\n $oldj"

  if [ "$newj" != "$oldj" ]; then
    say "get here, I found one"

    echo "some dates are changed!"

    newjdate=$(cat new.json | jq '.[0].date')

    compareresult=$(python3 match.py "$newjdate" "$target")
    if [ "$compareresult" == "True" ]; then
      say "it is a candidate"

      echo "found a candidate"

      exit 0
    else
      echo "no match! ($newjdate)"
    fi
  fi

  echo "one round fetched successfully!"
  date

  sleep $1

done
