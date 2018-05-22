package com.sinoway.service;

import com.sinoway.entity.PeriodicalEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


/**
 * Created by souyouyou on 2018/4/13.
 */
public interface PeriodicalService {
    PeriodicalEntity save(PeriodicalEntity periodicalEntity);

    Page<PeriodicalEntity> findAll(Pageable pageable);

    PeriodicalEntity findById(Long id);

}
