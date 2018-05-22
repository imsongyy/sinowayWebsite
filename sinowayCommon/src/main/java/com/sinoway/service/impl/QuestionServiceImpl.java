package com.sinoway.service.impl;

import com.sinoway.dao.QuestionRepository;
import com.sinoway.entity.QuestionEntity;
import com.sinoway.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by souyouyou on 2018/4/27.
 */
@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;


    @Override
    public Page<QuestionEntity> findAll(Pageable pageable) {
        return questionRepository.findAll(pageable);
    }

    @Override
    public QuestionEntity findOne(Long id) {
        return questionRepository.findById(id).get();
    }

    @Override
    public QuestionEntity save(QuestionEntity entity) {
        return questionRepository.save(entity);
    }

    @Override
    public List<QuestionEntity> findCommon() {
        return questionRepository.findByTypeIsNull();
    }

    @Override
    public List<QuestionEntity> findOwn() {
        return questionRepository.findByTypeIsNotNull();
    }

    @Override
    public void deleteByid(Long id) {
        questionRepository.deleteById(id);
    }
}
