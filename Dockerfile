FROM java:8 

WORKDIR /code

# Prepare by downloading dependencies
ADD . /code
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]
RUN ["mvn", "package"]

EXPOSE 4567

CMD ["java", "-jar", "target/dockerexample.jar"]