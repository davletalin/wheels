package kz.epam.davletalin.database.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface Dao<T> {
    T getById(long id) throws SQLException;
    List<T> getAll() throws SQLException;
    void save(T t);
    void update(T t, String[]params);
    void delete(T t);
    T initialize(T t, ResultSet resultSet) throws SQLException;
}
