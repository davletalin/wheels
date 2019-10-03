package kz.epam.davletalin.entity;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

public class Ad {
    private long id;
    private User user;
    private Timestamp publication_date;
    private Vechicle vechicle;
    private String city;
    private Long price;
    private String description;
    private List<File> photos;

    public Ad() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Timestamp getPublication_date() {
        return publication_date;
    }

    public void setPublication_date(Timestamp publication_date) {
        this.publication_date = publication_date;
    }

    public Vechicle getVechicle() {
        return vechicle;
    }

    public void setVechicle(Vechicle vechicle) {
        this.vechicle = vechicle;
    }

    public List<File> getPhotos() {
        return photos;
    }

    public void setPhotos(List<File> photos) {
        this.photos = photos;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
