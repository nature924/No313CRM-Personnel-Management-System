package com.iarchie.crm_v1.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.iarchie.crm_v1.domain.Department;
import com.iarchie.crm_v1.domain.Employee;
import com.iarchie.crm_v1.domain.Position;
import com.iarchie.crm_v1.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 * 类描述信息 员工Controller处理类
 *
 * @author Tomlin
 * @ClassName EmployeeController
 * @Description: TODO
 * @date 2018/12/25 9:46
 * @Viersion V1.0.1
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    //注入mapper
    @Autowired
    private IEmployeeService employeeService;

    @RequestMapping("/empView")
    public String employeeView() {

        return "employee/employee";
    }

    @RequestMapping("/empAddView")
    public String employeeAddView() {

        return "employee/employeeAdd";
    }

    //解析json
    private Employee jsonData(String data) {
        //解析前台传递的json数据
        JSONObject json = JSON.parseObject(data);
        if (json != null) {
            //{"name":"测试用户1","sex":"男","phone":"18349857548","email":"126@sin.com",
            //"positionId":"2","eduschool":"专科","idcard":"382859958958946","deptId":"1","address":"广州"}
            String name = json.getString("name");
            String sex = json.getString("sex");
            String phone = json.getString("phone");
            String email = json.getString("email");
            String positionId = json.getString("positionId");
            String eduschool = json.getString("eduschool");
            String idcard = json.getString("idcard");
            String deptId = json.getString("deptId");
            String address = json.getString("address");
            Position p = new Position();
            p.setId(Long.parseLong(positionId));
            Department d = new Department();
            d.setId(Long.parseLong(deptId));
            Employee e = new Employee(name, sex, phone, email, p, eduschool,
                    idcard, d, address);
            return e;
        }
        return null;
    }

    //保存数据
    @RequestMapping(value = "/empSave", method = RequestMethod.POST)
    @ResponseBody
    public String employeeSave(@RequestBody JSONObject ob) {
        String data = ob.toJSONString();
        Employee employee = jsonData(data);
        if (employee != null) {
            int insert = employeeService.insert(employee);
            if (insert != 0) {
                return "success";
            }
        }
        return "error";
    }

    //更新
    @RequestMapping("/empUpdate")
    @ResponseBody
    public String update(@RequestBody JSONObject ob) {
        System.out.println("ob.toJSONString() = " + ob.toJSONString());
        String data = ob.toJSONString();
        Employee employee = jsonData(data);
        if (employee != null) {
            int index = employeeService.updateByPrimaryKey(employee);
            if (index != 0) {
                return "success";
            }
        }
        return "error";
    }

    //删除
    @RequestMapping("/empDelete")
    @ResponseBody
    public String delete(@RequestParam("id") Long id) {
        if (id != null) {
            int index = employeeService.deleteByPrimaryKey(id);
            if (index == 0 || index == -1) {
                return "error";
            }
        }
        return "success";
    }

    @RequestMapping(value = "/empList", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> empList(@RequestParam("page") int page, @RequestParam("limit") int limit) {
        //查询所有的数据
        List<Employee> countEmp = employeeService.selectAll();
        //加入分页
        if (page < 0) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<Employee> employeeList = employeeService.selectAll();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        //结果总数
        map.put("count", countEmp.size());
        //结果对象数据
        map.put("data", employeeList);
        System.out.println("map = " + map);
        return map;
    }
}
