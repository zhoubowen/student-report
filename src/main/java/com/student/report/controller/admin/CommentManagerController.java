package com.student.report.controller.admin;

import com.student.report.entity.Comment;
import com.student.report.param.CommentQueryParam;
import com.student.report.service.CommentService;
import com.student.report.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 */
@Controller
@RequestMapping("/admin/comment/")
public class CommentManagerController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("index")
    public ModelAndView index(CommentQueryParam commentQueryParam, PageUtil pageUtil){
        List<Comment> list = commentService.findForPage(commentQueryParam, pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/comment");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }


}
