package com.iarchie.crm_v1.web.controller;


import com.github.pagehelper.PageHelper;
import com.iarchie.crm_v1.domain.Department;
import com.iarchie.crm_v1.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类描述信息 部门controller类
 *
 * @author Tomlin
 * @ClassName DepartmentController
 * @Description: TODO
 * @date 2018/12/25 10:24
 * @Viersion V1.0.1
 */
@Controller
@RequestMapping("/department")
public class DepartmentController {

    //注入业务
    @Autowired
    private IDepartmentService departmentService;

    @RequestMapping("/deptView")
    public String employeeView() {

        return "department/department";
    }

    //跳转添加页面
    @RequestMapping("/deptAddView")
    public String departmentAddView() {

        return "department/departmentAdd";
    }

    //查询部门所有数据
    @RequestMapping("/deptOption")
    @ResponseBody
    public List<Department> jsonDeptOption(String keyword) {
        List<Department> list = departmentService.selectAll(keyword);
        return list;
    }

    //部门添加
    @RequestMapping(value = "/deptAdd", method = RequestMethod.POST)
    @ResponseBody
    public String departmentAdd(@RequestBody Department dept) {
        int insert = departmentService.insert(dept);
        if (insert < 0) {
            return "error";
        }
        return "success";
    }

    //部门删除
    @RequestMapping(value = "/deptDelete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@RequestParam("id") Long id) {
        if (id != null) {
            int index;
            index = departmentService.deleteByPrimaryKey(id);
            if (index == 0 || index == -1) {
                return "error";
            }
        }
        return "success";
    }

    @RequestMapping(value = "/deptList", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> deptList(@RequestParam int page, @RequestParam int limit,
                                 String keyword) {
        System.out.println("keyword = " + keyword);
        //查询结果总数
        List<Department> countDept = departmentService.selectAll(keyword);
        //分页
        if (page < 0) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<Department> listDept = departmentService.selectAll(keyword);
        //封装json数据
        Map<String, Object> resultMap = new HashMap<String, Object>() {
            {
                put("code", 0);
                put("msg", "");
                put("count", countDept.size());
                put("data", listDept);
            }
        };
        return resultMap;
    }
}
