FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY gradle/ gradle
COPY gradlew build.gradle ./

RUN ./gradlew build --refresh-dependencies

# TODO https://stackoverflow.com/questions/42292444/how-do-i-add-a-ca-root-certificate-inside-a-docker-image, https://www.dotcms.com/docs/latest/how-to-modify-java-keystore-in-docker

COPY src ./src

CMD ["./gradlew", "bootRun"]