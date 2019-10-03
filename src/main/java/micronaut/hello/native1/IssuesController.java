package micronaut.hello.native1;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.PathVariable;

import java.util.HashMap;
import java.util.Map;

@Controller("/issues")
public class IssuesController {

    @Get("/{number}")
    public Map<String, String> issue(@PathVariable Integer number) {
        return new HashMap<String, String>() {{
            put("key", "Issue # " + number + "!");
        }};
    }

}
