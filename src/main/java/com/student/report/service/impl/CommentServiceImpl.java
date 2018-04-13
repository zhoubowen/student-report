package com.student.report.service.impl;

import com.github.pagehelper.PageHelper;
import com.student.report.dto.CommentDTO;
import com.student.report.entity.Article;
import com.student.report.entity.Comment;
import com.student.report.entity.Member;
import com.student.report.mapper.CommentMapper;
import com.student.report.mapper.MemberMapper;
import com.student.report.param.CommentQueryParam;
import com.student.report.service.CommentService;
import com.student.report.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

/**
 */
@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public int add(Comment comment) {
        Date now = new Date();
        comment.setCreateTime(now);
        comment.setUpdateTime(now);
        return commentMapper.insert(comment);
    }

    @Override
    public List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Article.class);
        example.createCriteria().andEqualTo("status", commentQueryParam.getStatus());
        example.setOrderByClause("id DESC");
        List<Comment> list = commentMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            list.forEach(t -> {
                Member commenter = memberMapper.selectByPrimaryKey(t.getMemberId());
                Member replyer = memberMapper.selectByPrimaryKey(t.getReplyMemberId());
                t.setCommentMember(commenter);
                t.setReplyMember(replyer);
            });
        }
        pageUtil.setRecordCount(commentMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        List<CommentDTO> list = commentMapper.findPageCommentByMemberId(memberId);
        pageUtil.setRecordCount(commentMapper.findCountCommentByMemberId(memberId));
        return list;
    }

    @Override
    public List<CommentDTO> findPageCommentByAskId(Integer askId, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        List<CommentDTO> list = commentMapper.findPageCommentByAskId(askId);
        pageUtil.setRecordCount(commentMapper.findCountCommentByAskId(askId));
        return list;
    }

    @Override
    public int update(Comment comment) {
        return commentMapper.updateByPrimaryKeySelective(comment);
    }


}
