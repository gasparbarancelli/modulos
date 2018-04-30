#!/usr/bin/env bash

export CURRENT=.

/home/gaspar/jdk-10/bin/jlink --module-path /home/gaspar/jdk-10/jmods \
    --verbose --add-modules java.sql,java.naming,java.management,java.instrument,java.security.jgss,java.xml.bind \
    --compress 2 --no-header-files \
    --output target/jdk-10-minimal --no-man-pages

./target/jdk-10-minimal/bin/java -jar $CURRENT/target/modulos-exec.jar