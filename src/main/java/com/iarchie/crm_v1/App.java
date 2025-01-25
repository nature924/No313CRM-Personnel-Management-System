package com.iarchie.crm_v1;


import com.iarchie.crm_v1.domain.Department;
import com.iarchie.crm_v1.domain.Employee;
import com.iarchie.crm_v1.domain.Position;
import com.iarchie.crm_v1.domain.User;
import com.iarchie.crm_v1.service.IDepartmentService;
import com.iarchie.crm_v1.service.IEmployeeService;
import com.iarchie.crm_v1.service.IPositionService;
import com.iarchie.crm_v1.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "classpath:applicationContext.xml")
public class App {


    @Autowired
    private IUserService service;

    @Autowired
    private IEmployeeService employeeService;

    @Autowired
    private IPositionService positionService;
    @Autowired
    private IDepartmentService departmentService;

    @Test
    public void test() {
      List<User> users = service.selectAll("d",null);
        for (User user : users) {
            System.out.println("user = " + user);
        }
    }


    @Test
    public void testPage() {

        List<User> users = service.selectPageResult(1, 5);
        for (User user : users) {
            System.out.println("user = " + user);
        }
    }

    @Test
    public void testEmpList() {

        List<Employee> employees = employeeService.selectAll();
        for (Employee employee : employees) {
            System.out.println("employee = " + employee.getDeptId().getDeptname());
        }
    }

    @Test
    public void testPositionList() {
        List<Position> positions = positionService.selectAll("DBA");

        for (Position position : positions) {
            System.out.println("position = " + position);
        }
    }

    @Test
    public void deptList(){

        List<Department> list = departmentService.selectAll("技术");
        for (Department department : list) {
            System.out.println("department = " + department);
        }
    }


}
