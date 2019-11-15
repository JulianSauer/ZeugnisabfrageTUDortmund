# ZeugnisabfrageTUDortmund
Skript, das abfragt, ob ein Zeugnis im [Dekanat für Informatik](http://www.cs.tu-dortmund.de/nps/de/Studium/Zeugnisse/index.html) abholbereit ist. Das Docker Image enthält einen Cronjob, der alle 24 Stunden ausgeführt wird und bei vorliegendem Zeugnis eine Nachricht über Telegram verschickt.

## Docker Container
```
docker run -it -e ABSCHLUSS=<abschluss> -e MATRIKELNUMMER=<matrikelnummer> -e TELEGRAM_TOKEN=<telegram-token> -e TELEGRAM_CHAT_ID=<telegram-chat-id> docker.pkg.github.com/juliansauer/zeugnisabfragetudortmund/zeugnisabfragetudortmund:latest
```

Gültige Werte für `<abschluss>` sind `BA` oder `MA`. `<telegram-token>` ist das Bot Token und `<telegram-chat-id>` verweist auf den Chat, in dem die Benachrichtigung eingehen soll, wenn das Zeugnis abholbereit ist.

## Telegram Bot erstellen
Siehe [Telegram Botfather](https://core.telegram.org/bots#6-botfather) zum Erstellen eines Bots. Anschließend kann der Bot mit `/start` unter `tg://resolve?domain=<bot-name>` gestartet werden. Die Chat ID kann unter `https://api.telegram.org/bot<telegram-token>/getUpdates` ausgelesen werden.

## Docker-Compose
Nachdem die Enviroment Variablen angepasst wurden: `docker-compose up -d`
