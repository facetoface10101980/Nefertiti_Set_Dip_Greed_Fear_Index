#!/bin/bash
# This script gets the current classification for the "Greed & Fear Index" 
# from https://alternative.me/crypto/fear-and-greed-index/ and sets the argument "dip" accordingly.
# So the index usuallay updates at 02:00am (GMT+2)
# Possibily, version of Python's interpreter has to be adjusted (in this case 'python3.8')
response=$(curl -s 'https://api.alternative.me/fng/' | python3.8 -c "import json,sys;obj=json.load(sys.stdin);print(obj['data'][0]['value_classification']);")
if [[ $response = "Extreme Fear" ]]
then
        echo $(date +"%Y/%m/%d %H:%M:%S") "set dip to 7"
                DIP=7
elif [[ $response = "Fear" ]]
then
        echo $(date +"%Y/%m/%d %H:%M:%S") "set dip to 6"
                DIP=6
elif [[ $response = "Neutral" ]]
then
        echo $(date +"%Y/%m/%d %H:%M:%S") "set dip to 5 (default)"
                DIP=5
elif [[ $response = "Greed" ]]
then
        echo $(date +"%Y/%m/%d %H:%M:%S") "set dip to 4"
                DIP=4
elif [[ $response = "Extreme Greed" ]]
then
        echo $(date +"%Y/%m/%d %H:%M:%S")"set dip to 3"
                DIP=3
fi

#example call for nefertiti bot
./nefertiti buy --exchange=[EXCHANGE] --api-key=[API_KEY] --api-secret=[API_SECRECT] --market=all --quote=USDT --volume=10 --price=5 --top=1 --dip=$DIP --repeat=1

#example call of the script using PM2. Restart the script every day at 3am according to time you have set in your system
#pm2 start "[YOUR_SCRIPT].sh" --cron-restart="0 3 * * *"

