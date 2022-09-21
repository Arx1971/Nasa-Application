package com.nasa.space.services.implementations;

import com.nasa.space.model.Astronaut;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class AstronautServiceImplTest {

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    void findAll() {

        Astronaut optimus = new Astronaut();
        optimus.setId(1L);
        optimus.setDob(new Date(2011, 2, 11));
        optimus.setFirstName("Optimus");
        optimus.setLastName("Prime");
        optimus.setGender("M");
        optimus.setCountry("Autobots");

        Astronaut megatron = new Astronaut();
        megatron.setId(1L);
        megatron.setDob(new Date(1965, 3, 15));
        megatron.setFirstName("Megatron");
        megatron.setLastName("Check");
        megatron.setGender("M");
        megatron.setCountry("Decepticons");

        List<Astronaut> astronautList = Arrays.asList(optimus, megatron);

        AstronautServiceImpl astronautService = mock(AstronautServiceImpl.class);
        when(astronautService.findAll()).thenReturn(astronautList);

        assertEquals(astronautList, astronautService.findAll());

    }

    @Test
    void findById() {
    }
}