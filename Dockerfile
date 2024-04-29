FROM eclipse-temurin:17-jre-alpine

RUN mkdir -p /maku-generator

WORKDIR /maku-generator

ARG JAR_FILE=./maku-generator-server/target/*.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8088

ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms128m -Xmx512m -Djava.security.egd=file:/dev/./urandom"
CMD java -jar app.jar $JAVA_OPTS


#执行 docker build -t zerfa/maku-generator:3.0.2 .
# docker build --no-cache -t registry.cn-hangzhou.aliyuncs.com/zef-docker/maku-generator:3.1.0 .