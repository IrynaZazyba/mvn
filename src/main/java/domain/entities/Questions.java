package domain.entities;


import javax.persistence.*;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;

@Entity // This tells Hibernate to make a table out of this class
public class Questions {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    private String quest;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fk_test")
    private Tests test;

    @OneToMany(mappedBy = "question", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private Set<Answers> answers = new HashSet<Answers>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tests getTest() {
        return test;
    }

    public void setTest(Tests test) {
        this.test = test;
    }

    public String getQuest() {
        return quest;
    }

    public void setQuest(String question) {
        this.quest = question;
    }

    public Set<Answers> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answers> answers) {
        this.answers = answers;
    }


//    @Override
//    public int compare(Questions o1, Questions o2) {
//        return o1.getId().compareTo(o2.getId());
//    }
}
