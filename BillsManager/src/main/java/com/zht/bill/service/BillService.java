package com.zht.bill.service;

import com.zht.bill.pojo.Bills;

import java.util.Date;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-08 16:33
 */
public interface BillService {
    List<Bills> selAll(int typeId, String start,String end);
    int inser(Bills bills);
}
