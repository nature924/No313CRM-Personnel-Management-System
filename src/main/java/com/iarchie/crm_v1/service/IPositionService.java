package com.iarchie.crm_v1.service;

import com.iarchie.crm_v1.domain.Position;

import java.util.List;

public interface IPositionService {

    int deleteByPrimaryKey(Long id);

    int insert(Position record);

    Position selectByPrimaryKey(Long id);

    List<Position> selectAll(String keyword);

    int updateByPrimaryKey(Position record);
}
