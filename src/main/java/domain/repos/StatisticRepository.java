package domain.repos;

import domain.entities.Statistic;
import org.springframework.data.repository.CrudRepository;

public interface StatisticRepository extends CrudRepository<Statistic, Long> {
   // Statistic findById(Long id);
}
