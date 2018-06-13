package com.wu.service;

import com.wu.bean.Employee;
import com.wu.bean.EmployeeExample;
import com.wu.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeeServiceImpl implements  EmployeeService {
    /**
     *
     */
    @Autowired
   EmployeeMapper employeeMapper;
    public List<Employee> getAll() {
        EmployeeExample employeeExample = new EmployeeExample();
        employeeExample.setOrderByClause("e.id");
        List<Employee> employees = employeeMapper.selectByExampleWithDept(employeeExample);
        return employees;
    }

    public void saveemp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public Boolean check(String name) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andNameEqualTo(name);

        long l = employeeMapper.countByExample(employeeExample);
        return l==0;
    }

    public Employee getup(Integer id) {

        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void upsave(Employee employee) {

        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void delete(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> strings) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andIdIn(strings);
        employeeMapper.deleteByExample(employeeExample);
    }
}
