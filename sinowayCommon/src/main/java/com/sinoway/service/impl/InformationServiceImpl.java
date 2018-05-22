package com.sinoway.service.impl;

import com.sinoway.dao.InformationRepository;
import com.sinoway.entity.InformationEntity;
import com.sinoway.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by souyouyou on 2018/4/13.
 */
@Service
public class InformationServiceImpl implements InformationService {

    @Autowired
    private InformationRepository informationRepository;


    @Override
    public InformationEntity save(InformationEntity information) {
        return informationRepository.save(information);
    }

    @Override
    public Page<InformationEntity> findAll(Pageable pageable) {
        return informationRepository.findAll(pageable);
    }

    @Override
    public List<InformationEntity> findAll() {

        return (List<InformationEntity>) informationRepository.findAll();
    }

    @Override
    public void deleteById(Long id) {
        informationRepository.deleteById(id);
    }
}
