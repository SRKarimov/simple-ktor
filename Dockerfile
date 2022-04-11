ARG VERSION=11

FROM openjdk:${VERSION}-jdk as BUILD

COPY . /src
WORKDIR /src
RUN ./gradle --no-daemon install

FROM openjdk:${VERSION}-jre

COPY --from=BUILD /src/build/libs/simple-ktor*.jar /bin/runner/simple-ktor.jar
WORKDIR /bin/runner

CMD ["java","-jar","simple-ktor.jar"]