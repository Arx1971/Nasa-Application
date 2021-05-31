package com.nasa.space.controllers;

import com.nasa.space.model.University;
import com.nasa.space.services.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/api/university")
public class UniversityController {

    private UniversityService universityService;

    @Autowired
    public UniversityController(UniversityService universityService) {
        this.universityService = universityService;
    }

    @RequestMapping(method = RequestMethod.GET, path = "/getAllUniversity")
    public ResponseEntity<List<University>> getUniversity() {
        List<University> universities = universityService.findAll();
        return ResponseEntity.ok(universities);
    }

}
