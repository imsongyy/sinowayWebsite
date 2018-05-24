package com.sinoway.service.impl;

import com.sinoway.dao.DocumentRepository;
import com.sinoway.entity.DocumentEntity;
import com.sinoway.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created by souyouyou on 2018/4/13.
 */
@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentRepository documentRepository;

    @Override
    public DocumentEntity save(DocumentEntity documentEntity) {
        return documentRepository.save(documentEntity);
    }

    @Override
    public Page<DocumentEntity> findAll(Pageable pageable) {

        return documentRepository.findAll(pageable);
    }

    @Override
    public DocumentEntity findById(Long id) {
        return documentRepository.findById(id).get();
    }

    @Override
    public void deleteById(Long id) {
        documentRepository.deleteById(id);
    }
}
