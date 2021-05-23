package com.nasa.space.services;

import com.nasa.space.model.University;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UniversityService {

    List<University> findAll();

    University findById(Long id);

    University save(University university);

    void delete(University university);

    void deleteById(Long id);

}
