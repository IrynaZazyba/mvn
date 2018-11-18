package domain.entities;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class TestsType {


    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    private String type;

    @OneToMany(mappedBy = "type", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private Set<Tests> tests = new HashSet<Tests>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Set<Tests> getTests() {
        return tests;
    }

    public void setTests(Set<Tests> tests) {
        this.tests = tests;
    }
}
