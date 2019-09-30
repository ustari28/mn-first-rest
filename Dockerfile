FROM oracle/graalvm-ce:latest as graalvm
COPY . /home/app/mnfirstrest
WORKDIR /home/app/mnfirstrest
RUN gu install native-image
RUN native-image --no-server -cp target/mn-first-rest-*.jar

FROM frolvlad/alpine-glibc
EXPOSE 8080
COPY --from=graalvm /home/app/mnfirstrest .
ENTRYPOINT ["./mnfirstrest"]