package domain.repos;

import domain.entities.Statistic;
import domain.entities.Tests;
import domain.entities.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Set;

public interface StatisticRepository extends CrudRepository<Statistic, Long> {
   // Statistic findById(Long id);
      @Query("select s from Statistic s where s.testStUsr=:user AND s.testStTst=:test AND s.endTime=NULL")
      Set <Statistic> findByUserAndTest(@Param("user") User testStUsr, @Param("test")Tests tests);

      Set <Statistic> findByTestStUsr(User testStUsr);
}
