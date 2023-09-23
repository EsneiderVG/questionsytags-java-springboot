package com.neider.dojoflow.dojoflow.repositories;

import com.neider.dojoflow.dojoflow.models.Tag;

public interface TagRepository extends RepositorioBase<Tag> {
    Tag findBySubject(String subject);
}
