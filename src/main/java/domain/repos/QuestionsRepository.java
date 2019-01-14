package domain.repos;

import domain.entities.Questions;
import org.springframework.data.repository.CrudRepository;

import java.util.Set;

public interface QuestionsRepository extends CrudRepository <Questions, Long> {
    //Tests findById(Long id);
    Set<Questions> findByTest(Long test);
}
