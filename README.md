## Test java project :

./mvnw package
java -jar target/*.jar

docker buildx build --platform linux/amd64, linux/arm64 -t spring-helloworld .