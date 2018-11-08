package domain.repos;

import domain.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by ladyi on 29.10.2018.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
