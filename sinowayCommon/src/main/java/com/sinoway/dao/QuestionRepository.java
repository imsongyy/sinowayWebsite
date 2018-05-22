package com.sinoway.dao;

import com.sinoway.entity.QuestionEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by souyouyou on 2018/4/27.
 */
public interface QuestionRepository extends CrudRepository<QuestionEntity,Long>{

        Page<QuestionEntity> findAll(Pageable pageable);

        List<QuestionEntity> findByTypeIsNull();
        List<QuestionEntity> findByTypeIsNotNull();

        void deleteById(Long id);
}
