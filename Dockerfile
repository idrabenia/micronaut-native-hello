FROM oracle/graalvm-ce:19.2.0 as graalvm
COPY . /home/app/micronaut-hello-native1
WORKDIR /home/app/micronaut-hello-native1
ENV JAVA_OPTIONS "-Xms1g -Xmx16g"
RUN gu install native-image
RUN native-image -J-Xmx4g --no-server  -cp build/libs/micronaut-hello-native1-0.1-all.jar

FROM frolvlad/alpine-glibc
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-hello-native1 .
ENTRYPOINT ["./micronaut-hello-native1"]
