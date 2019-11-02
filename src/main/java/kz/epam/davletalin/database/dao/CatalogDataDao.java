package kz.epam.davletalin.database.dao;

import kz.epam.davletalin.database.ConnectionPool;
import kz.epam.davletalin.entity.CatalogRetriever;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CatalogDataDao implements Dao<CatalogRetriever> {
    private final ConnectionPool CONNECTION_POOL = ConnectionPool.getUniqueInstance();

    @Override
    public CatalogRetriever getById(long id) throws SQLException {
        return null;
    }

    @Override
    public List<CatalogRetriever> getAll() throws SQLException {
        return null;
    }

    public List<CatalogRetriever> getAll(String tableName) {
        final String sql = "SELECT * FROM " + tableName + ";";
        List<CatalogRetriever> catalogRetrievers = new ArrayList<>();
        Connection connection = CONNECTION_POOL.retrieve();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                CatalogRetriever catalogRetriever = new CatalogRetriever();
                catalogRetriever = initialize(catalogRetriever, resultSet, "ru");
                catalogRetrievers.add(catalogRetriever);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CONNECTION_POOL.putBack(connection);
        }
        return catalogRetrievers;
    }

    @Override
    public void save(CatalogRetriever catalogRetriever) {

    }

    @Override
    public void update(CatalogRetriever catalogRetriever, String[] params) {

    }

    @Override
    public void delete(CatalogRetriever catalogRetriever) {

    }

    @Override
    public CatalogRetriever initialize(CatalogRetriever catalogRetriever, ResultSet resultSet) throws SQLException {
        return null;
    }

    public CatalogRetriever initialize(CatalogRetriever catalogRetriever, ResultSet resultSet, String locale) throws SQLException {
        catalogRetriever.setId(resultSet.getLong("id"));
        catalogRetriever.setName(resultSet.getString("name_en"));
        return catalogRetriever;
    }
}
