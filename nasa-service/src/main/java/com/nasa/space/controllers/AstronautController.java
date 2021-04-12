package com.nasa.space.controllers;

import com.nasa.space.model.Astronaut;
import com.nasa.space.services.AstronautService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/astronaut")
public class AstronautController {

    private final AstronautService astronautService;

    @Autowired
    public AstronautController(AstronautService astronautService) {
        this.astronautService = astronautService;
    }

    @RequestMapping(method = RequestMethod.GET, path = "/getAllAstronautInfo")
    public ResponseEntity<List<Astronaut>> getAstronautsInfo() {
        return ResponseEntity.ok(astronautService.findAll());
    }

}
