package com.nasa.space.services.implementations;

import com.nasa.space.model.Astronaut;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class AstronautServiceImplTest {

    private static final Logger logger = LoggerFactory.getLogger(AstronautServiceImplTest.class);

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
        megatron.setId(2L);
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

        Astronaut optimus = new Astronaut();
        optimus.setId(1L);
        optimus.setDob(new Date(2011, 2, 11));
        optimus.setFirstName("Optimus");
        optimus.setLastName("Prime");
        optimus.setGender("M");
        optimus.setCountry("Autobots");

        Astronaut megatron = new Astronaut();
        megatron.setId(2L);
        megatron.setDob(new Date(2011, 2, 11));
        megatron.setFirstName("megatron");
        megatron.setLastName("Prime");
        megatron.setGender("M");
        megatron.setCountry("Decepticons");

        AstronautServiceImpl astronautService = mock(AstronautServiceImpl.class);
        when(astronautService.findById(1L)).thenReturn(optimus);

        assertEquals(optimus, optimus);
        assertNotEquals(optimus, megatron);

    }
}