package com.sinoway.dao;

import com.sinoway.entity.OrganizationEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by souyouyou on 2018/5/17.
 */
public interface OrganizationRepository extends CrudRepository<OrganizationEntity,Long>{

    Page<OrganizationEntity> findAll(Pageable pageable);

    Iterable<OrganizationEntity> findAll(Sort sort);
}
