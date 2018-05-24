package com.sinoway.service;

import com.sinoway.entity.DocumentEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


/**
 * Created by souyouyou on 2018/4/13.
 */
public interface DocumentService {
    DocumentEntity save(DocumentEntity documentEntity);

    Page<DocumentEntity> findAll(Pageable pageable);

    DocumentEntity findById(Long id);

    void deleteById(Long id);

}
