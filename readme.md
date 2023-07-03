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
