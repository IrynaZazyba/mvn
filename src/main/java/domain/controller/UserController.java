package domain.controller;

import domain.entities.Role;
import domain.entities.User;
import domain.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Created by ladyi on 29.10.2018.
 */
@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    @Autowired
    private UserRepository userRepo;

    @GetMapping
    public String userList(Model model,
                           @AuthenticationPrincipal User user,
                           Map<String, Object> modl) {
        if (user != null) {
            modl.put("auth", true);
            modl.put("username", user.getUsername());
            for (Role r : user.getRoles()
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

        model.addAttribute("users", userRepo.findAll());
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user,
                               Model model,
                               @AuthenticationPrincipal User usr,
                               Map<String, Object> modl
                               ) {
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

        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }



    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepo.save(user);
        return "redirect:/user";
    }
}
