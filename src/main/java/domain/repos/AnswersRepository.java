package domain.repos;


import domain.entities.Answers;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnswersRepository extends JpaRepository<Answers, Long> {
    //Tests findById(Long id);
}
