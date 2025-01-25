package com.iarchie.crm_v1.service.impl;

import com.iarchie.crm_v1.domain.DocTest;
import com.iarchie.crm_v1.mapper.DocTestMapper;
import com.iarchie.crm_v1.service.IDocTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocTestServiceImpl implements IDocTestService {
    @Autowired
    private DocTestMapper mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(DocTest record) {
        return mapper.insert(record);
    }

    @Override
    public DocTest selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<DocTest> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(DocTest record) {
        return mapper.updateByPrimaryKey(record);
    }
}
