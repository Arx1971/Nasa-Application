package com.nasa.space.model;


import javax.persistence.*;

@Entity
@Table(name = "university_info")
public class University {

    @Id
    @Column(name = "university_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String universityName;

}
