#!/bin/sh

RESPONSE=$(http -h --ignore-stdin http://dekanat.cs.uni-dortmund.de/web/de/cgi-bin/zquery$1.cgi matrikel=$2 | grep Location | awk '{print $2}' | tr -d '[:space:]')
NOT_FOUND=http://www.cs.uni-dortmund.de/nps/de/Studium/Zeugnisse/Zeugnis_Nicht_Vorhanden/index.html

if [ "$RESPONSE" != "$NOT_FOUND" ]
then
	echo "Zeugnis ist zur Abholung bereit"
	http https://api.telegram.org/bot$3/sendMessage chat_id==$4 text=="Zeugnis ist zur Abholung bereit"
fi
