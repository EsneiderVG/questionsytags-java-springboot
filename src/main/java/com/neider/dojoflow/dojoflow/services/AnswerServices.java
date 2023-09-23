package com.neider.dojoflow.dojoflow.services;

import org.springframework.stereotype.Service;

import com.neider.dojoflow.dojoflow.models.Answer;
import com.neider.dojoflow.dojoflow.repositories.AnswerRepository;

@Service
public class AnswerServices extends ServiciosBase<Answer> {

    public AnswerServices(AnswerRepository answerRepository) {
        super(answerRepository);
    }

     
}
