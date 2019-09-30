package mn.first.rest.model;

import io.micronaut.core.annotation.Introspected;
import lombok.Builder;
import lombok.Data;

@Introspected
@Builder
@Data
public class Greeting {

    private String action;
}
