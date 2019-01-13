package domain.entities;

import org.aspectj.weaver.ast.Test;

import javax.persistence.*;
import javax.xml.crypto.Data;
import java.util.Date;
import java.util.HashSet;
import java.util.LongSummaryStatistics;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * Created by ladyi on 18.11.2018.
 */
@Entity
public class Statistic {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Date startTime;
    private Date endTime;
    private int rightAnswer;
    private int countQuest;
    private int amountAnswers;

    private Date startTimeFirst;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_st_test")
    private Tests testStTst;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_st_user")
    private User testStUsr;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tests getTestStTst() {
        return testStTst;
    }

    public void setTestStTst(Tests testStTst) {
        this.testStTst = testStTst;
    }

    public User getTestStUsr() {
        return testStUsr;
    }

    public void setTestStUsr(User testStUsr) {
        this.testStUsr = testStUsr;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getRightAnswer() {
        return rightAnswer;
    }

    public void setRightAnswer(int rightAnswer) {
        this.rightAnswer = rightAnswer;
    }

    public int getCountQuest() {
        return countQuest;
    }

    public void setCountQuest(int countQuest) {
        this.countQuest = countQuest;
    }

    public int getAmountAnswers() {
        return amountAnswers;
    }

    public void setAmountAnswers(int amountAnswers) {
        this.amountAnswers = amountAnswers;
    }

    public Date getStartTimeFirst() {
        return startTimeFirst;
    }

    public void setStartTimeFirst(Date startTimeFirst) {
        this.startTimeFirst = startTimeFirst;
    }

    TimeUnit timeUnit;

    public long getDateDiff() {
        if(endTime==null) {
          return -1;
        }else{ long diffInMillies = endTime.getTime() - startTimeFirst.getTime();
            return timeUnit.MINUTES.convert(diffInMillies, TimeUnit.MILLISECONDS);

        }
    }


}
