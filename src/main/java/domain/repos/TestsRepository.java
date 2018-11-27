package domain.repos;

import domain.entities.Tests;
import org.springframework.data.repository.CrudRepository;

import java.util.Set;

public interface TestsRepository extends CrudRepository<Tests, Long> {
    //  Tests findById(Long id);
    Tests findByTitle(String title);
    Set<Tests> findByTypeId(Long type);




}
