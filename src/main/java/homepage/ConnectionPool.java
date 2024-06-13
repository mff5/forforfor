package homepage;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public final class ConnectionPool {
    static {
        try {
            Connection con = DBUtil.getConnection();
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private final ArrayList<Connection> free;
    private final ArrayList<Connection> using;
    private final int initialCons;
    private final int maxCons;
    private int numCons = 0;
    private static ConnectionPool cp;

    public static ConnectionPool getInstance() {
        if (cp == null) {
            synchronized (ConnectionPool.class) {
                if (cp == null) {
                    try {
                        cp = new ConnectionPool();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return cp;
    }

    private ConnectionPool() throws SQLException {
        free = new ArrayList<>();
        using = new ArrayList<>();
        this.initialCons = 10;
        this.maxCons = 20;

        for (int i = 0; i < initialCons; i++) {
            addConnection();
        }
    }

    private void addConnection() throws SQLException {
        free.add(getNewConnection());
        numCons++;
    }

    private Connection getNewConnection() throws SQLException {
        Connection con = DBUtil.getConnection();
        System.out.println("About to connect to " + con);
        return con;
    }

    public PooledConnection getPooledConnection() throws SQLException {
        Connection _con;
        synchronized (this) {
            if (free.isEmpty() && numCons < maxCons) {
                addConnection();
            }
            if (free.isEmpty()) {
                throw new SQLException("Maximum number of connections reached.");
            }
            _con = free.remove(free.size() - 1);
            using.add(_con);
        }

        if (!_con.isValid(2)) {
            _con = getNewConnection();
        }
        return new PooledConnection(_con, this);
    }

    public void releaseConnection(Connection _con) throws SQLException {
        synchronized (this) {
            if (using.remove(_con)) {
                if (_con.isValid(2)) {
                    free.add(_con);
                } else {
                    _con.close();
                    numCons--;
                }
            } else {
                throw new SQLException("ConnectionPool 에 있지 않네요!!");
            }
        }
    }

    public void closeAll() {
        synchronized (this) {
            for (Connection _con : using) {
                try {
                    _con.close();
                } catch (SQLException sqle) {
                    sqle.printStackTrace();
                }
            }
            using.clear();

            for (Connection _con : free) {
                try {
                    _con.close();
                } catch (SQLException sqle) {
                    sqle.printStackTrace();
                }
            }
            free.clear();
            numCons = 0;
        }
    }

    public int getMaxCons() {
        return maxCons;
    }

    public int getNumCons() {
        return numCons;
    }
}
