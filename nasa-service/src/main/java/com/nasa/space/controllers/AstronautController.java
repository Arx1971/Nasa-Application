package com.nasa.space.controllers;

import com.nasa.space.model.Astronaut;
import com.nasa.space.services.AstronautService;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/astronaut")
public class AstronautController {

    private static final Logger logger = LoggerFactory.getLogger(AstronautController.class);

    private final AstronautService astronautService;

    @Autowired
    public AstronautController(AstronautService astronautService) {
        this.astronautService = astronautService;
    }

    @RequestMapping(method = RequestMethod.GET, path = "/getAllAstronautInfo")
    public ResponseEntity<List<Astronaut>> getAstronautsInfo() {
        return ResponseEntity.ok(astronautService.findAll());
    }

    @RequestMapping(method = RequestMethod.GET, path = "/getAstronautById/{id}")
    public ResponseEntity<?> getAstronautById(@PathVariable Long id) {
        Astronaut astronaut = astronautService.findById(id);
        return astronaut != null ?
                new ResponseEntity<>(astronaut, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(method = RequestMethod.POST, path = "/save")
    public ResponseEntity<?> saveAstronaut(@RequestBody Astronaut astronaut) {
        return ResponseEntity.ok(astronautService.save(astronaut));
    }

}
