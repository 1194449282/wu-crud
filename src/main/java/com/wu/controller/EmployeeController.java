package com.wu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wu.bean.Employee;
import com.wu.service.EmployeeService;
import com.wu.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;
   /* @RequestMapping("/emps")
    public String getEmp(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model) {
        PageHelper.startPage(pn,5);
        List<Employee> all = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(all, 5);
        model.addAttribute("INFO",pageInfo);
        return "list";
    }*/

    @RequestMapping("/list")
    public String m() {

        return "llist";
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            HashMap<String, String> stringStringHashMap = new HashMap<String, String>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError f:fieldErrors
                 ) {
                System.out.println("错误字段名"+f.getField());
                System.out.println("错误信息"+f.getDefaultMessage());
                stringStringHashMap.put(f.getField(),f.getDefaultMessage());
            }
            return  Msg.fail().add("error",stringStringHashMap);
        }
        employeeService.saveemp(employee);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping("/check")
    public Msg check(@RequestParam("empname")String name) {
        String c ="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!name.matches(c)){
            return Msg.fail().add("va_msg","后端校验用户名可以是2-5位中文或者6-16位英文和数字的组合");
        }

        Boolean check = employeeService.check(name);
        if (check) {
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmp(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        PageHelper.startPage(pn, 5);
        List<Employee> all = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(all, 5);

        return Msg.success().add("INFO", pageInfo);
    }
    @RequestMapping(value = "/getup/{id}",method =RequestMethod.GET)
    @ResponseBody
    public  Msg getup(@PathVariable("id") Integer id){
        Employee getup = employeeService.getup(id);
        return Msg.success().add("up",getup);
    }

    //重要：如果路径有id值 而参数没有包含id值 需要把路径id改为 pojo对象中的id名
    @RequestMapping(value = "/getup/{id}",method =RequestMethod.PUT)
    @ResponseBody
    public  Msg upsave(Employee employee){
         employeeService.upsave(employee);
        return Msg.success();
    }
    @RequestMapping(value = "/getup/{ids}",method =RequestMethod.DELETE)
    @ResponseBody
    public  Msg delete(@PathVariable("ids") String id){
        if (id.contains("-")) {
            ArrayList<Integer> integers = new ArrayList<Integer>();
            String[] split = id.split("-");
            for (String s : split
                    ) {
                int i = Integer.parseInt(s);
                integers.add(i);
            }

            employeeService.deleteBatch(integers);
        } else {
            int i = Integer.parseInt(id);
            employeeService.delete(i);
        }
        return Msg.success();
    }
}
