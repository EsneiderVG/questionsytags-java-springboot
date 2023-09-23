package com.neider.dojoflow.dojoflow.repositories;

import java.util.List;

import org.springframework.data.domain.PageRequest;

import com.neider.dojoflow.dojoflow.models.Answer;

public interface AnswerRepository extends RepositorioBase<Answer>{
    List<Answer> findAllBy(PageRequest pageRequest);
}
