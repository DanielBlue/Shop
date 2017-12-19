package pers.mao.shop.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import pers.mao.shop.utils.DataSourceUtils;

import javax.sql.DataSource;
import java.sql.SQLException;

public class UserDao {

    public long getUserCount(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from user where username = ?";
        Long query = (Long) runner.query(sql,new ScalarHandler(),username);
        return query;
    }
}
