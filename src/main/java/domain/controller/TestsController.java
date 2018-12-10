package domain.controller;


import domain.entities.*;
import domain.repos.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;


@Controller
public class TestsController {

    @Autowired
    private TestsRepository testsRepo;

    @Autowired
    private TestsTypeRepository testsTypeRepo;

    @Autowired
    private QuestionsRepository questionsRepo;

    @Autowired
    private AnswersRepository answersRepo;

    @Autowired
    private StatisticRepository statRepo;

    @GetMapping(path = "/addTestsType")
    public String addTests(@AuthenticationPrincipal User user,
                           Map<String, Object> modl,
                           @RequestParam(value = "result", required = false) String result
    ) {
        if(result!=null){
            modl.put("result", result);
        }
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
        return "addTestsType";
    }


    @RequestMapping(value = "/addTestsType", method = RequestMethod.POST)
    public Object addTypeTests(@AuthenticationPrincipal User user,
                               @RequestParam String type,
                               Map<String, Object> modl
    ) {
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!");
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

        boolean result = true;
        Tests tests = new Tests();
        TestsType testsType = testsTypeRepo.findByType(type);
        if (testsType != null || type=="") {
            result = false;
        } else {
            TestsType t = new TestsType();
            t.setType(type);
            tests.setType(t);
            testsTypeRepo.save(t);
        }
        return "redirect:/addTestsType?result=" + result;
    }


    @GetMapping(path = "/addTestsTitle")
    public String addTestsTitle(@AuthenticationPrincipal User user,
                                Map<String, Object> modl,
                                @RequestParam(value = "result", required = false) String result
    ) {

        if(result!=null){
            modl.put("result", result);
        }


        Iterable<TestsType> testsType = testsTypeRepo.findAll();
        modl.put("testsType", testsType);

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
        return "addTestsTitle";
    }

    @RequestMapping(value = "addTestsTitle", method = RequestMethod.POST)
    public Object addTestsTitle(@AuthenticationPrincipal User user,
                                @ModelAttribute Tests test,
                                Map<String, Object> modl,
                                Model model
    ) {
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

        boolean result =true;
        if(test.getTitle()!=null && test.getTitle()!=""){
            test.setAuthor(user);
            testsRepo.save(test);
          }else{
            result=false;
        }

        return "redirect:/addTestsTitle?result=" + result;
    }

    @GetMapping(path = "/addTests")
    public String registration(@AuthenticationPrincipal User user,
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

//        Iterable<TestsType> testsType = testsTypeRepo.findAll();
//        modl.put("testsType", testsType);
        return "addTests";
    }

    @RequestMapping(value = "/addTests",
            method = RequestMethod.POST)
    public Object addTests(@AuthenticationPrincipal User author,
                           @RequestParam String type,
                           @RequestParam String title,
                           Map<String, Object> model) {

        Tests tests = new Tests();
        TestsType testsType = testsTypeRepo.findByType(type);
        if (testsType != null) {
            tests.setType(testsType);
        } else {
            TestsType t = new TestsType();
            t.setType(type);
            tests.setType(t);
            testsTypeRepo.save(t);
        }

        Tests titleFromDb = testsRepo.findByTitle(title);
        if (titleFromDb != null) {

            return model.put("message", "This title already exist");
        } else {
            tests.setTitle(title);
        }

        tests.setAuthor(author);
        testsRepo.save(tests);

        return "redirect:/addQuestion?id=" + tests.getId();
    }


    @RequestMapping(value = "/addQuestionAnswer", method = RequestMethod.POST)
    public Object addQuest(@ModelAttribute Questions questions, @RequestParam String answer1, @RequestParam boolean ck_answer1,
                           @RequestParam String answer2, @RequestParam boolean ck_answer2,
                           @RequestParam String answer3, @RequestParam boolean ck_answer3,
                           @RequestParam String answer4, @RequestParam boolean ck_answer4,
                           Map<String, Object> model) {

        questionsRepo.save(questions);

        if (answer1 != "") {
            Answers ans1 = new Answers();
            ans1.setQuestion(questions);
            ans1.setAnswers(answer1);
            ans1.setTrues(ck_answer1);
            answersRepo.save(ans1);
        }

        if (answer2 != "") {
            Answers ans2 = new Answers();
            ans2.setQuestion(questions);
            ans2.setAnswers(answer2);
            ans2.setTrues(ck_answer2);
            answersRepo.save(ans2);
        }

        if (answer3 != "") {
            Answers ans3 = new Answers();
            ans3.setQuestion(questions);
            ans3.setAnswers(answer3);
            ans3.setTrues(ck_answer3);
            answersRepo.save(ans3);
        }

        if (answer4 != "") {
            Answers ans4 = new Answers();
            ans4.setQuestion(questions);
            ans4.setAnswers(answer4);
            ans4.setTrues(ck_answer4);
            answersRepo.save(ans4);
        }

        return "redirect:/testsList";
    }


    @GetMapping(path = "/addQuestionAnswer")
    public String addGetQuest(@AuthenticationPrincipal User usr,
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

        Iterable<Tests> tests = testsRepo.findAll();
        modl.put("tests", tests);

        return "addQuestion";
    }


    @GetMapping(path = "testsRun")
    public String testsRun(Model model,
                           Map<String, Object> modl,
                           @RequestParam(value = "typeId", required = false) Long typeId,
                           @AuthenticationPrincipal User user
    ) {
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


        model.addAttribute("testsType", testsTypeRepo.findAll());

        if (typeId != null) {
            Set<Tests> t = testsRepo.findByTypeId(typeId);
            model.addAttribute("tests", testsRepo.findByTypeId(typeId));

        }

        return "testsRun";
    }

