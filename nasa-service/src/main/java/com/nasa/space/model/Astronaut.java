package com.nasa.space.model;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "astronaut_info")
public class Astronaut {

    @Id
    @Column(name = "astronaut_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "astronaut_fname")
    private String firstName;

    @Column(name = "astronaut_lname")
    private String lastName;

    @Column(name = "astronaut_dob")
    private Date dob;

    @Column(name = "astronaut_country")
    private String country;

    @Column(name = "astronaut_gender")
    private String gender;

    public Astronaut() {

    }

    public Astronaut(Long id, String firstName, String lastName, Date dob, String country, String gender) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
        this.country = country;
        this.gender = gender;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Astronaut)) return false;
        Astronaut astronaut = (Astronaut) o;
        return id.equals(astronaut.id) &&
                firstName.equals(astronaut.firstName) &&
                lastName.equals(astronaut.lastName) &&
                dob.equals(astronaut.dob) &&
                Objects.equals(country, astronaut.country) &&
                Objects.equals(gender, astronaut.gender);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, firstName, lastName, dob, country, gender);
    }
}
