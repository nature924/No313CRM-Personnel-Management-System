package com.iarchie.crm_v1.service;

import com.iarchie.crm_v1.domain.Employee;

import java.util.List;

public interface IEmployeeService {

    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);
}
