package com.iarchie.crm_v1.domain;

public class DocTest {
    private Long id;

    private String docname;

    private String docmsg;

    private String useraction;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname == null ? null : docname.trim();
    }

    public String getDocmsg() {
        return docmsg;
    }

    public void setDocmsg(String docmsg) {
        this.docmsg = docmsg == null ? null : docmsg.trim();
    }

    public String getUseraction() {
        return useraction;
    }

    public void setUseraction(String useraction) {
        this.useraction = useraction == null ? null : useraction.trim();
    }
}