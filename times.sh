#!/bin/bash

selecteddate=$1
token=$(cat token.txt)

curl "https://ais.usvisa-info.com/en-am/niv/schedule/57107853/appointment/times/122.json?date=$selecteddate&appointments\[expedite\]=false" \
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
    > times.json
