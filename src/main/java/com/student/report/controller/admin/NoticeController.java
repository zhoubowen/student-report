package com.student.report.controller.admin;

import com.student.report.constant.ArticleTypeEnum;
import com.student.report.constant.CommonConstant;
import com.student.report.entity.Article;
import com.student.report.param.ArticleQueryParam;
import com.student.report.service.ArticleService;
import com.student.report.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 */
@Controller
@RequestMapping("/admin/notice/")
public class NoticeController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("index")
    public ModelAndView index(ArticleQueryParam articleQueryParam, PageUtil pageUtil){
        List<Article> list = articleService.findForPage(articleQueryParam, pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/notice");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("input")
    public ModelAndView input(Integer id){
        Article article = articleService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/noticeInput");
        modelAndView.addObject("article", article);
        return modelAndView;
    }

    @RequestMapping("save")
    public String save(Article article, HttpServletRequest request){
        if(null == article.getId()){
            article.setStatus(CommonConstant.VALID);
            article.setType(ArticleTypeEnum.NOTICE.getCode());
            article.setCreateTime(new Date());
            article.setCreateBy((Integer) request.getSession().getAttribute("memberId"));
            articleService.add(article);
        }else{
            articleService.update(article);
        }
        return "redirect:/admin/notice/index?type=" + article.getType();
    }

    @RequestMapping("delete")
    public String delete(Integer id){
        Article article = new Article();
        article.setId(id);
        article.setStatus(CommonConstant.DELETE);
        articleService.update(article);
        return "redirect:/admin/notice/index?type=" + ArticleTypeEnum.NOTICE.getCode();
    }
}
