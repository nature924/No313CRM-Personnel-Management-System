package com.iarchie.crm_v1.domain;

public class DownloadDco {
    private Long id;

    private String filename;

    private String filepath;

    private String filemsg;

    private String fileadmin;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath == null ? null : filepath.trim();
    }

    public String getFilemsg() {
        return filemsg;
    }

    public void setFilemsg(String filemsg) {
        this.filemsg = filemsg == null ? null : filemsg.trim();
    }

    public String getFileadmin() {
        return fileadmin;
    }

    public void setFileadmin(String fileadmin) {
        this.fileadmin = fileadmin == null ? null : fileadmin.trim();
    }
}