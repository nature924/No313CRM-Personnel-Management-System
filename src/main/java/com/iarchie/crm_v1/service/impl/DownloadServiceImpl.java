package com.iarchie.crm_v1.service.impl;

import com.iarchie.crm_v1.domain.DownloadDco;
import com.iarchie.crm_v1.mapper.DownloadDcoMapper;
import com.iarchie.crm_v1.service.IDownloadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DownloadServiceImpl implements IDownloadService {

    @Autowired
    private DownloadDcoMapper mapper;

    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    public int insert(DownloadDco record) {
        return mapper.insert(record);
    }

    public DownloadDco selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    public List<DownloadDco> selectAll() {
        return mapper.selectAll();
    }

    public int updateByPrimaryKey(DownloadDco record) {
        return mapper.updateByPrimaryKey(record);
    }
}