    @GetMapping(path = "exeTest")
    public String chooseTest(Model model,
                             @AuthenticationPrincipal User user,
                             @RequestParam(value = "testsId", required = false) Long testsId,
                             @RequestParam(value = "stat", required = false) Long st,
                             @RequestParam(value = "questionNum", required = false) Long questNum,
                             Map<String, Object> modl,
                             @RequestParam(value = "typeId", required = false) Long typeId) {


        if (st == null && questNum != 0) {
            return "error tt";
        }
        Optional<Tests> t = testsRepo.findById(testsId);
        Tests currTest = t.get();
        int count = 0;

        if (questNum == 0 && st == null) {
            Set stat_run = statRepo.findByUserAndTest(user, currTest);
            Iterator<Statistic> iterator = stat_run.iterator();
            if (stat_run.size() > 0) {
                while (iterator.hasNext()) {
                    Statistic setElement = iterator.next();
                    model.addAttribute("statId", setElement.getId());
                    model.addAttribute("questNum", setElement.getAmountAnswers());
                    model.addAttribute("testId", setElement.getTestStTst().getId());
                }
                return "Test_is_started";
            }

        }


        Set<Questions> quest = currTest.getQuestions();
        QComparator qc = new QComparator();
        TreeSet<Questions> tq = new TreeSet<Questions>(qc);
        tq.addAll(quest);

        if (tq.size() < 3) {
            model.addAttribute("testsType", testsTypeRepo.findAll());

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
            return "testInDevelopment";
        }

        for (Questions q : tq
                ) {
            Set<Answers> a = q.getAnswers();
            if (count == questNum) {
                model.addAttribute("questid", q.getId());

                model.addAttribute("quest", q);
                model.addAttribute("answers", a);
                model.addAttribute("testId", testsId);
                model.addAttribute("questionNum", questNum + 1);
                break;
            }
            count++;
        }
        if (st == null) {
            Statistic stat = new Statistic();
            stat.setTestStUsr(user);
            stat.setStartTime(new Date());
            stat.setCountQuest(tq.size());
            stat.setAmountAnswers(0);
            stat.setRightAnswer(0);
            stat.setTestStTst(currTest);
            statRepo.save(stat);
            model.addAttribute("stat", stat.getId());
        } else {
            Optional<Statistic> s = statRepo.findById(st);
            Statistic stat = s.get();
            if (stat.getCountQuest() == stat.getAmountAnswers() || stat.getAmountAnswers() != questNum) {
                return "test пройден";
            }
            model.addAttribute("stat", stat.getId());
        }


        return "exeTest";
    }

    @GetMapping(path = "/exeTestCheck")
    public String exeTestCheck() {
        return "testEnded";
    }

    @RequestMapping(value = "/exeTestCheck", method = RequestMethod.POST)
    public String postExeTest(Model model,
                              RedirectAttributes redirectAttributes,
                              @RequestParam(value = "testsId", required = false) Long testsId,
                              @RequestParam(value = "stat") Long stat,
                              @RequestParam(value = "questId") Long questId,
                              @RequestParam(value = "option1", required = false) Long option1,
                              @RequestParam(value = "option2", required = false) Long option2,
                              @RequestParam(value = "option3", required = false) Long option3,
                              @RequestParam(value = "option4", required = false) Long option4,
                              @RequestParam(value = "questionNum", required = false) Long questNum) {
        Optional<Statistic> s = statRepo.findById(stat);
        Statistic currStat = s.get();
        if (currStat == null) {
            return "Statistic not found";
        }

        Optional<Questions> q = questionsRepo.findById(questId);
        Questions currQuest = q.get();
        if (currQuest == null) {
            return "Question not found";
        }

        Date date = currStat.getStartTime();
        long dateI = date.getTime() / 1000;
        long dateD = new Date().getTime() / 1000;
        long D = dateD - dateI;
        if (D / 60 > 10) {
            return "Время вышло";
        }

        int rightAns = 1;
        if (currQuest.getAnswers() != null) {

            for (Answers a : currQuest.getAnswers()) {
                if (a.isTrues() == true) {
                    if (a.getId() != option1 && a.getId() != option2 &&
                            a.getId() != option3 && a.getId() != option4) {
                        rightAns = 0;
                    }
                }
            }

        }

        currStat.setStartTime(new Date());
        currStat.setAmountAnswers(currStat.getAmountAnswers() + 1);
        if (rightAns == 1) {
            currStat.setRightAnswer(currStat.getRightAnswer() + 1);
        }
        statRepo.save(currStat);
        if (currStat.getCountQuest() == currStat.getAmountAnswers()) {
            currStat.setEndTime(new Date());
            statRepo.save(currStat);
            float res = ((float) currStat.getRightAnswer() / (float) currStat.getCountQuest()) * 100;

            model.addAttribute("result", String.format("%.2f", res));

            return "testEnded";
        }
        redirectAttributes.addAttribute("stat", stat);
        redirectAttributes.addAttribute("testsId", testsId);
        redirectAttributes.addAttribute("questionNum", questNum);
        return "redirect:/exeTest";
    }

    @GetMapping(path = "stopTest")
    public String chooseTest(Model model,
                             @AuthenticationPrincipal User user,
                             @RequestParam(value = "testsId") Long testsId,
                             @RequestParam(value = "stat") Long st
    ) {
        Optional<Statistic> s = statRepo.findById(st);
        Statistic stat = s.get();
        System.out.println(stat.getTestStUsr().getId());
        System.out.println(user.getId());
        if (stat.getTestStUsr().getId() != user.getId()) {
            return "error_e";
        }
        stat.setEndTime(new Date());
        stat.setAmountAnswers(stat.getCountQuest());
        statRepo.save(stat);
        return "redirect:/exeTest?testsId=" + testsId + "&questionNum=0";
    }


}
