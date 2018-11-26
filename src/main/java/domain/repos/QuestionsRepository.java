package domain.repos;

import domain.entities.Questions;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionsRepository extends JpaRepository<Questions, Long> {
    //Tests findById(Long id);
}
