package com.zht.bill.controller;

import com.zht.bill.pojo.Bills;
import com.zht.bill.service.BillService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-08 16:30
 */
@Controller
public class BillController {

    @Resource
    BillService billService;

    @RequestMapping("/")
    public String toindex(Model model, HttpServletRequest request, HttpSession session){
        String typeId = request.getParameter("typeId");
        int typeid = 0;
        if(typeId!=null&&!typeId.equals("")){
            typeid = Integer.parseInt(typeId);
        }
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        List<Bills> bills = null;
        if(start == "" || end == ""){
            bills = billService.selAll(typeid,null,null);
        }else{
            bills = billService.selAll(typeid,start,end);
        }
        session.setAttribute("typeId",typeid);
        session.setAttribute("start",start);
        session.setAttribute("end",end);
        model.addAttribute("bills",bills);
        return "index";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        double price = Double.parseDouble(request.getParameter("price"));
        SimpleDateFormat simdate1=new SimpleDateFormat("yyyy-MM-dd");
        String billtime = request.getParameter("billtime");
        Date date = null;
        try {
            date =simdate1.parse(billtime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String explains = request.getParameter("explains");
        String title = request.getParameter("title");
        Bills bills = new Bills();
        bills.setTitle(title);
        bills.setExplains(explains);
        bills.setBillTime(date);
        bills.setTypeId(typeId);
        bills.setPrice(price);
        int inser = billService.inser(bills);
        return "redirect:/";
    }
}
