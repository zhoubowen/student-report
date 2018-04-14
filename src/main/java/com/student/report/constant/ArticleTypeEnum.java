package com.student.report.constant;

/**
 */
public enum ArticleTypeEnum {
    NOTICE(2);
    private int code;

    ArticleTypeEnum(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
