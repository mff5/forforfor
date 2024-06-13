package homepage;

import java.sql.Connection;
import java.sql.SQLException;

public class PooledConnection implements AutoCloseable {
    private final Connection connection;
    private final ConnectionPool pool;

    public PooledConnection(Connection connection, ConnectionPool pool) {
        this.connection = connection;
        this.pool = pool;
    }

    public Connection getConnection() {
        return connection;
    }

    @Override
    public void close() {
        try {
            pool.releaseConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
