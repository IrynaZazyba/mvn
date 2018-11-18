package domain.controller;

import domain.entities.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class GreetingController {

    @GetMapping("/greeting")
    public String greeting(
            @AuthenticationPrincipal User user,
            Map<String, Object> model) {
        model.put("message", user.getUsername());
        return "greeting";
    }

}