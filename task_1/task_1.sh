#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

for site in "${websites[@]}";
do
    if curl -o /dev/null -s -L --head --request GET -w '%{http_code}\n' "$site" | grep "200" > /dev/null;
      then
          echo "$site is UP" >> "$log_file"
      else
          echo "$site is DOWN" >> "$log_file"
    fi
done

echo "Результати перевірки записано у файл логів $log_file"
