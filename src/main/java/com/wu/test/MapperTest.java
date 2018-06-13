package com.wu.test;
import com.wu.bean.Department;
import com.wu.bean.Employee;
import com.wu.dao.DepartmentMapper;
import com.wu.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/application.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public   void  crud() {
       /* //1获取容器
        ClassPathXmlApplicationContext ioc =
                new ClassPathXmlApplicationContext("application.xml");
        //2获取容器中的mapper
        EmployeeMapper bean = ioc.getBean(EmployeeMapper.class);
*/
//        departmentMapper.insertSelective(new Department(null,"测试部"));
//        departmentMapper.insertSelective(new Department(null,"开发部"));

/*        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i=0;i<100;i++) {
            String substring = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,substring,"M",substring+"@qq.com",1));
        }
        System.out.println("OK");
    }*/
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        for (Employee e:employees
             ) {
            Integer id = e.getDepartment().getId();
            String name = e.getDepartment().getName();
            System.out.println(id+"和"+name);
        }
    }




}
