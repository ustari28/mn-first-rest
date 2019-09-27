package mn.first.rest.api;

import io.micronaut.http.HttpResponse;
import mn.first.rest.model.Greeting;

public interface HelloApi {

    String greeting();

    HttpResponse<Greeting> hello();
}
