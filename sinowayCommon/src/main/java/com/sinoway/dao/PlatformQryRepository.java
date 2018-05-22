package com.sinoway.dao;

import com.sinoway.entity.PlatformQryEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by souyouyou on 2018/5/17.
 */
public interface PlatformQryRepository extends CrudRepository<PlatformQryEntity,Long> {
    Page<PlatformQryEntity> findAll(Pageable pageable);

    Iterable<PlatformQryEntity> findAll(Sort sort);

}
