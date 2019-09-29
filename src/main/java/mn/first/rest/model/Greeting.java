package mn.first.rest.model;

import lombok.Builder;
import lombok.Data;

@Builder
public class Greeting {

    private String action;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
