package kz.epam.davletalin.entity;

public class Vechicle {
    private long id;
    private String make;
    private String model;
    private String color;
    private String body;

    public Vechicle() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    @Override
    public String toString() {
        return "Vechicle{" +
                "id=" + id +
                ", make='" + make + '\'' +
                '}';
    }
}
