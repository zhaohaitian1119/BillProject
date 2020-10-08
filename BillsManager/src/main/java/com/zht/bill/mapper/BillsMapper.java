package com.zht.bill.mapper;

import com.zht.bill.pojo.Bills;
import com.zht.bill.pojo.BillsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BillsMapper {
    int countByExample(BillsExample example);

    int deleteByExample(BillsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Bills record);

    int insertSelective(Bills record);

    List<Bills> selectByExample(BillsExample example);

    Bills selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Bills record, @Param("example") BillsExample example);

    int updateByExample(@Param("record") Bills record, @Param("example") BillsExample example);

    int updateByPrimaryKeySelective(Bills record);

    int updateByPrimaryKey(Bills record);
}