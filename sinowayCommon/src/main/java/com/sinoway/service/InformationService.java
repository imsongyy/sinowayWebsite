package com.sinoway.service;

import com.sinoway.entity.InformationEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


/**
 * Created by souyouyou on 2018/4/13.
 */
public interface InformationService {
    InformationEntity save(InformationEntity information);

    Page<InformationEntity> findAll(Pageable pageable);

    List<InformationEntity> findAll();

    void deleteById(Long id);

}
