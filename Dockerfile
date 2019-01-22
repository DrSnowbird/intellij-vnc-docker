FROM openkbs/jdk-mvn-py3-vnc

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

ARG INTELLIJ_VERSION=${INTELLIJ_VERSION:-ideaIC-2018.3.3}
ENV INTELLIJ_VERSION=${INTELLIJ_VERSION}

ARG IDEA_PRODUCT_NAME=${IDEA_PRODUCT_NAME:-IdeaIC2018}
ENV IDEA_PRODUCT_NAME=${IDEA_PRODUCT_NAME}

ARG IDEA_PRODUCT_VERSION=${IDEA_PRODUCT_VERSION:-3}
ENV IDEA_PRODUCT_VERSION=${IDEA_PRODUCT_VERSION}

## -- derived vars ---
ENV IDEA_INSTALL_DIR="${IDEA_PRODUCT_NAME}.${IDEA_PRODUCT_VERSION}"
ENV IDEA_CONFIG_DIR=".${IDEA_PRODUCT_NAME}.${IDEA_PRODUCT_VERSION}"
ENV IDEA_PROJECT_DIR="IdeaProjects"

#ENV SCALA_VERSION=2.12.4
#ENV SBT_VERSION=1.0.4

## ---- USER_NAME is defined in parent image: 
## ---- openkbs/jre-mvn-py3-x11 already ----
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}
    
#########################################################
#### ---- Install Scala (included in Intellj already)----
#########################################################
#### ---- Universal tar.gz to install ----
# ENV SCALA_INSTALL_BASE=/usr/local
# WORKDIR ${SCALA_INSTALL_BASE}
# # https://downloads.lightbend.com/scala/2.12.3/scala-2.12.3.tgz
# # RUN wget -c https://downloads.lightbend.com/scala/2.12.3/scala-2.12.3.tgz && \
# RUN wget -c https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz && \
#     tar xvf scala-${SCALA_VERSION}.tgz && \
#     rm scala-${SCALA_VERSION}.tgz && \
#     ls /usr/local && \
#     echo "#!/bin/bash" > /etc/profile.d/scala.sh && \
#     echo "export SCALA_VERSION=${SCALA_VERSION}" >> /etc/profile.d/scala.sh && \
#     echo "export SCALA_HOME=${SCALA_INSTALL_BASE}/scala-${SCALA_VERSION}" >> /etc/profile.d/scala.sh && \
#     echo "export PATH=${SCALA_INSTALL_BASE}/scala-${SCALA_VERSION}/bin:$PATH" >> /etc/profile.d/scala.sh && \
#     echo "export CLASSPATH=\${SCALA_HOME}/lib:\$CLASSPATH" >> /etc/profile.d/scala.sh

#### ---- Debian package to install ----
#ENV SCALA_INSTALL_BASE=/usr/lib
#WORKDIR ${SCALA_INSTALL_BASE}
#RUN wget -c https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.deb && \
#    sudo apt-get install -y scala-${SCALA_VERSION}.deb && \
#    rm scala-${SCALA_VERSION}.deb && \
#    ls ${SCALA_INSTALL_BASE} && \
#    echo "#!/bin/bash" > /etc/profile.d/scala.sh && \
#    echo "export SCALA_VERSION=${SCALA_VERSION}" >> /etc/profile.d/scala.sh
#    echo "export SCALA_HOME=/usr/lib/scala-${SCALA_VERSION}" >> /etc/profile.d/scala.sh
#    echo "export PATH=${SCALA_INSTALL_BASE}/scala-${SCALA_VERSION}/bin:$PATH" >> /etc/profile.d/scala.sh
#    echo "export CLASSPATH=\$SCALA_HOME/bin:\$CLASSPATH" >> /etc/profile.d/scala.sh

##########################
#### ---- Install sbt ----
##########################
# https://github.com/sbt/sbt/releases/download/v1.0.4/sbt-1.0.4.tgz
# WORKDIR /tmp
# RUN apt-get install -y apt-transport-https ca-certificates libcurl3-gnutls && \
#     echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
#     apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
#     apt-get update && \
#     apt-get install -y sbt
    
#########################################################
#### ---- Install IntelliJ IDE : MODIFY two lines below ----
#########################################################

USER ${USER_NAME}

WORKDIR ${HOME}

# https://download.jetbrains.com/idea/ideaIC-2018.3.3-no-jdk.tar.gz
ARG INTELLIJ_IDE_TAR=${INTELLIJ_VERSION}-no-jdk.tar.gz
ARG INTELLIJ_IDE_DOWNLOAD_FOLDER=idea

## -- (Release build) --
RUN wget https://download.jetbrains.com/${INTELLIJ_IDE_DOWNLOAD_FOLDER}/${INTELLIJ_IDE_TAR} && \
    tar xvf ${INTELLIJ_IDE_TAR} && \
    mv idea-IC-* ${IDEA_INSTALL_DIR}  && \
    rm ${INTELLIJ_IDE_TAR}

## -- (Key Chain lib Intellij IDE complains needing this) --
#RUN sudo apt-get install libsecret-1-0 gnome-keyring -y

## -- (Local build) --
#COPY ${INTELLIJ_IDE_TAR} ./
#RUN tar xvf ${INTELLIJ_IDE_TAR} && \
#    mv idea-IC-* ${IDEA_INSTALL_DIR}  && \
#    rm ${INTELLIJ_IDE_TAR}
    
RUN mkdir -p \
    ${HOME}/${IDEA_PROJECT_DIR} \
    ${HOME}/${IDEA_CONFIG_DIR} 
    #chown -R ${USER_NAME}:${USER_NAME} ${HOME}

VOLUME ${HOME}/${IDEA_PROJECT_DIR}
VOLUME ${HOME}/${IDEA_CONFIG_DIR}

CMD "${HOME}/${IDEA_INSTALL_DIR}/bin/idea.sh"

ENV PRODUCT_EXE="${HOME}/${IDEA_INSTALL_DIR}/bin/idea.sh"

COPY ./wrapper_process.sh ${HOME}/

##################################
#### VNC ####
##################################
WORKDIR ${HOME}

USER ${USER}

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]

##################################
#### IntelliJ ####
##################################
WORKDIR ${WORKSPACE}

CMD "${HOME}/${IDEA_INSTALL_DIR}/bin/idea.sh"

