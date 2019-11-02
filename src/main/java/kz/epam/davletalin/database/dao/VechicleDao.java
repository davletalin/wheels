package kz.epam.davletalin.database.dao;

import kz.epam.davletalin.database.ConnectionPool;
import kz.epam.davletalin.entity.Vechicle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VechicleDao implements Dao<Vechicle> {
    private final ConnectionPool CONNECTION_POOL = ConnectionPool.getUniqueInstance();

    @Override
    public Vechicle getById(long id) throws SQLException {
        Connection connection = CONNECTION_POOL.retrieve();
        final String sql = "SELECT * FROM make WHERE id= ?";
        Vechicle vechicle = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                vechicle = new Vechicle();
                vechicle = initialize(vechicle, resultSet);
            }
        } finally {
            CONNECTION_POOL.putBack(connection);
        }
        return vechicle;
    }

    @Override
    public List<Vechicle> getAll() throws SQLException {
        final String sql = "SELECT * FROM make ";
        List<Vechicle> vechiclesList = new ArrayList<>();
        Connection connection = CONNECTION_POOL.retrieve();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Vechicle vechicle = new Vechicle();
                vechicle = initialize(vechicle, resultSet);
                vechiclesList.add(vechicle);
            }
        } finally {
            CONNECTION_POOL.putBack(connection);
        }
        return vechiclesList;
    }

    @Override
    public void save(Vechicle vechicle) throws SQLException {
        final String sql = "INSERT INTO vechicle (make, model, country, body, color, engine, " +
                "transmission, mileage, wheel_drive) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection connection = CONNECTION_POOL.retrieve();
        try(PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt();
        }catch (SQLException e){
            e.printStackTrace();//log
            connection.rollback();//?
        }finally {
            CONNECTION_POOL.putBack(connection);
        }

    }

    @Override
    public void update(Vechicle vechicle, String[] params) {

    }

    @Override
    public void delete(Vechicle vechicle) {

    }

    @Override
    public Vechicle initialize(Vechicle vechicle, ResultSet resultSet) {
        try {
            vechicle.setId(resultSet.getLong("vechicle_id"));
            vechicle.setMake(resultSet.getString("make"));
            vechicle.setModel(resultSet.getString("model"));
            vechicle.setCountry(resultSet.getString("country"));
            vechicle.setBody(resultSet.getString("body"));
            vechicle.setColor(resultSet.getString("color"));
            vechicle.setEngine(resultSet.getString("engine"));
            vechicle.setTransmission(resultSet.getString("transmission"));
            vechicle.setMileage(Integer.parseInt(resultSet.getString("mileage")));
            vechicle.setWheelDrive(resultSet.getString("wheel_drive"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vechicle;
    }
}
