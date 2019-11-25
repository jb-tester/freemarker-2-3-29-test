package com.mytests.freemarker.freemarker2329test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import reactor.core.publisher.Flux;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MyController {
    @RequestMapping("/test1")
    public String home(Model model) {
        Person[] persons = getPeople().toArray(new Person[0]);
        model.addAttribute("attr1", persons) ;
        return "test1";
    }

    @ModelAttribute("persons")
    List<Person> persons(){

        return getPeople();
    }
    @ModelAttribute("persons_flux")
    public Flux<Person> personFlux(){
        return Flux.fromIterable(getPeople());
    }

    @ModelAttribute("persons_array")
    public Person[] personsArray(){
        return getPeople().toArray(new Person[0]);
    }

    @ModelAttribute("mother")
    public Person mother(){
        return new Person(8, "anna",50, true);
    }

    @ModelAttribute("father")
    public Person father(){
        return new Person(9, "dmitry",50, true);
    }

    private List<Person> getPeople() {
        List<Person> persons = new ArrayList<>();
        persons.add(new Person(1,"vasya",15,true)) ;
        persons.add(new Person(2,"masha",10,true)) ;
        persons.add(new Person(3,"sasha",40,false)) ;
        persons.add(new Person(4,"dasha",40,false)) ;
        persons.add(new Person(5,"petya",30,true)) ;
        persons.add(new Person(6,"ivan",75,true)) ;
        persons.add(new Person(7,"katya",20,true)) ;
        return persons;
    }

}
