FROM openjdk:10-jdk-slim as packager

RUN /docker-java-home/bin/jlink \
    --module-path /docker-java-home/jmods \
    --verbose \
    --add-modules java.sql,java.naming,java.management,java.instrument,java.security.jgss,java.xml.bind \
    --compress 2 \
    --no-header-files \
    --output /opt/jdk-10-minimal

FROM ubuntu:latest
COPY --from=packager /opt/jdk-10-minimal /opt/jdk-10-minimal

ENV JAVA_HOME=/opt/jdk-10-minimal
ENV PATH="$PATH:$JAVA_HOME/bin"

ADD target/modulos-exec.jar app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["/opt/jdk-10-minimal/bin/java","-jar","app.jar"]