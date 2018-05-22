package com.sinoway.service;

import com.sinoway.entity.DriverEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


/**
 * Created by souyouyou on 2018/4/13.
 */
public interface DriverService {
    DriverEntity save(DriverEntity driverEntity);

    Page<DriverEntity> findAll(Pageable pageable);

    DriverEntity findById(Long id);

}
