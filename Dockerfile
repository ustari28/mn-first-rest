FROM oracle/graalvm-ce:19.3.0 as graalvm
COPY . /home/app/mnfirstrest/
WORKDIR /home/app/mnfirstrest/
RUN gu install native-image
RUN native-image --no-server --initialize-at-run-time=io.micronaut.discovery.aws.parameterstore.AWSParameterStoreConfigClient,io.micronaut.http.client.DefaultHttpClient,io.micronaut.tracing.instrument.rxjava.RxJava1TracingInstrumentation -cp target/mn-first-rest-*.jar

FROM frolvlad/alpine-glibc
LABEL application=mn-first-rest \
      traefik.enable="true" \
      traefik.docker.network=traefik-nt \
      traefik.http.routers.mn-first-rest.rule="PathPrefix(`/mn-first-rest/`)" \
      traefik.http.routers.mn-first-rest.service="mn-first-rest" \
      traefik.http.routers.mn-first-rest.entrypoints=web \
      traefik.http.routers.mn-first-rest.middlewares="mn-first-rest" \
      traefik.http.services.mn-first-rest.loadBalancer.server.port="8080" \
      traefik.http.middlewares.mn-first-rest.stripprefix.prefixes="/mn-first-rest/"
EXPOSE 8080
COPY --from=graalvm /home/app/mnfirstrest .
RUN pwd
RUN ls -l .
ENTRYPOINT ["./mnfirstrest"]