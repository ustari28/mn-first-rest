package mn.first.rest.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Greeting {

    private String action;
}
