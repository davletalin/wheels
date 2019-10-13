package kz.epam.davletalin.database.dao;

import kz.epam.davletalin.database.ConnectionPool;
import kz.epam.davletalin.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
                user = initialize(user, resultSet);
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
        final String sql = "SELECT * FROM user;";
        User user=new User();
        List<User> users=new ArrayList<>();
        Connection connection = CONNECTION_POOL.retrieve();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = initialize(user, resultSet);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CONNECTION_POOL.putBack(connection);
        }
        return users;
    }

    @Override
    public void save(User user) {
        final String sql = "INSERT INTO user (login, password, first_name, last_name, email, phone, role_id, reg_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        Connection connection = CONNECTION_POOL.retrieve();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setLong(6, user.getPhone());
            preparedStatement.setInt(7, 2);//TODO fix Role input
            preparedStatement.setString(8, user.getRegDate().toString());//TODO fix date input
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CONNECTION_POOL.putBack(connection);
        }
    }

    @Override
    public void update(User user, String[] params) {

    }

    public void update(User user) {
        final String sql = "UPDATE user SET password = ?, first_name = ?, last_name = ?, email = ?, phone = ? WHERE login=?";
        Connection connection = CONNECTION_POOL.retrieve();
        try(PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getFirstName());
            preparedStatement.setString(3, user.getLastName());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setLong(5, user.getPhone());
            preparedStatement.setString(6, user.getLogin());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CONNECTION_POOL.putBack(connection);
        }
    }

    @Override
    public void delete(User user) {
        final String sql = "DELETE FROM user WHERE login = ?";
        Connection connection = CONNECTION_POOL.retrieve();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, user.getLogin());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CONNECTION_POOL.putBack(connection);
        }

    }

    @Override
    public User initialize(User user, ResultSet resultSet) throws SQLException {
        user.setId(resultSet.getLong("user_id"));
        user.setLogin(resultSet.getString("login"));
        user.setPassword(resultSet.getString("password"));
        user.setFirstName(resultSet.getString("first_name"));
        user.setLastName(resultSet.getString("last_name"));
        user.setEmail(resultSet.getString("email"));
        user.setPhone(resultSet.getLong("phone"));
        user.setRegDate(resultSet.getTimestamp("reg_date"));
        return user;
    }
}
