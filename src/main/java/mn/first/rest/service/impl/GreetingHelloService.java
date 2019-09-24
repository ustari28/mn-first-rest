package mn.first.rest.service.impl;

import mn.first.rest.service.HelloService;

import javax.inject.Singleton;

@Singleton
public class GreetingHelloService implements HelloService {
    @Override
    public String hello() {
        return "Hello micronaut";
    }
}
