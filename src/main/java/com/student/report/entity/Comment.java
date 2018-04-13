package com.student.report.entity;

import javax.persistence.*;
import java.util.Date;

/**
 */
@Entity
@Table(name = "t_comment")
public class Comment {
    @Id
    private Integer id;

    @Column(name = "article_id")
    private Integer articleId;

    @Column(name = "member_id")
    private Integer memberId;
    @Transient
    private Member commentMember;

    @Column(name = "content")
    private String content;

    @Column(name = "reply_content")
    private String replyContent;

    @Column(name = "reply_member_id")
    private Integer replyMemberId;

    @Transient
    private Member replyMember;
    private Integer status;
    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Integer getReplyMemberId() {
        return replyMemberId;
    }

    public void setReplyMemberId(Integer replyMemberId) {
        this.replyMemberId = replyMemberId;
    }

    public Member getReplyMember() {
        return replyMember;
    }

    public void setReplyMember(Member replyMember) {
        this.replyMember = replyMember;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Member getCommentMember() {
        return commentMember;
    }

    public void setCommentMember(Member commentMember) {
        this.commentMember = commentMember;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", articleId=" + articleId +
                ", memberId=" + memberId +
                '}';
    }
}
