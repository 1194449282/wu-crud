package com.wu.controller;


import com.wu.bean.Department;
import com.wu.service.DepartmentService;
import com.wu.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
    @RequestMapping("/deps")
    @ResponseBody
    public Msg getdeps(){
        List<Department> getdeps = departmentService.getdeps();
      return Msg.success().add("deps",getdeps);
    };


}
