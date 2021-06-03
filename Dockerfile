#基础镜像选择alpine 小巧安全流行方便
FROM exxk/java:8-alpine-cst
#复制固定路径下打包好的jar包(target/*.jar)并重命名到容器跟目录(/app.jar)，或ADD
RUN apk --no-cache wget && wget --no-check-certificate --content-disposition -q -O /app.jar https://github.com/alibaba/Sentinel/releases/download/1.8.1/sentinel-dashboard-1.8.1.jar
#健康检查 -s 静默模式，不下载文件
#HEALTHCHECK CMD wget -s http://127.0.0.1:14030/actuator/health || exit 1
#启动容器执行的命令 java -jar app.jar ,如果加其他参数加 ,"-参数",
CMD ["java","-jar","app.jar"]
