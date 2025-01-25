package com.iarchie.crm_v1.domain;

public class Position {
    private Long id;

    private String positionname;

    private String positionmsg;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPositionname() {
        return positionname;
    }

    public void setPositionname(String positionname) {
        this.positionname = positionname == null ? null : positionname.trim();
    }

    public String getPositionmsg() {
        return positionmsg;
    }

    public void setPositionmsg(String positionmsg) {
        this.positionmsg = positionmsg == null ? null : positionmsg.trim();
    }


    @Override
    public String toString() {
        return "Position{" +
                "id=" + id +
                ", positionname='" + positionname + '\'' +
                ", positionmsg='" + positionmsg + '\'' +
                '}';
    }
}