# DOCKER - CONTAINER APPLICATION

### What is Docker?
- Docker is a tool that allows developers, sys-admins etc. to easily deploy their applications in a sandbox (called containers) to run on the host operating system i.e. Linux.
- Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.

Docker : An isolated env for apps.
Virtual Machines : An abstraction of a machine

<img width="839" alt="1" src="https://github.com/Bskasan/Docker_Learn_CW/assets/53233822/a9b75726-d13c-4a53-92f7-7ba574c83a60">

<img width="808" alt="1" src="https://github.com/Bskasan/Docker_Learn_CW/assets/53233822/ef1806fa-1933-4804-8101-52c61809cdd1">

### Docker File
- Docker File is a text document that contains all the commands a user could call on the command line to assemble an image. Using Docker build, users can create an automated build that executes several command-line instructions in succession. Docker can build images automatically by reading the instructions from Docker File.

DOCKER FILE ----> docker build ----> DOCKER IMAGE ---> docker run ---> DOCKER CONTAINER

### INSTALLATION

https://www.docker.com/

--> Make Sure Your BIOS Settings Done!!!

### Server Systems

* Physical Servers (BareMetal Servers):
    * Bilgisayar -> Yüksek donanım, özel işlemciler, özel işletim sistemleri.
    * Kurulum: zor
    * VeriTaşıma: zor
    * Maliyet: yüksek
    * Dedicated Servers
    * Barındırma -> Datecenter

* Virtual Servers (VMs: Virtual Machines):
    * Bir fiziksel makina içinde çok sanal makina.
    * Kurulum: orta (iso image)
    * VeriTaşıma: orta
    * Maliyet: orta
    * Bir makiaden diğer makinaya geçiş zorluğu.
    * Hypervisor yazılımları -> vmware.com
    * VPS (Virtual Private Server), VDS (Virtual Dedicated Server)

* Containers:
    * Bir fiziksel/sanal makina içinde çok konteyner.
    * Kurulum: kolay (docker image)
    * VeriTaşıma: kolay
    * Maliyet: düşük
    * Tüm konteynerları aynı ortamdan yönetebilme.
    * Microservice mimarisi.
    * Container yazılımları -> docker.com

## Temel Bilgiler

* IP ve Port mantığı
* Default portlar 80 443 -> https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
* http -> 80 * http://clarusway.com == http://clarusway.com:80
* https -> 443 * https://clarusway.com == https://clarusway.com:443 (need SSL)

---

# Docker

## Yüklemeler:

* Docker Desktop -> https://www.docker.com/products/docker-desktop/
    * Windows ve Macos için setup dosyası mevcut.
    * Linux sistemlere CLI üzerinden kurulum yapılabilir. -> https://docs.docker.com/desktop/install/linux-install/

* Docker Hub -> https://hub.docker.com

* VSCode Docker Extension -> https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker

## .dockerignore

```dockerignore

*.pyc
*.pyo
*.mo
*.db
*.css.map
*.egg-info
*.sql.gz
.cache
.project
.idea
.pydevproject
.idea/workspace.xml
.DS_Store
.git/
.sass-cache
.vagrant/
__pycache__
dist
docs
env/
logs
src/{{ project_name }}/settings/local.py
src/node_modules
web/media
web/static/CACHE
stats
Dockerfile
Footer
node_modules/
npm-debug.log

```

## DOCKERFILE
* https://docs.docker.com/engine/reference/builder/
* create file, named "dockerfile" (no extension)

backend/dockerfile:

```dockerfile

# Python:
# last version:
# FROM python
# light version
FROM python:3.10.8-slim-bullseye
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set main folder in docker:
WORKDIR /backend

# Copy file from local to docker:
COPY requirements.txt /backend/requirements.txt

# Run shell-command in docker before build:
RUN pip install -r requirements.txt --no-cache-dir

# copy all from local-files (.) to docker (/backend):
COPY . /backend

# Run shell-script:
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# App Port (optional)
EXPOSE 8000

# $ cd /backend
# $ docker build -t backend .
# $ docker run -d -p 8000:8000 --name backend backend
# Browser: http://localhost:8000


```

