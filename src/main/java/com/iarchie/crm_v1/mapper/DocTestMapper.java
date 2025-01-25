package com.iarchie.crm_v1.mapper;

import com.iarchie.crm_v1.domain.DocTest;
import java.util.List;

public interface DocTestMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DocTest record);

    DocTest selectByPrimaryKey(Long id);

    List<DocTest> selectAll();

    int updateByPrimaryKey(DocTest record);
}