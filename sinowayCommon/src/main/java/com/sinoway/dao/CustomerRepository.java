package com.sinoway.dao;

import com.sinoway.entity.CustomerEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by souyouyou on 2018/4/13.
 */
public interface CustomerRepository extends CrudRepository<CustomerEntity,Long> {

    Page<CustomerEntity> findAll(Specification<CustomerEntity> specification, Pageable pageable);

    Page<CustomerEntity> findByAuditStatusIsNotNullAndDeletedIsFalse(Pageable pageable);

    CustomerEntity findByUsernameAndActivatedIsTrue(String username);

    CustomerEntity findByContactsNumber(String contactsNumber);

    void  deleteById(Long id);

}
