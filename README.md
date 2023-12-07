# WebEngLabor

# Docker
## Voraussetzungen

Es muss Docker Desktop installiert und am laufen sein

## Dockerfile
Das Dockerfile ist für die Erstellung des Docker Images Notwendig. In diesem wird zum einen Definiert welches Base Image für den Docker Container verwendet werden soll und welche Dateien auf das Image Copiert werden sollen. Außerdem können zusätzlich noch Commands aufgerufen und Port freigegeben werden. 

Unser Dockerfile sieht wie folgt aus:

```yaml
FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
```

Gespeichert wird das in einer Datei Namens "Dockerfile"

Es wird als Base Image ein Image genommen welches bereits einen Webserver laufen lässt und diesen auf dem Port 80 bereitstellt, wesegen der Port 80 nicht mehr freigegeben werden muss. Anschließend werden die Benötigten Dateien in den html Ordner kopiert, da der Webserver in diesem Ordner nach den Dateien sucht.

## DockerImage

Nach dem das Dockerfile erstellt wurde, muss dieses zu einem Image gebaut werden. Dies geschieht mit dem folgenden Comand:

```
docker build -t webserver:latest .
```

webserver ist hierbei der Name des Images

## DockerImage Speichern und Laden
 Das erstellte DockerImage kann mit dem Comand

```
docker save -o webserver-image.tar webserver
```
gespeichert werden und an andere weitergeben werden.

Geladen wird das Image mit

```
docker load -i webserver-image.tar webserver
```

## DockerImage in Repo hochladen

Damit andere Anwendungen mit dem Image arbeiten können muss das Image in einem DockerRepo bereitgestellt werden

### Lokales Repo

Wenn das Image nicht in ein online Repo hochgeladen werden soll kann mit dem Folgenden Coand ein Lokales Repo erstellt werden

```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

Anschließend muss das Image auf das Repo gepushed werden 

```
docker webserver:latest localhost:5000/webserver:latest
```
und 
```
docker push localhost:5000/webserver:latest
```
Ob das image nun bereitgestellt wird kann mit
```
curl http://localhost:5000/v2/_catalog
```
überprüft werden.

### Alternativ Dockerhub
Alternativ kann das Docker Image auch auf Dockerhub hochgeladen werden.

Das Image muss nun mit dem folgenden Comand neu gebaut werden
```
docker build -t deinbenutzername/webserver:latest .
```

```
docker tag deinbenutzername/webserver:latest deinbenutzername/webserver:latest
```

```
docker login
```

```
docker push deinbenutzername/webserver:latest
```

## Docker Image Starten
Das Gebaute Docker Image kann nun mit

```
docker run -p 80:80 --name webser deinbenutzername/webserver:latest
```

gestartet werden.