package com.javarush.test.repos;

import com.javarush.test.domen.Part;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PartRepo extends CrudRepository<Part, Integer> {
    List<Part> findByName(String name);
    List<Part> findByNecessary(Boolean necessary);
}