frontend/dockerfile:

```dockerfile

# NodeJS
FROM node:19-slim

# Set main folder in docker:
WORKDIR /frontend
# Copy file local to docker:
COPY package.json /frontend/package.json

# Run shell-command in docker before build:
RUN npm install

# copy all local-files (.) to docker (/frontend):
COPY . /frontend

# Run shell-script:
CMD ["npm", "start"]
# App Port (optional)
EXPOSE 3000

# $ cd /frontend
# $ docker build -t frontend .
# $ docker run -d -p 3000:3000 --name frontend frontend
# Browser: http://localhost:3000

```


## Komutlar:
* https://docs.docker.com/get-started/docker_cheatsheet.pdf

```sh

    $ docker --version # Check version
    $ docker version # Check version with details 
    $ docker info # Check info
    $ docker help # Run help and see all commands
    $ docker <command> --help # Run help for any command.
    $ docker system prune -a # Stop and delete passive containers/images/caches.

    # ! It can write image_id instead of image_name.
    # ! It can write container_id instead of container_name.

    # Build Files to Image:
    $ docker build -t <image_name> <folder_name> # Create images from dockerfile.
    $ docker build -t <user_name>/<image_name> .
    
    # Run Image to Container: (allways, image_name must be on the end):
    $ docker run -d -p <ext_port_number>:<int_port_number> <image_name> # run with external/internal port
    $ docker run -d --name <container_name> <image_name> # run and set container name
    $ docker run -d -p <ext_port_number>:<int_port_number> --name <container_name> <image_name>

    # IMAGES:
    $ docker images # List local images.
    $ docker rmi <image_name> # Delete image.

    # CONTAINERS:
    $ docker ps # List active containers.
    $ docker ps -a # docker ps --all # List all containers.
    $ docker start|stop <container_name> # Start/Stop container.
    $ docker rm <container_name> # Delete stopped container.

    # DOCKERHUB:
    $ docker login # Login auto (get user-info from docker-desktop)
    $ docker login -u <user_name> # Login manual
    $ docker tag <image_name> <user_name>/<image_name>[:tag] # Connect repo and set tag
    $ docker push <user_name>/<image_name>[:tag] # PUSH
    $ docker pull <image_name> # PULL
    $ docker search <image_name> # Search

```
---

# Docker Compose

Docker Compose is a tool that was developed to help define and share multi-container applications. With Compose, we can create a YAML file to define the services and with a single command, can spin everything up or tear it all down.

The big advantage of using Compose is you can define your application stack in a file, keep it at the root of your project repo (it’s now version controlled), and easily enable someone else to contribute to your project. Someone would only need to clone your repo and start the compose app. In fact, you might see quite a few projects on GitHub/GitLab doing exactly this now.

* https://docs.docker.com/compose/compose-file/

/docker-compose.yml:

```yml

version: "3.9" # opsiyonel.

services:

  frontend:
    # container_name: frontend # (default:key)
    image: "docker-compose-frontend" # image_name
    build: ./frontend # Dockerize edilecek klasör (dockerfile)
    ports: # dış/iç port numaraları
      - 3000:3000
      - 80:3000
    restart: on-failure # hata anında tekrar çalıştır.
    depends_on: # önce aşağıdakileri çalıştır.
      - backend # aşağıda tanımlandı.

  backend:
    # container_name: backend # (default:key)
    image: "docker-compose-backend" # image_name
    build: ./backend # Dockerize edilecek klasör (dockerfile)
    ports: # dış/iç port numaraları
      - 8000:8000
    restart: on-failure # hata anında tekrar çalıştır.
    volumes: # fiziksel yollar (external:internal)
      - $PWD/db.sqlite3:/backend/db.sqlite3

````

```sh

# $ docker compose up # compose çalıştır.
# $ docker compose up -d --build # compose daemon aç ve tekrar build et.
# $ docker compose down # compose kapat.
# $ docker compose down -v # compose tümünü kapat.

```

---

### Bonus: SuperMario:

```sh

    $ docker run -d -p 8600:8080 bharathshetty4/supermario
    # open http://localhost:8600z

```