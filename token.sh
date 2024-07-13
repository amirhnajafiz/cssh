#!/bin/bash

context=$(cat login.txt | grep _yatri_session | awk '{print $2}')
token=${context#"_yatri_session="}
token=${token%";"}

echo "$token" > token.txt