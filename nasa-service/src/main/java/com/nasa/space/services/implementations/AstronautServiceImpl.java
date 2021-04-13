package com.nasa.space.services.implementations;

import com.nasa.space.model.Astronaut;
import com.nasa.space.repositories.AstronautRepository;
import com.nasa.space.services.AstronautService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
public class AstronautServiceImpl implements AstronautService {

    private final AstronautRepository astronautRepository;

    @Autowired
    public AstronautServiceImpl(AstronautRepository astronautRepository) {
        this.astronautRepository = astronautRepository;
    }

    @Override
    public List<Astronaut> findAll() {
        return astronautRepository.findAll();
    }

    @Override
    public Astronaut findById(Long id) {
        return astronautRepository.findById(id).orElse(null);
    }

    @Override
    public Astronaut Save(Astronaut astronaut) {
        return null;
    }

    @Override
    public void delete(Astronaut astronaut) {

    }

    @Override
    public void deleteById(Long id) {

    }
}
