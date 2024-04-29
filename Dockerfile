FROM eclipse-temurin:17-jre-alpine

RUN mkdir -p /maku-generator

WORKDIR /maku-generator

ARG JAR_FILE=./maku-generator-server/target/*.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8088

ENV TZ=Asia/Shanghai \
    JVM_OPTS="-Xmx256m -Djava.security.egd=file:/dev/./urandom" \
    driver_class_name="" \
    url="" \
    username="" \
    password=""
CMD java $JAVA_OPTS -jar app.jar --spring.datasource.driver-class-name=$driver_class_name --spring.datasource.url=$url --spring.datasource.username=$username --spring.datasource.password=$password


#执行 docker build --no-cache -t zerfa/maku-generator:3.1.0 .
# docker build --no-cache -t registry.cn-hangzhou.aliyuncs.com/zef-docker/maku-generator:3.1.0 .