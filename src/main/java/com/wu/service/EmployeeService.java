package com.wu.service;

import com.wu.bean.Employee;
import com.wu.utils.Msg;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface EmployeeService {
    public List<Employee> getAll();

    void saveemp(Employee employee);

    Boolean check(String name);

    Employee getup(Integer id);

    void upsave(Employee employee);

   void delete(Integer id);

    void deleteBatch(List<Integer> strings);
}
