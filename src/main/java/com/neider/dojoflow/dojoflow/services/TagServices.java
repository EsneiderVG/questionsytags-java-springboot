package com.neider.dojoflow.dojoflow.services;

import org.springframework.stereotype.Service;

import com.neider.dojoflow.dojoflow.models.Tag;
import com.neider.dojoflow.dojoflow.repositories.TagRepository;

@Service
public class TagServices extends ServiciosBase<Tag>{

    public TagServices(TagRepository tagRepository) {
        super(tagRepository);
    }
    
}
   