package com.sinoway.service;

import com.sinoway.entity.PlatformQryEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Iterator;


/**
 * Created by souyouyou on 2018/4/27.
 */
public interface PlatformQryService {

    Page<PlatformQryEntity> findAll(Pageable pageable);

    PlatformQryEntity findOne(Long id);

    Iterator<PlatformQryEntity> findAll();

    PlatformQryEntity save(PlatformQryEntity entity);

    void delete(Long id);


}
