package com.neider.dojoflow.dojoflow.services;

import org.springframework.stereotype.Service;

import com.neider.dojoflow.dojoflow.models.Question;
import com.neider.dojoflow.dojoflow.repositories.QuestionRepository;

@Service
public class QuestionServices extends ServiciosBase<Question> {

    public QuestionServices(QuestionRepository questionRepository) {
        super(questionRepository);
    }
    
}
