package com.sinoway.service.impl;

import com.sinoway.dao.PeriodicalRepository;
import com.sinoway.entity.PeriodicalEntity;
import com.sinoway.service.PeriodicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created by souyouyou on 2018/4/13.
 */
@Service
public class PeriodicalServiceImpl implements PeriodicalService {

    @Autowired
    private PeriodicalRepository periodicalRepository;

    @Override
    public PeriodicalEntity save(PeriodicalEntity periodicalEntity) {
        return periodicalRepository.save(periodicalEntity);
    }

    @Override
    public Page<PeriodicalEntity> findAll(Pageable pageable) {

        return periodicalRepository.findAll(pageable);
    }

    @Override
    public PeriodicalEntity findById(Long id) {
        return null;
    }
}
