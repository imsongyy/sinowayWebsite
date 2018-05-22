package com.sinoway.dao;

import com.sinoway.entity.InformationEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by souyouyou on 2018/4/13.
 */
public interface InformationRepository extends CrudRepository<InformationEntity,Long> {

    Page<InformationEntity> findAll(Specification<InformationEntity> specification, Pageable pageable);
    Page<InformationEntity> findAll(Pageable pageable);

    void deleteById(Long id);

}
