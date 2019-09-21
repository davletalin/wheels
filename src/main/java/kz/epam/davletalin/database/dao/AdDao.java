package kz.epam.davletalin.database.dao;

import kz.epam.davletalin.entity.Ad;

import java.sql.ResultSet;
import java.util.List;

public class AdDao implements Dao<Ad> {
    @Override
    public Ad getById(long id) {
        return new Ad();
    }

    @Override
    public List<Ad> getAll() {
        return null;
    }

    @Override
    public void save(Ad ad) {

    }

    @Override
    public void update(Ad ad, String[] params) {

    }

    @Override
    public void delete(Ad ad) {

    }

    @Override
    public Ad initialize(Ad ad, ResultSet resultSet) {
        return null;
    }
}
