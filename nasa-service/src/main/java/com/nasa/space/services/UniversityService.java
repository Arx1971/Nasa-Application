package com.nasa.space.services;

import com.nasa.space.model.University;

import java.util.List;

public interface UniversityService {

    List<University> findAll();

    University findById(Long id);

    University save(University university);

    void delete(University university);

    void deleteById(Long id);

}
