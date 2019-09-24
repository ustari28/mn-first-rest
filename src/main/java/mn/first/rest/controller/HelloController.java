package mn.first.rest.controller;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import mn.first.rest.api.HelloApi;
import mn.first.rest.service.HelloService;
import mn.first.rest.service.impl.GreetingHelloService;

@Controller("/api/v1/hello")
public class HelloController implements HelloApi {

    HelloService helloService;

    public HelloController(GreetingHelloService helloService) {
        this.helloService = helloService;
    }

    @Get(value = "/greeting", produces = MediaType.TEXT_PLAIN)
    @Override
    public String greeting() {
        return this.helloService.hello();
    }
}
