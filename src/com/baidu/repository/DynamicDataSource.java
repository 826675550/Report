package com.baidu.repository;

/**
 * Created by null on 2017/11/4.
 */
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * @author : Linda
 * @create : 2017-10-24 17:00
 * @desc :
 */
public class DynamicDataSource extends AbstractRoutingDataSource{
    @Override
    protected Object determineCurrentLookupKey() {
        return DbContextHolder.getDbType();
    }
}
