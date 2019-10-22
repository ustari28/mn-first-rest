FROM oracle/graalvm-ce:19.2.1 as graalvm
COPY . /home/app/mnfirstrest
WORKDIR /home/app/mnfirstrest
RUN gu install native-image
RUN native-image --no-server --initialize-at-run-time=io.micronaut.discovery.aws.parameterstore.AWSParameterStoreConfigClient,io.micronaut.http.client.DefaultHttpClient -cp target/mn-first-rest-*.jar

FROM frolvlad/alpine-glibc
EXPOSE 8080
COPY --from=graalvm /home/app/mnfirstrest .
ENTRYPOINT ["./mnfirstrest"]