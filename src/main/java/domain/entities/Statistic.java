package domain.entities;

import org.aspectj.weaver.ast.Test;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by ladyi on 18.11.2018.
 */
@Entity
public class Statistic {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="fk_st_test")
    private Tests testStTst;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="fk_st_user")
    private User testStUsr;

    public int getId() {
        return id;
    }

    public void setId(int id) {
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
}
