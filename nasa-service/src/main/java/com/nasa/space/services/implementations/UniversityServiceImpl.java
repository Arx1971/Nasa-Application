package com.nasa.space.services.implementations;

import com.nasa.space.model.University;
import com.nasa.space.repositories.UniversityRepository;
import com.nasa.space.services.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UniversityServiceImpl implements UniversityService {

    @Autowired
    private UniversityRepository universityRepository;

    @Override
    public List<University> findAll() {
        return universityRepository.findAll();
    }

    @Override
    public University findById(Long id) {
        return universityRepository.findById(id).orElse(null);
    }

    @Override
    public University save(University university) {
        university.setId(0L);
        return universityRepository.save(university);
    }

    @Override
    public void delete(University university) {

    }

    @Override
    public void deleteById(Long id) {

    }
}
