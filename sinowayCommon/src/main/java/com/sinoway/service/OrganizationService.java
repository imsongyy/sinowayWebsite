package com.sinoway.service;

import com.sinoway.entity.OrganizationEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Iterator;


/**
 * Created by souyouyou on 2018/4/27.
 */
public interface OrganizationService {

    Page<OrganizationEntity> findAll(Pageable pageable);

    OrganizationEntity findOne(Long id);

    Iterator<OrganizationEntity> findAll();

    OrganizationEntity save(OrganizationEntity entity);

    void delete(Long id);


}
