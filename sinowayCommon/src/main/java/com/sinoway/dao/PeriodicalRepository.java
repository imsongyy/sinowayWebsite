package com.sinoway.dao;

import com.sinoway.entity.PeriodicalEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by souyouyou on 2018/4/25.
 */
public interface PeriodicalRepository extends CrudRepository<PeriodicalEntity, Long> {
    Page<PeriodicalEntity> findAll(Pageable pageable);

}
