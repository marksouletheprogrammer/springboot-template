#!/bin/sh

echo ${JAVA_OPTS}
echo "Starting application"

exec java ${JAVA_OPTS} -jar /app/demoapp.jar
