package com.iarchie.crm_v1.service;

import com.iarchie.crm_v1.domain.Department;

import java.util.List;

public interface IDepartmentService {

    int deleteByPrimaryKey(Long id);

    int insert(Department record);

    Department selectByPrimaryKey(Long id);

    List<Department> selectAll(String keyword);

    int updateByPrimaryKey(Department record);
}
