package domain.controller;

import domain.entities.User;
import domain.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by ladyi on 29.10.2018.
 */
@Controller
@RequestMapping
public class MainController  {

    @Autowired
    private UserRepository userRepository;


    @GetMapping("/")
    public String greeting(Map<String, Object> model)
    {
        return "main";
    }

    @GetMapping(path="/add")
    public @ResponseBody
    String addNewUser (@RequestParam String name, @RequestParam String email) {
//        User n = new User();
//        n.setName(name);
//        n.setEmail(email);
//        userRepository.save(n);
        return "Saved";
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<User> getAllUsers() {
        // This returns a JSON or XML with the users
        return userRepository.findAll();
    }

}
