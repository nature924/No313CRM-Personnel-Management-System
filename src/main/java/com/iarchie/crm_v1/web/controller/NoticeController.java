package com.iarchie.crm_v1.web.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.iarchie.crm_v1.domain.DocTest;
import com.iarchie.crm_v1.service.IDocTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private IDocTestService docTestService;

    @RequestMapping("/noticeView")
    public String noticeView(Model model, Integer pageIndex) {
        int pageSize = 5;//每页显示的记录数
        if (pageIndex == null)
            pageIndex = 1;//第一次访问页面默认页面为第一页
        PageHelper.startPage(pageIndex, pageSize);
        List<DocTest> docTests = docTestService.selectAll();
        //得到分页的结果对象
        PageInfo<DocTest> personPageInfo = new PageInfo<>(docTests);
        //得到分页中的person条目对象
        List<DocTest> pageList = personPageInfo.getList();
        model.addAttribute("docList", pageList);
        model.addAttribute("page", personPageInfo);
        return "notice/notice";
    }


    @RequestMapping("/addView")
    public String updateOrAddView() {
        return "notice/noticeAddOrUpdate";
    }

}
