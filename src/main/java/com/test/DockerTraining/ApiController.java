package com.test.DockerTraining;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {


    @GetMapping("/hello")
    public String test()
    {
        return "Hi Gowtham here from socgen";
    }
}
