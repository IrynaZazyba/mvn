package domain.controller;


import domain.entities.*;
import domain.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;
import java.util.Set;


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

    @GetMapping(path = "/addTests")
    public String registration(Map<String, Object> model) {
        Iterable<TestsType> testsType = testsTypeRepo.findAll();
        model.put("testsType", testsType);
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

        return "redirect:/addQuestion?id="+tests.getId();
    }


    @RequestMapping(value = "/addQuestion",
            method = RequestMethod.POST)
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



    @GetMapping(path = "/addQuestion")
    public String addGetQuest(Map<String, Object> model,
                              @RequestParam Long id) {

        Optional<Tests> test = testsRepo.findById(id);
        Tests TestObj = test.get();
        model.put("testId", TestObj.getId());
        model.put("testTitle", TestObj.getTitle());
        return "addQuestion";
    }


    @GetMapping(path = "/runTest")
    public String runTest(@RequestParam Long testId, @RequestParam Long queryId, Map<String, Object> model) {
        Optional<Tests> tests = testsRepo.findById(testId);
        if (tests == null) {
            model.put("error", "Test not exist!");
        } else {
            Tests TestObj = tests.get();
            model.put("testId", TestObj.getId());
            model.put("testTitle", TestObj.getTitle());
            Set<Questions> qest = TestObj.getQuestions();
            boolean fl = false;
            boolean start = false;
            for (Questions qes : qest) {
                if (!start) {
                    model.put("queryTitle", qes.getQuest());
                    model.put("queryId", qes.getId());
                    start = true;
                }
                if (fl) {
                    model.put("queryId", qes.getId());
                    model.put("queryTitle", qes.getQuest());
                }
                if (queryId == qes.getId()) {
                    fl = true;
                }
            }
        }

        return "runTest";
    }
}
