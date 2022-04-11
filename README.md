# Nefertiti_Set_Dip_Greed_Fear_Index
# This script gets the current classification for the "Greed &amp; Fear Index"
# from https://alternative.me/crypto/fear-and-greed-index/ and sets the argument "dip" accordingly.
# So the index usuallay updates at 02:00am (GMT+2)
# Possibily, version of Python's interpreter has to be adjusted (in this case 'python3.8')

#example call for nefertiti bot
./nefertiti buy --exchange=[EXCHANGE] --api-key=[API_KEY] --api-secret=[API_SECRECT] --market=all --quote=USDT --volume=10 --price=5 --top=1 --dip=$DIP --repeat=1

#example call of the script using PM2. Restart the script every day at 5 am according to time you have set in your system
pm2 start "[YOUR_SCRIPT].sh" --cron-restart="0 5 * * *"
