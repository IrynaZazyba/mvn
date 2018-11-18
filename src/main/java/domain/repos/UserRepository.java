package domain.repos;

import domain.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by ladyi on 29.10.2018.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
