package com.wu.service;

import com.wu.bean.Department;
import com.wu.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    /**
     * aaaa
     */
    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department>  getdeps(){
        List<Department> departments = departmentMapper.selectByExample(null);
        return  departments;
    }

}
