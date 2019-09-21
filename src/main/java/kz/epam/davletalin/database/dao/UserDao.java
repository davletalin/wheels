package kz.epam.davletalin.database.dao;

import kz.epam.davletalin.database.ConnectionPool;
import kz.epam.davletalin.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDao implements Dao<User> {
    private final ConnectionPool CONNECTION_POOL = ConnectionPool.getUniqueInstance();

    @Override
    public User getById(long id) {
        return null;
    }

    public User getByLogin(String login) {
        final String sql = "SELECT * FROM user WHERE Login = ?";
        User user = new User();
        Connection connection = CONNECTION_POOL.retrieve();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, login);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                System.out.println("inside resultSet start");
                user = initialize(user,resultSet);
                System.out.println("Inside resultSet finish User by login= "+user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CONNECTION_POOL.putBack(connection);
        }
        return user;
    }

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public void save(User user) {

    }

    @Override
    public void update(User user, String[] params) {

    }

    @Override
    public void delete(User user) {

    }

    @Override
    public User initialize(User user, ResultSet resultSet) throws SQLException {
        user.setId(resultSet.getLong("user_id"));
        user.setLogin(resultSet.getString("login"));
        user.setPassword(resultSet.getString("password"));
        user.setFirst_name(resultSet.getString("first_name"));
        user.setLast_name(resultSet.getString("last_name"));
        user.setReg_date(resultSet.getTimestamp("reg_date"));
        return user;
    }
}
