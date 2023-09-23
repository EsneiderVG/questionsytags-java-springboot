package com.neider.dojoflow.dojoflow.services;

import java.util.List;
import java.util.Optional;

import com.neider.dojoflow.dojoflow.repositories.RepositorioBase;

public class ServiciosBase<T> {
    
    private RepositorioBase<T> repositorioBase;

    public ServiciosBase(RepositorioBase<T> repositorioBase) {
        this.repositorioBase = repositorioBase;
    }

    public List<T> findAll() {
        return repositorioBase.findAll();
    }

    public T findById(Long id) {
        Optional<T> optionalSong = repositorioBase.findById(id);
        if (optionalSong.isPresent()) {
          return optionalSong.get();
        } else {
          return null;
        }
    }

    public T save(T object) {
        return repositorioBase.save(object);
    }

    public void delete(Long id){
        repositorioBase.deleteById(id);
    }

} 