package domain.controller;

import domain.entities.Role;
import domain.entities.User;
import domain.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by ladyi on 29.10.2018.
 */
@Controller
@RequestMapping
public class MainController {

    @Autowired
    private UserRepository userRepository;


    @GetMapping(path = "/userEdit")
    public String adminMenu(@AuthenticationPrincipal User user,
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

        return "adminmenu";
    }


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

        if (error != null) {
            return "redirect:/registration";

        }


        return "main";
    }

    @GetMapping(path = "/addUser")
    public String addNewUser(@RequestParam(value = "userSaved", required = false) String userSaved,
                             @RequestParam(value = "userExist", required = false) String userExist,
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

        int menu = 1;

//        User n = new User();
//        n.setUsername(name);
//        n.setEmail(email);
//        userRepository.save(n);
        model.addAttribute("roles", Role.values());
        model.addAttribute("userSaved", userSaved);
        model.addAttribute("userExist", userExist);
        model.addAttribute("user", usr);
        model.addAttribute("menu", menu);
        return "/addUser";
    }

    @PostMapping(path = "/addUser")
    public String saveNewUser(@RequestParam String username,
                              @RequestParam String password,
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


        if (userRepository.findByUsername(username) != null) {
            String userExist = "Пользователь с данным именем уже существует";
            model.addAttribute("userExist", userExist);
        } else {

            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setRoles(Collections.singleton(Role.USER));
            user.setActive(true);
            userRepository.save(user);
            String userSaved = "Пользователь добавлен";
            model.addAttribute("userSaved", userSaved);
        }
        return "/addUser";
    }

    @GetMapping(path = "/all")
    public
    @ResponseBody
    Iterable<User> getAllUsers() {
        // This returns a JSON or XML with the users
        return userRepository.findAll();
    }

    @GetMapping(path = "/editProfile")
    public String editProfile(@RequestParam(value = "userSave", required = false) String userSave,
                              @RequestParam(value = "userExist", required = false) String userExist,
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

        model.addAttribute("user", usr);
        model.addAttribute("userSave", userSave);
        model.addAttribute("userExist", userExist);
        return "editProfile";
    }

    @PostMapping(path = "/editProfile")
    public String editProfileSave(RedirectAttributes redirectAttributes,
                                  @RequestParam String username,
                                  @RequestParam String password,
                                  @RequestParam("userId") User user,
                                  Model model, @AuthenticationPrincipal User usr,
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

        if (userRepository.findByUsername(username) != null&&username!=user.getUsername()) {
            String userExist = "Пользователь с данным именем уже существует";
            redirectAttributes.addAttribute("userExist", userExist);
        } else {
            usr.setUsername(username);
            usr.setPassword(password);
            userRepository.save(usr);
            String userSave = "Данные профиля отредактированы";
            redirectAttributes.addAttribute("userSave", userSave);
        }
        model.addAttribute("user", usr);
        return "redirect:/editProfile";
    }


}
