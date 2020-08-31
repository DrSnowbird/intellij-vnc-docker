# IntelliJ in VNC / noVNC for Container Platform (Openshift, Kubernetes, DC/OS, Mesosphere, etc) 
[![](https://images.microbadger.com/badges/image/openkbs/intellij-vnc-docker.svg)](https://microbadger.com/images/openkbs/intellij-vnc-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/intellij-vnc-docker.svg)](https://microbadger.com/images/openkbs/intellij-vnc-docker "Get your own version badge on microbadger.com")

* IntelliJ Docker in VNC/noVNC + Java 8 OpenJDK + Maven 3.6 + Python 3.6 + PIP3 20 + + npm 3.5.2 + nodejs v4.2.6 + Gradle 5.1

# License Agreement
By using this image, you agree the [Oracle Java JDK License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).
This image contains [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html). You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

# Components
* IntelliJ Docker: IdeaIC2020
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

## Mobile devices and Desktop PC supported / tested:
* SmartPhones: tested ok! iPhone5 Safari works though phone screen size being too small vs the desired HD 1920x1080. It should work across all the smartphones with HTML5-capable brwosers. Hence, to access with small phone screen, run with VNC_RESOLUTION=800x600 (or adjust it to fit your phone's screen size)
* Tablets: tested ok! Amazon Fire with noVNC works!. It should work across all the tablets with HTML5-capable brwosers.
![IntelliJ on Amazon Fire tablet](doc/intellij-vnc-docker-on-Amazon-Fire-tablet.jpeg).
* Desktop PC or MacBook: tested ok! It should work across all PCs Desktop with HTML5-capable brwosers. ![IntelliJ on Desktop PC Browser](doc/intellij-vnc-docker-on-Desktop-PC-Browser.png)

## Connect to VNC Viewer/Client or noVNC (Browser-based VNC)
* connect via VNC viewer localhost:5901, default password: vncpassword
* connect via noVNC HTML5 full client: http://localhost:6901/vnc.html, default password: vncpassword
* connect via noVNC HTML5 lite client: http://localhost:6901/?password=vncpassword

Once it is up, the default password is "vncpassword" to access with your web browser:
```
http://<ip_address>:6901/vnc.html,
e.g.
=> Standalone Docker: http://localhost:6901/vnc.html
=> Openshift Container Platform: http://<route-from-openshift>/vnc.html
=> similarly for Kubernetes Container Platform: (similar to the Openshift above!)
```
# Run - Override VNC environment variables 
The following VNC environment variables can be overwritten at the docker run phase to customize your desktop environment inside the container. You can change those variables using configurations CLI or Web-GUI with OpenShift, Kubernetes, DC/OS, etc.
```
VNC_COL_DEPTH, default is 24 , e.g., change to 16,
    -e VNC_COL_DEPTH=16
VNC_RESOLUTION, default: 1920x1080 , e.g., change to 800x600
    -e VNC_RESOLUTION=1280x1024
VNC_PW, default: vncpassword , e.g., change to MySpecial!(Password%)
    -e VNC_PW=MySpecial!(Password%)
```
# Screen (Desktop) Resolution
Two ways to change Screen resolutions.

## 1.) Modify ./run.sh file
```
#VNC_RESOLUTION=1280x1024
VNC_RESOLUTION=1920x1080
```

## 2.) Customize Openshift or Kubernetes container run envionrment
```
Set up, say, VNC_RESOLUTION with value 1920x1280
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
developer@c493e6b80032:~/workspace$ /usr/scripts/printVersions.sh 
+ echo JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
+ whereis java
java: /usr/bin/java /usr/share/java /usr/lib/jvm/java-8-openjdk-amd64/bin/java /usr/share/man/man1/java.1.gz
+ echo

+ java -version
openjdk version "1.8.0_252"
OpenJDK Runtime Environment (build 1.8.0_252-8u252-b09-1~18.04-b09)
OpenJDK 64-Bit Server VM (build 25.252-b09, mixed mode)
+ mvn --version
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /usr/apache-maven-3.6.3
Java version: 1.8.0_252, vendor: Private Build, runtime: /usr/lib/jvm/java-8-openjdk-amd64/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "5.4.0-42-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.17
+ python3 -V
Python 3.6.9
+ pip --version
pip 20.1.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ pip3 --version
pip 20.1.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ gradle --version

Welcome to Gradle 6.0.1!

Here are the highlights of this release:
 - Substantial improvements in dependency management, including
   - Publishing Gradle Module Metadata in addition to pom.xml
   - Advanced control of transitive versions
   - Support for optional features and dependencies
   - Rules to tweak published metadata
 - Support for Java 13
 - Faster incremental Java and Groovy compilation
 - New Zinc compiler for Scala
 - VS2019 support
 - Support for Gradle Enterprise plugin 3.0

For more details see https://docs.gradle.org/6.0.1/release-notes.html


------------------------------------------------------------
Gradle 6.0.1
------------------------------------------------------------

Build time:   2019-11-18 20:25:01 UTC
Revision:     fad121066a68c4701acd362daf4287a7c309a0f5

Kotlin:       1.3.50
Groovy:       2.5.8
Ant:          Apache Ant(TM) version 1.10.7 compiled on September 1 2019
JVM:          1.8.0_252 (Private Build 25.252-b09)
OS:           Linux 5.4.0-42-generic amd64

+ npm -v
6.14.6
+ node -v
v14.6.0
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.4 LTS"
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```
