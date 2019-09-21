package kz.epam.davletalin.entity;

import java.sql.Timestamp;

public class Ad {
    private long id;
    private User user;
    private Timestamp publication_date;
    private Vechicle vechicle;

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
}
