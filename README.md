# IntelliJ in VNC / noVNC for Container Platform (Openshift, Kubernetes, DC/OS, Mesosphere, etc) 
[![](https://images.microbadger.com/badges/image/openkbs/intellij-vnc-docker.svg)](https://microbadger.com/images/openkbs/intellij-vnc-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/intellij-vnc-docker.svg)](https://microbadger.com/images/openkbs/intellij-vnc-docker "Get your own version badge on microbadger.com")

* IntelliJ Docker in VNC/noVNC + Java 8 (1.8.0_201) JDK + Maven 3.6 + Python 3.5 + PIP3 18.1 + + npm 3.5.2 + nodejs v4.2.6 + Gradle 5.1

# License Agreement
By using this image, you agree the [Oracle Java JDK License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).
This image contains [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html). You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

# Components
* IntelliJ Docker
* java version "1.8.0_201"
  Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
  Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
* Apache Maven 3.6.0
* Python 3.5.2
* npm 3.5.2 + nodejs v4.2.6
* Gradle 5.1
* VNC/noVNC for remote Desktop over Container Platform (Openshift, Kubernetes, etc.)
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 

# Run (recommended for easy-start)
* Once the above build is done, you can run IntelliJ now using the command below.
```
./run.sh
```

# Build
* (Note: this image will be 5.1 GB - huge!)
* Once you have the above two files, you can build the image. 
* During the build, it will install IntelliJ -- this might take about 15 ~ 20 minutes
```
./build.sh
```

# Configurations (Optional)
If you run "./run.sh" instead of "docker-compose up", you don't have to do anything as below.

* The container uses a default "/workspace" folder. 
* The script "./run.sh" will re-use or create the local folder in your $HOME directory with the path below to map into the docker's internal "/workspace" folder.
```
$HOME/data_docker/intellij-vnc-docker/workspace
```
The above configuration will ensure all your projects created in the container's "/workspace" being "persistent" in your local folder, "$HOME/data_docker/intellij-vnc-docker/workspace", for your repetitive restart docker container.

# See Also - IntelliJ Platform 7 in two flavors X11 and VNC/noVNC
* [openkbs/intellij-docker for Standalone Docker](https://hub.docker.com/r/openkbs/intellij-docker/)
* [openkbs/intellij-vnc-docker for OpenShift, Kubernetes, Mesophere, DC/OS](https://hub.docker.com/r/openkbs/intellij-vnc-docker/)

# See Also - Other docker-based IDE
* [openkbs/docker-atom-editor](https://hub.docker.com/r/openkbs/docker-atom-editor/)
* [openkbs/eclipse-photon-docker](https://hub.docker.com/r/openkbs/eclipse-photon-docker/)
* [openkbs/eclipse-photon-vnc-docker](https://hub.docker.com/r/openkbs/eclipse-photon-vnc-docker/)
* [openkbs/eclipse-oxygen-docker](https://hub.docker.com/r/openkbs/eclipse-oxygen-docker/)
* [openkbs/intellj-docker](https://hub.docker.com/r/openkbs/intellij-docker/)
* [openkbs/intellj-vnc-docker](https://hub.docker.com/r/openkbs/intellij-vnc-docker/)
* [drsnowbird/denodo-docker](https://hub.docker.com/r/openkbs/denodo-docker/)
* [drsnowbird/denodo-vnc-docker](https://hub.docker.com/r/openkbs/denodo-vnc-docker/)
* [openkbs/knime-vnc-docker](https://hub.docker.com/r/openkbs/knime-vnc-docker/)
* [openkbs/netbeans10-docker](https://hub.docker.com/r/openkbs/netbeans10-docker/)
* [openkbs/netbeans](https://hub.docker.com/r/openkbs/netbeans/)
* [openkbs/papyrus-sysml-docker](https://hub.docker.com/r/openkbs/papyrus-sysml-docker/)
* [openkbs/pycharm-docker](https://hub.docker.com/r/openkbs/pycharm-docker/)
* [openkbs/scala-ide-docker](https://hub.docker.com/r/openkbs/scala-ide-docker/)
* [openkbs/sublime-docker](https://hub.docker.com/r/openkbs/sublime-docker/)
* [openkbs/webstorm-docker](https://hub.docker.com/r/openkbs/webstorm-docker/)
* [openkbs/webstorm-vnc-docker](https://hub.docker.com/r/openkbs/webstorm-vnc-docker/)

# Other Resources
* [Talend - Data Integration Platform](https://www.talend.com/)
* [JBoss Tools Integration Stacks 4.6.0.Final](https://tools.jboss.org/downloads/jbosstools_is/photon/4.6.0.Final.html#update_site)
* [Containerize Teiid linked with MariaDB](https://developer.jboss.org/wiki/QuickstartExampleWithDockerizedTeiid)
* [Teiid Downloads](http://teiid.jboss.org/downloads/)
* [Teiid Designer 11.1 with Eclipse Oxygen](http://teiiddesigner.jboss.org/designer_summary/downloads.html)
* [Teiid Cloud - Data Virtualization Services](http://teiid.io/teiid_cloud/)
* [Deploying Teiid VDB](http://teiid.github.io/teiid-documents/master/content/admin/Deploying_VDBs.html)
* [JBoss Tools Integration Stack 4.6.0.Final](https://tools.jboss.org/downloads/jbosstools_is/photon/4.6.0.Final.html)

# Releases information
```
root@c3fd448b277c:/usr# ./printVersions.sh 
+ echo JAVA_HOME=/usr/java
JAVA_HOME=/usr/java
+ java -version
java version "1.8.0_201"
Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
+ mvn --version
Apache Maven 3.6.0 (97c98ec64a1fdfee7767ce5ffb20918da4f719f3; 2018-10-24T18:41:47Z)
Maven home: /usr/apache-maven-3.6.0
Java version: 1.8.0_201, vendor: Oracle Corporation, runtime: /usr/jdk1.8.0_201/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "4.15.0-43-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.12
+ python3 -V
Python 3.5.2
+ pip --version
pip 18.1 from /usr/local/lib/python3.5/dist-packages/pip (python 3.5)
+ pip3 --version
pip 18.1 from /usr/local/lib/python3.5/dist-packages/pip (python 3.5)
+ gradle --version

------------------------------------------------------------
Gradle 5.1.1
------------------------------------------------------------

Build time:   2019-01-10 23:05:02 UTC
Revision:     3c9abb645fb83932c44e8610642393ad62116807

Kotlin DSL:   1.1.1
Kotlin:       1.3.11
Groovy:       2.5.4
Ant:          Apache Ant(TM) version 1.9.13 compiled on July 10 2018
JVM:          1.8.0_201 (Oracle Corporation 25.201-b09)
OS:           Linux 4.15.0-43-generic amd64

+ npm --version
3.5.2
+ nodejs --version
v4.2.6
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.3 LTS"
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial
```
