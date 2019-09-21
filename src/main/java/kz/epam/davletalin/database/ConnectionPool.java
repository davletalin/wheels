package kz.epam.davletalin.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.TimeZone;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class ConnectionPool {
    private static ConnectionPool instance;
    private static final ConnectionPool UNIQUE_INSTANCE = new ConnectionPool();
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/wheels";
    private static final String USER = "root";
    private static final String PASSWORD = "root";
    private final BlockingQueue<Connection> CONNECTION_QUEUE = new ArrayBlockingQueue<>(5);
    private BlockingQueue<Connection> connectionQueue;


    private ConnectionPool() {
        try {
            Class.forName(DRIVER);
        } catch (Exception e) {
//            ROOT_LOGGER.error(e);
            e.printStackTrace();
        }

        for (int i = 1; i <= 5; i++) {
            try {
                CONNECTION_QUEUE.put(getConnection());
            } catch (InterruptedException e) {
//                ROOT_LOGGER.error(e);
                e.printStackTrace();

            }
        }
    }

    public static ConnectionPool getUniqueInstance() {
        return UNIQUE_INSTANCE;
    }

    private Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
//            ROOT_LOGGER.error(e);
            e.printStackTrace();

        }
        return connection;
    }

    public Connection retrieve() {
        Connection connection = null;
        try {
            connection = CONNECTION_QUEUE.take();
        } catch (InterruptedException e) {
//            ROOT_LOGGER.error(e);
            e.printStackTrace();

        }
        return connection;
    }

    public void putBack(Connection connection) /*throws ConnectionNotFoundException*/ {
        if (connection != null) {
            try {
                CONNECTION_QUEUE.put(connection);
            } catch (InterruptedException e) {
//                ROOT_LOGGER.error(e);
                e.printStackTrace();

            }
//        } else {
//            ROOT_LOGGER.error(CONNECTION_NOT_FOUND_EXCEPTION);
//            throw new ConnectionNotFoundException();
        }
    }
}

