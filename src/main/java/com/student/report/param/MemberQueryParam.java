package com.student.report.param;

/**
 */
public class MemberQueryParam {
    private Integer roleType;
    private Integer status;
    private Integer loginRoleType;

    public Integer getLoginRoleType() {
        return loginRoleType;
    }

    public void setLoginRoleType(Integer loginRoleType) {
        this.loginRoleType = loginRoleType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }
}
