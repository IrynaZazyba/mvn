package domain.controller;

import domain.entities.Role;
import domain.entities.Statistic;
import domain.entities.TestsType;
import domain.entities.User;
import domain.repos.StatisticRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;
import java.util.Optional;
import java.util.Set;

@Controller
public class StatisticController {
    @Autowired
    private StatisticRepository statRepo;

    @GetMapping(path = "/getStatistics")
    public String getStatistic(@AuthenticationPrincipal User user,
                               Map<String, Object> modl,
                               Model model)
    {
        if (user != null)
        {
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

        Set<Statistic> s = statRepo.findByTestStUsr(user);
        model.addAttribute("statistics", s);
        return "statistics";
    }

}
