FROM oracle/graalvm-ce:20.0.0-java11 as graalvm
COPY . /home/app/micronaut-hello-native1
WORKDIR /home/app/micronaut-hello-native1
ENV JAVA_OPTIONS "-Xms1g -Xmx16g"
RUN gu install native-image
RUN native-image -J-Xmx4g --no-server -cp build/libs/micronaut-hello-native1-0.1-all.jar

FROM alpine:3.12.0
RUN apk add --no-cache libstdc++
ENV GLIBC_VERSION=2.31-r0
ENV GLIBC_TARBALL=https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub; \
 for pkg in glibc-$GLIBC_VERSION glibc-bin-$GLIBC_VERSION; \
	do wget $GLIBC_TARBALL/${pkg}.apk; \
 done; \
 apk -U add *.apk; \
 rm *.apk;

ENV PATH=/usr/glibc-compat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-hello-native1 .
ENTRYPOINT ["./micronaut-hello-native1"]
