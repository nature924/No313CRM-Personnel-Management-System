package com.iarchie.crm_v1.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Employee {
    private Long id;

    private String name;

    private String sex;

    private String phone;

    private String email;

    private Position positionId;

    private String eduschool;

    private String idcard;

    private Department deptId;

    private String address;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createtime;


    public Employee() {
    }

    public Employee(String name, String sex, String phone, String email, Position positionId, String eduschool, String idcard, Department deptId, String address) {
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.positionId = positionId;
        this.eduschool = eduschool;
        this.idcard = idcard;
        this.deptId = deptId;
        this.address = address;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Position getPositionId() {
        return positionId;
    }

    public void setPositionId(Position positionId) {
        this.positionId = positionId;
    }

    public Department getDeptId() {
        return deptId;
    }

    public void setDeptId(Department deptId) {
        this.deptId = deptId;
    }

    public String getEduschool() {
        return eduschool;
    }

    public void setEduschool(String eduschool) {
        this.eduschool = eduschool == null ? null : eduschool.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }


    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", positionId=" + positionId +
                ", eduschool='" + eduschool + '\'' +
                ", idcard='" + idcard + '\'' +
                ", deptId=" + deptId +
                ", address='" + address + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}