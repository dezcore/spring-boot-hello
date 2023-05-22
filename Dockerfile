FROM eclipse-temurin:17-jdk-jammy as builder
WORKDIR /opt/app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY ./src ./src
RUN ./mvnw clean install

FROM builder as dev
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=dev"]

FROM eclipse-temurin:17-jre-jammy
WORKDIR /opt/app
EXPOSE 8080
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/opt/app/*.jar" ]

#CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=dev"]

#FROM eclipse-temurin:17-jdk-jammy
#RUN addgroup demogroup; adduser  --ingroup demogroup --disabled-password demo
#USER demo
#WORKDIR /app
#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./
#RUN ./mvnw dependency:go-offline
#COPY src ./src
#CMD ["./mvnw", "spring-boot:run"]

#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "/app.jar"]