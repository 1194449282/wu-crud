package com.wu.test;


import com.github.pagehelper.PageInfo;
import com.wu.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring/application.xml","classpath:spring/spring-mvc.xml"})
public class MvcTest {

    @Autowired
    WebApplicationContext webApplicationContext;
    MockMvc mockMvc;
    @Before
    public void initMock(){
         mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
    @Test
    public  void testpage() throws Exception {
        MvcResult pn = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
        MockHttpServletRequest request = pn.getRequest();
        PageInfo info = (PageInfo)request.getAttribute("INFO");
        System.out.println(info.getPageNum());
        System.out.println(info.getPages());
        System.out.println(info.getTotal());
        int[] navigatepageNums = info.getNavigatepageNums();
        for (int i:navigatepageNums
             ) {
            System.out.println(""+i);
        }
        List<Employee> list = info.getList();
        for (Employee e:list
             ) {
            System.out.println(e.getId()+"和"+e.getName());

        }

    }

}
