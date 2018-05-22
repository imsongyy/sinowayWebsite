package com.sinoway.dao;

import com.sinoway.entity.DocumentEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by souyouyou on 2018/4/25.
 */
public interface DocumentRepository extends CrudRepository<DocumentEntity, Long> {

    Page<DocumentEntity> findAll(Pageable pageable);
}
