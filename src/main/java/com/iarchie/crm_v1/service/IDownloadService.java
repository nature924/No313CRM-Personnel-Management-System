package com.iarchie.crm_v1.service;

import com.iarchie.crm_v1.domain.DownloadDco;

import java.util.List;

public interface IDownloadService {

    int deleteByPrimaryKey(Long id);

    int insert(DownloadDco record);

    DownloadDco selectByPrimaryKey(Long id);

    List<DownloadDco> selectAll();

    int updateByPrimaryKey(DownloadDco record);
}
