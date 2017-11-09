package com.tanzhouedu.pm.dao.mapper.test;

import com.tanzhouedu.pm.dao.mapper.UserMapper;
import com.tanzhouedu.pm.entity.User;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/7/20.
 */
@ContextConfiguration(locations = {"classpath*:/spring-core.xml"})
public class UserMapperTest extends AbstractJUnit4SpringContextTests {

    @Resource
    private UserMapper userMapper;

    @Test
    public void testQueryAllUser () {
        User user = new User();

    }
}
