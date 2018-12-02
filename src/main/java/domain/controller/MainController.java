package domain.controller;

import domain.entities.Role;
import domain.entities.User;
import domain.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * Created by ladyi on 29.10.2018.
 */
@Controller
@RequestMapping
public class MainController {

    @Autowired
    private UserRepository userRepository;


    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String greeting(Map<String, Object> model,
                           @RequestParam(value = "error", required = false) String error,
                           @AuthenticationPrincipal User user) {
        if (user != null) {
            model.put("auth", true);
            model.put("username", user.getUsername());
            for (Role r : user.getRoles()
                    ) {
                if (r.compareTo(Role.ADMIN) == 0) {
                    model.put("userrole", Role.ADMIN);
                } else {
                    model.put("userrole", Role.USER);
                }
            }
        } else {
            model.put("auth", false);
        }
        return "main";
    }

    @GetMapping(path = "/add")
    public
    @ResponseBody
    String addNewUser(@RequestParam String name, @RequestParam String email) {
//        User n = new User();
//        n.setName(name);
//        n.setEmail(email);
//        userRepository.save(n);
        return "Saved";
    }

    @GetMapping(path = "/all")
    public
    @ResponseBody
    Iterable<User> getAllUsers() {
        // This returns a JSON or XML with the users
        return userRepository.findAll();
    }

}
