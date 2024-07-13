#!/bin/bash


# make a curl request to get tokens
curl -i -v 'https://ais.usvisa-info.com/en-am/niv/users/sign_in' \
  -H 'Accept: */*;q=0.5, text/javascript, application/javascript, application/ecmascript, application/x-ecmascript' \
  -H 'Accept-Language: en-GB,en;q=0.9,fa-IR;q=0.8,fa;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'Cookie: _gid=GA1.2.2103842680.1712819157; _ga=GA1.3.456017859.1708620406; _gid=GA1.3.2103842680.1712819157; _yatri_session=fyW%2FmBcp7dVXpevMJgaw%2Ff7C8xG6J%2FzV7%2BmKL8n%2BbJsKUO%2FNsZFfX0xceFYGyeJj1FaawKSlDxBvqQrGLGQHKlaWpA1pAPJbqgAKpz61wvxh8Apf17KPCxg9Gmy8LB7ejK5WfEbWgq%2B9X6T9NwELxfWo%2F%2BCEwy6hvr8dN7ZQdoy1cmBYQhiKd9f6CvVY7i%2BTafpHhk2BOVSvHeIgEO4I00WiLvoi8ZuoYZFU1f4bzKqfZx1BROhc%2BUdF1SH0PuyHD5gLHp1IW6GhhhmJp6sMnyk8Mf1ogNKGIEPmkRMmB3Y5maua9Q8VOlBNqXL2MdP5MrI%2F%2B9xLPpAyC1l90BKWnd3mPTapaMe2yTQ2x2u24O2YQfmk6WzVQBmgkhCP9b6iYUaaCNnb4nkDhNT1nyPe20s6hYILxDlgcRxyvTmhwNWX33zWCT8UQzAl42paR607rtPWhhGi%2FfIEylBgsAjc5NPpl2iK%2BqbFbgtEHPRJeajYXw4t6rqLg8QNmWQrTFbr3pCGntZ9qabFEv66mb0%2FecPNoBdrpLQtejW26FUUevijd7nPoE0stBuQKlOpzkmtDzOfBt4dd7RnIB7SSAbM367oUW9JIdb4exGlvcjmNXEM7UHkfLUhBJup4u3xXjLo72PQX6ImVMXuux0BwQ53xRLBPEmJ2A%3D%3D--lBx0yPvs5ZnlW7%2Bs--EJ1pBAK1%2BDjvyRNXxP0Q3w%3D%3D; _gat_GSA_ENOR0=1; _ga_CSLL4ZEK4L=GS1.1.1713192326.17.1.1713192639.0.0.0; _ga=GA1.1.456017859.1708620406; _ga_W1JNKHTW0Y=GS1.2.1713165393.14.1.1713192639.0.0.0' \
  -H 'Origin: https://ais.usvisa-info.com' \
  -H 'Referer: https://ais.usvisa-info.com/en-am/niv/users/sign_in' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36' \
  -H 'X-CSRF-Token: tpQCOlNk+BbrVrtpZWA3PNrSgifHnAPLwHj6XyguH7sicwvD2iWf7EszHvYHfb0bYgA+HXpAD8MQR8jyMoACDg==' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="123", "Not:A-Brand";v="8", "Chromium";v="123"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --data-raw 'user%5Bemail%5D=najafizadeh21%40gmail.com&user%5Bpassword%5D=%26%24V%23*2YkPPZbYC2&policy_confirmed=1&commit=Sign+In' \
  > login.txt

# build token
./token.sh
