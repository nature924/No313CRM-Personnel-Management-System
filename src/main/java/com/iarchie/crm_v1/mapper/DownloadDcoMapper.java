package com.iarchie.crm_v1.mapper;

import com.iarchie.crm_v1.domain.DownloadDco;
import java.util.List;

public interface DownloadDcoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DownloadDco record);

    DownloadDco selectByPrimaryKey(Long id);

    List<DownloadDco> selectAll();

    int updateByPrimaryKey(DownloadDco record);
}