package com.sinoway.service.impl;

import com.sinoway.dao.CustomerRepository;
import com.sinoway.entity.CustomerEntity;
import com.sinoway.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created by souyouyou on 2018/4/13.
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;


    @Override
    public CustomerEntity save(CustomerEntity customerEntity) {
        return customerRepository.save(customerEntity);
    }

    @Override
    public CustomerEntity findById(Long id) {

        return customerRepository.findById(id).get();
    }

    @Override
    public CustomerEntity findByUsername(String userName) {
        return customerRepository.findByUsernameAndActivatedIsTrue(userName);
    }

    @Override
    public CustomerEntity findByContactsNumber(String contactsNumber) {
        return customerRepository.findByContactsNumber(contactsNumber);
    }

    @Override
    public Page<CustomerEntity> findAll(Pageable pageable) {
        return customerRepository.findByAuditStatusIsNotNullAndDeletedIsFalse(pageable);
    }

    @Override
    public void deleteById(Long id) {
        customerRepository.deleteById(id);
    }


}
