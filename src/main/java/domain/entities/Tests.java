package domain.entities;

import javax.persistence.*;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

@Entity // This tells Hibernate to make a table out of this class
public class Tests {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    private String title ;

    @OneToMany(mappedBy = "test", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private Set<Questions> questions = new HashSet<Questions>();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "type_id")
    private TestsType type;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id")
    private User author;


    @OneToMany(mappedBy = "testStTst", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private Set<Statistic> statistics = new HashSet<Statistic>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public TestsType getType() {
        return type;
    }

    public void setType(TestsType type) {
        this.type = type;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Set<Questions> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Questions> questions) {
        this.questions = questions;
    }

    public Set<Statistic> getStatistics() {
        return statistics;
    }

    public void setStatistics(Set<Statistic> statistics) {
        this.statistics = statistics;
    }
}
