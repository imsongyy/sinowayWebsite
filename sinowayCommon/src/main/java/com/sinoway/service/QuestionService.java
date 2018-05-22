package com.sinoway.service;

import com.sinoway.entity.QuestionEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by souyouyou on 2018/4/27.
 */
public interface QuestionService {

    Page<QuestionEntity> findAll(Pageable pageable);

    QuestionEntity findOne(Long id);

    QuestionEntity save(QuestionEntity entity);

    List<QuestionEntity> findCommon();
    List<QuestionEntity> findOwn();

    void deleteByid(Long id);
}
