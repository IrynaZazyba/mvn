package domain.repos;

import domain.entities.Tests;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestsRepository extends JpaRepository<Tests, Long>  {
  //  Tests findById(Long id);
    Tests findByTitle(String title);
}
