package com.iarchie.crm_v1.service.impl;

import com.iarchie.crm_v1.domain.Employee;
import com.iarchie.crm_v1.mapper.EmployeeMapper;
import com.iarchie.crm_v1.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 类描述信息 员工业务层
 *
 * @author Tomlin
 * @ClassName EmployeeServiceImpl
 * @Description: TODO
 * @date 2018/12/25 11:33
 * @Viersion V1.0.1
 */
@Service
public class EmployeeServiceImpl implements IEmployeeService {

    //注入mapper
    @Autowired
    private EmployeeMapper mapper;

    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    public int insert(Employee record) {
        if (record != null) {
            return mapper.insert(record);
        }
        return 0;

    }

    public Employee selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    public List<Employee> selectAll() {
        return mapper.selectAll();
    }

    public int updateByPrimaryKey(Employee record) {
        return mapper.updateByPrimaryKey(record);
    }
}
