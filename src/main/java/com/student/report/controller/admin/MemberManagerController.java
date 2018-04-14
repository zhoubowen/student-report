package com.student.report.controller.admin;

import com.student.report.constant.CommonConstant;
import com.student.report.constant.DictionaryConstant;
import com.student.report.entity.Dictionary;
import com.student.report.entity.Member;
import com.student.report.param.MemberQueryParam;
import com.student.report.service.DictionaryService;
import com.student.report.service.MemberService;
import java.util.List;
import java.util.Objects;

import com.student.report.util.MD5Util;
import com.student.report.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({"/admin/member/"})
public class MemberManagerController
{
    @Autowired
    private MemberService memberService;
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping({"index"})
    public ModelAndView index(MemberQueryParam memberQueryParam, PageUtil pageUtil)
    {
        List<Member> list = this.memberService.findForPage(memberQueryParam , pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/member");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        modelAndView.addObject("loginRoleType", memberQueryParam.getLoginRoleType());
        return modelAndView;
    }

    @RequestMapping({"input"})
    public ModelAndView input(Integer memberId)
    {
        Member member = this.memberService.findByMemberId(memberId);
        List<Dictionary> majors = dictionaryService.queryByDicName(DictionaryConstant.MAJOR);
        List<Dictionary> dormitories = dictionaryService.queryByDicName(DictionaryConstant.DORMITORY);
        List<Dictionary> clazzs = dictionaryService.queryByDicName(DictionaryConstant.CLAZZ);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/memberInput");
        modelAndView.addObject("member", member);
        modelAndView.addObject("majors", majors);
        modelAndView.addObject("dormitories", dormitories);
        modelAndView.addObject("clazzs", clazzs);
        return modelAndView;
    }


    @RequestMapping({"save"})
    public String save(Member memer, Integer loginRoleType)
    {
        if(Objects.isNull(memer.getId())){
            memer.setStatus(CommonConstant.VALID);
            memer.setPassword(MD5Util.EncoderByMd5(CommonConstant.DEFAULT_PASSWORD));
            memberService.add(memer);
        }else{

            if(Objects.nonNull(memer.getPassword())){
                memer.setPassword(MD5Util.EncoderByMd5(memer.getPassword()));
            }
            memberService.update(memer);
        }
        if(Objects.nonNull(loginRoleType)){
            return "redirect:/admin/member/index?status="+memer.getStatus()+"&roleType=" + memer.getRoleType() + "&loginRoleType=" + loginRoleType;
        }else {
            return "redirect:/admin/member/index?status="+memer.getStatus()+"&roleType=" + memer.getRoleType();
        }
    }

    @RequestMapping({"delete"})
    public String delete(Integer memberId, Integer roleType)
    {
        Member member = new Member();
        member.setId(memberId);
        member.setStatus(CommonConstant.DELETE);
        this.memberService.update(member);
        return "redirect:/admin/member/index?roleType=" + roleType;
    }
}
