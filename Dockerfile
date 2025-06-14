ARG IPT_VERSION
FROM gbif/ipt:${IPT_VERSION} AS official

FROM tomcat:9.0-jdk17@sha256:fa2c0aac08e58970cc2d49afa43135a9b22174c9e9d62b11769734e4f3691be5

MAINTAINER Matthew Blissett <mblissett@gbif.org>
MAINTAINER Petr Novotný <novotp@natur.cuni.cz>

# Argument for IPT name
ARG IPT_NAME=ROOT

ENV IPT_DATA_DIR=/srv/ipt
ENV TOMCAT_GROUP=tomcat
ENV TOMCAT_USER=tomcat

# Create user and group
RUN groupadd -r $TOMCAT_GROUP && useradd -r -g $TOMCAT_GROUP -m $TOMCAT_USER

# Set ownership of the directories to tomcat user
RUN chown -R $TOMCAT_GROUP:$TOMCAT_USER /usr/local/tomcat && \
    chmod -R 755 /usr/local/tomcat

# Expose IPT data volume
RUN mkdir -p $IPT_DATA_DIR \
      && chown -R $TOMCAT_GROUP:$TOMCAT_USER $IPT_DATA_DIR
VOLUME $IPT_DATA_DIR

# Copy the built WAR file to Tomcat webapps directory
COPY --from=official --chown=$TOMCAT_GROUP:$TOMCAT_USER /usr/local/tomcat/webapps/${IPT_NAME} /usr/local/tomcat/webapps/${IPT_NAME}

# Modify maxParameterCount in server.xml
RUN sed -i 's/maxParameterCount="1000"/maxParameterCount="10000"/g' /usr/local/tomcat/conf/server.xml

# Switch to tomcat user for running the container
USER $TOMCAT_USER

EXPOSE 8080
CMD ["catalina.sh", "run"]