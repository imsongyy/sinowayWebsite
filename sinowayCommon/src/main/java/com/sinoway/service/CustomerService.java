package com.sinoway.service;

import com.sinoway.entity.CustomerEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


/**
 * Created by souyouyou on 2018/4/13.
 */
public interface CustomerService {
    CustomerEntity save(CustomerEntity customerEntity);

    CustomerEntity findById(Long id);

    CustomerEntity findByUsername(String userName);

    CustomerEntity findByContactsNumber(String contactsNumber);

    Page<CustomerEntity> findAll(Pageable pageable);

    void deleteById(Long id);
}
