#!/bin/bash

if [ -d "env" ] 
then
    echo "Python virtual environment exists." 
else
    sudo python3 -m venv env
fi

echo "$USER"
echo $PWD
. env/bin/activate

if [[ "$VIRTUAL_ENV" != "" ]]
then
  echo "working"
else
  echo "not working"
fi

sudo pip3 install -r requirements.txt

if [ -d "logs" ] 
then
    echo "Log folder exists." 
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

sudo chmod -R 777 logs
echo "envsetup completed."