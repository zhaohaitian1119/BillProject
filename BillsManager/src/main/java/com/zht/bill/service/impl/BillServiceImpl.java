package com.zht.bill.service.impl;

import com.zht.bill.mapper.BillsMapper;
import com.zht.bill.pojo.Bills;
import com.zht.bill.pojo.BillsExample;
import com.zht.bill.service.BillService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-08 16:33
 */
@Service("billService")
public class BillServiceImpl implements BillService {

    @Resource
    BillsMapper billsMapper;


    @Override
    public List<Bills> selAll(int typeId, String start, String end) {
        SimpleDateFormat simdate1=new SimpleDateFormat("yyyy-MM-dd");
        BillsExample example = new BillsExample();
        BillsExample.Criteria criteria = example.createCriteria();
        if(typeId!=0){
            criteria.andTypeIdEqualTo(typeId);
        }

        Date data1 = null;
        Date date2 = null;

        if(start != null && end != null){
            try {
              data1 =  simdate1.parse(start);
              date2 =  simdate1.parse(end);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            criteria.andBillTimeBetween(data1,date2);
        }

        List<Bills> bills = billsMapper.selectByExample(example);
        return bills;
    }

    @Override
    public int inser(Bills bills) {
        int i = billsMapper.insertSelective(bills);
        return i;
    }
}
