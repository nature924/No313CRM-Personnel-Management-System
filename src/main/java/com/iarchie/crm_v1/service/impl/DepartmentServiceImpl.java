package com.iarchie.crm_v1.service.impl;

import com.iarchie.crm_v1.domain.Department;
import com.iarchie.crm_v1.mapper.DepartmentMapper;
import com.iarchie.crm_v1.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类描述信息 部门业务处理类
 *
 * @author Tomlin
 * @ClassName DepartmentServiceImpl
 * @Description: TODO
 * @date 2018/12/25 16:14
 * @Viersion V1.0.1
 */


@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private DepartmentMapper mapper;

    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    public int insert(Department record) {
        return mapper.insert(record);
    }

    public Department selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    public List<Department> selectAll(String keyword) {
        return mapper.selectAll(keyword);
    }

    public int updateByPrimaryKey(Department record) {
        return mapper.updateByPrimaryKey(record);
    }
}
