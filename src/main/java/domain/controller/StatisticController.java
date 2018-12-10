package domain.controller;

import domain.entities.Statistic;
import domain.entities.TestsType;
import domain.entities.User;
import domain.repos.StatisticRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
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
                                Map<String, Object> model)
    {
        Set<Statistic> s = statRepo.findByTestStUsr(user);
        model.put("statistics", s);
        return "statistics";
    }

}
