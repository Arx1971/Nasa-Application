package com.nasa.space.services;

import com.nasa.space.model.Astronaut;

import java.util.List;

public interface AstronautService {

    List<Astronaut> findAll();

    Astronaut findById(Long id);

    Astronaut save(Astronaut astronaut);

    void delete(Astronaut astronaut);

    void deleteById(Long id);
}
