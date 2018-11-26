package domain.repos;



import domain.entities.TestsType;
import domain.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestsTypeRepository extends JpaRepository<TestsType, Long> {
    TestsType findByType(String type);
}
