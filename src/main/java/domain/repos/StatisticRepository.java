package domain.repos;


import domain.entities.Answers;
import domain.entities.Statistic;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StatisticRepository extends JpaRepository<Statistic, Long> {

}
