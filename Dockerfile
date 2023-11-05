FROM openjdk:17-alpine
EXPOSE 8080
ADD target/springboot-jenkins.jar springboot-jenkins.jar

ENTRYPOINT ["java", "-jar", "/springboot-jenkins.jar"]