package domain.controller;

import domain.entities.Role;
import domain.entities.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class GreetingController {

    @GetMapping("/aboutAs")
    public String greeting(
            Model model,
            @AuthenticationPrincipal User usr,
            Map<String, Object> modl) {
        if (usr != null) {
            modl.put("auth", true);
            modl.put("username", usr.getUsername());
            for (Role r : usr.getRoles()
                    ) {
                if (r.compareTo(Role.ADMIN) == 0) {
                    modl.put("userrole", Role.ADMIN);
                } else {
                    modl.put("userrole", Role.USER);
                }
            }
        } else {
            modl.put("auth", false);
        }

        return "aboutAs";
    }

}