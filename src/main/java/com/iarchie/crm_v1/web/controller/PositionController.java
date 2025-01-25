package com.iarchie.crm_v1.web.controller;

import com.github.pagehelper.PageHelper;
import com.iarchie.crm_v1.domain.Position;
import com.iarchie.crm_v1.service.IPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/position")
public class PositionController {


    //注入业务层
    @Autowired
    private IPositionService positionService;

    @RequestMapping("/positionView")
    public String showPosition() {

        return "position/position";
    }

    //删除
    @RequestMapping(value = "/positionDelete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        int index = positionService.deleteByPrimaryKey(id);
        if (index > 0) {
            return "success";
        }
        return "error";
    }

    //添加
    @RequestMapping(value = "/positionAdd", method = RequestMethod.POST)
    @ResponseBody
    public String positionAdd(@RequestBody Position position) {
        int insert = positionService.insert(position);
        if (insert > 0) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("/positionOption")
    @ResponseBody
    public List<Position> positionOption(String keyword) {
        List<Position> positions = positionService.selectAll(keyword);
        return positions;
    }

    @RequestMapping(value = "/addView")
    public String positionAddView() {

        return "position/positionAdd";
    }

    @RequestMapping(value = "/positionList",method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> positionList(@RequestParam("page") int page, @RequestParam("limit") int limit,
                                     String keyword) {
        System.out.println("keyword = " + keyword);
        //查询结果集
        List<Position> countPos = positionService.selectAll(keyword);
        //处理分页
        if (page < 0) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<Position> resultData = positionService.selectAll(keyword);
        //封装列表数据
        Map<String, Object> resultMap = new HashMap<String, Object>() {
            {
                put("code", 0);
                put("msg", "");
                put("count", countPos.size());
                put("data", resultData);
            }
        };
        return resultMap;
    }


}
