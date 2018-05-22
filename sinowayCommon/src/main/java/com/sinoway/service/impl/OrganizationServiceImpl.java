package com.sinoway.service.impl;

import com.sinoway.dao.OrganizationRepository;
import com.sinoway.entity.OrganizationEntity;
import com.sinoway.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

/**
 * Created by souyouyou on 2018/5/17.
 */
@Service
public class OrganizationServiceImpl implements OrganizationService{

    @Autowired
    private OrganizationRepository organizationRepository;

    @Override
    public Page<OrganizationEntity> findAll(Pageable pageable) {
        return organizationRepository.findAll(pageable);
    }

    @Override
    public OrganizationEntity findOne(Long id) {
        return organizationRepository.findById(id).get();
    }

    @Override
    public Iterator<OrganizationEntity> findAll() {
        Sort sort = new Sort(Sort.Direction.ASC,"timeframe");
        return  organizationRepository.findAll(sort).iterator();
    }

    @Override
    public OrganizationEntity save(OrganizationEntity entity) {
        return organizationRepository.save(entity);
    }

    @Override
    public void delete(Long id) {
        organizationRepository.deleteById(id);
    }
}
