package com.sinoway.service.impl;

import com.sinoway.dao.DriverRepository;
import com.sinoway.entity.DriverEntity;
import com.sinoway.service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created by souyouyou on 2018/4/13.
 */
@Service
public class DriverServiceImpl implements DriverService {


    @Autowired
    private DriverRepository driverRepository;


    @Override
    public DriverEntity save(DriverEntity driverEntity) {
        return driverRepository.save(driverEntity);
    }

    @Override
    public Page<DriverEntity> findAll(Pageable pageable) {
        return driverRepository.findAll(pageable);
    }

    @Override
    public DriverEntity findById(Long id) {
        return null;
    }
}
