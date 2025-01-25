package com.iarchie.crm_v1.service.impl;

import com.iarchie.crm_v1.domain.Position;
import com.iarchie.crm_v1.mapper.PositionMapper;
import com.iarchie.crm_v1.service.IPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类描述信息 职位部门管理Controller
 *
 * @author Tomlin
 * @ClassName PositionServiceImpl
 * @Description: TODO
 * @date 2018/12/25 16:01
 * @Viersion V1.0.1
 */

@Service
public class PositionServiceImpl implements IPositionService {


    //注入Mapper
    @Autowired
    private PositionMapper mapper;

    public int deleteByPrimaryKey(Long id) {

        if (!(id == 0 && id == null)) {
            int pid = mapper.deleteByPrimaryKey(id);
            return pid;
        }
        return 0;
    }

    public int insert(Position record) {
        if (record != null) {
            return mapper.insert(record);
        }
        return 0;

    }

    public Position selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    public List<Position> selectAll(String keyword) {
        return mapper.selectAll(keyword);
    }

    public int updateByPrimaryKey(Position record) {
        return mapper.updateByPrimaryKey(record);
    }
}
