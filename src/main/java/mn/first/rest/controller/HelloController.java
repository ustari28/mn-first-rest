package mn.first.rest.controller;

import io.micronaut.http.HttpResponse;
import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.tracing.annotation.NewSpan;
import lombok.extern.slf4j.Slf4j;
import mn.first.rest.api.HelloApi;
import mn.first.rest.model.Greeting;
import mn.first.rest.service.HelloService;
import mn.first.rest.service.impl.GreetingHelloService;

@Controller("/api/hello/v1")
@Slf4j
public class HelloController implements HelloApi {

    HelloService helloService;

    public HelloController(GreetingHelloService helloService) {
        this.helloService = helloService;
    }

    @NewSpan("greeting")
    @Get(value = "/greeting", produces = MediaType.APPLICATION_JSON)
    @Override
    public HttpResponse<Greeting> greeting() {
        return HttpResponse.ok(Greeting.builder().action("Hello").build());
    }
}
