package namedEntity;

import java.util.ArrayList;
import java.util.List;

import namedEntity.person.Person;
import namedEntity.person.LastName;
import namedEntity.person.Name;
import namedEntity.person.Title;

import namedEntity.place.Place;
import namedEntity.place.City;
import namedEntity.place.Country;
import namedEntity.place.Direction;
import namedEntity.place.OtherPlace;

public class NamedEntityFactory {
    public enum NamedEntityType {
        Company,
        Date,
        Event,
        Product,
        Other,
        Person,
        LastName,
        Name,
        Title,
        Place,
        City,
        Country,
        Direction,
        OtherPlace
    }

    public List<NamedEntity> neCount = new ArrayList<NamedEntity>();

    public NamedEntity create(NamedEntity ne) throws Exception {
        NamedEntityType neType = NamedEntityType
                .valueOf(ne.getCategory().substring(0, 1).toUpperCase() + ne.getCategory().substring(1));

        NamedEntity newNe;
        switch (neType) {
            case Company:
                newNe = new Company(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Date:
                newNe = new Date(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Event:
                newNe = new Event(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Product:
                newNe = new Product(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Other:
                newNe = new Other(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Person:
                newNe = new Person(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case LastName:
                newNe = new LastName(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Name:
                newNe = new Name(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Title:
                newNe = new Title(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Place:
                newNe = new Place(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case City:
                newNe = new City(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Country:
                newNe = new Country(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case Direction:
                newNe = new Direction(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            case OtherPlace:
                newNe = new OtherPlace(ne.getName(), ne.getCategory(), ne.getFrequency());
                break;
            default:
                throw new Exception("Tipo de categoría no valida.");
        }

        return newNe;
    }

}
