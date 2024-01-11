package org.improving.templates;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/customers")
public class DemoController {

    @GetMapping
    public ResponseEntity<String> ping() {
        return new ResponseEntity("Hello", HttpStatus.OK);
    }
}
