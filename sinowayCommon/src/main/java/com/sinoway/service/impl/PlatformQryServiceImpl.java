package com.sinoway.service.impl;

import com.sinoway.dao.PlatformQryRepository;
import com.sinoway.entity.PlatformQryEntity;
import com.sinoway.service.PlatformQryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Iterator;

/**
 * Created by souyouyou on 2018/5/17.
 */

@Service
public class PlatformQryServiceImpl implements PlatformQryService {

    @Autowired
    private PlatformQryRepository platformQryRepository;

    @Override
    public Page<PlatformQryEntity> findAll(Pageable pageable) {
        return platformQryRepository.findAll(pageable);
    }

    @Override
    public PlatformQryEntity findOne(Long id) {
        return platformQryRepository.findById(id).get();
    }

    @Override
    public Iterator<PlatformQryEntity> findAll() {
        Sort sort = new Sort(Sort.Direction.ASC,"timeframe");
        return platformQryRepository.findAll(sort).iterator();
    }

    @Override
    public PlatformQryEntity save(PlatformQryEntity entity) {
        return platformQryRepository.save(entity);
    }

    @Override
    public void delete(Long id) {
        platformQryRepository.deleteById(id);
    }
}
